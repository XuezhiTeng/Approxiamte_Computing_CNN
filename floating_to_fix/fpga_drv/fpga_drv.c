/*
 *  fpga_drv.c
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/version.h>
#include <linux/errno.h>
#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/interrupt.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/io.h>
#include <linux/vmalloc.h>
#include <linux/mman.h>
#include <linux/ioport.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/miscdevice.h>
#include <asm/uaccess.h>
#include <asm/io.h>

#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>

#ifndef CONFIG_OF  // If no device-tree support in kernel, turn it off here
#define NO_DTS
#endif

#define fpga_VERSION "1.0"
#define fpga_NAME    "fpga_drv"

/* Without device-tree support, compile in hardcoded resource info */
#ifdef NO_DTS
#define INTERRUPT 46   // This is the linux-mapped irq, not the HW/GIC irq.
                       // Can be found by (GIC IRQ is 61 for this example):
                       //   grep 61 /proc/sys/kernel/irq/*/hwirq

#define FPGA_BASE    0x43c00000
#endif

#define FPGA_MASK    0x000fffff
#define FPGA_SIZE    0x00100000

#define COMMAND_MASK 0x80000000

MODULE_AUTHOR("gerstl@ece.utexas.edu");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("FPGA Device Driver");

#define DRIVER_NAME "fpga"

#ifdef NO_DTS
/* command line parameters */
unsigned install = 0;
module_param(install, int, S_IRUGO);
#endif

/* count of received interrupts */
int interruptcount = 0;

/* instance-specific driver-internal data structure */
static struct fpga_drv_local {
  int irq;
  unsigned long mem_start;
  unsigned long mem_end;
  volatile unsigned int *fpga_ptr;
  unsigned int offset;
  struct proc_dir_entry *fpga_interrupt_file;
  struct fasync_struct *fasync_fpga_queue ;
} l;

DECLARE_WAIT_QUEUE_HEAD(fpga_wait);


/* =========================================================================
 * Interrupt handling
 */

/* Interrupt handler */
static irqreturn_t fpga_int_handler(int irq, void *lp)
{
   interruptcount++;

//#ifdef DEBUG
   //printk(KERN_INFO "\nfpga_drv: Interrupt detected in kernel \n");
//#endif

   /* acknowledge/reset the interrupt by clearing the interrup status register */
   writel(1ul, (volatile unsigned int *)&l.fpga_ptr[3]);

   /* Signal the user application that an interupt occured */
   kill_fasync(&((struct fpga_drv_local*)lp)->fasync_fpga_queue, SIGIO, POLL_IN);

   return IRQ_HANDLED;
}


/* =========================================================================
 * Driver access methods
 */

/* Driver access routines */
static int fpga_open1 (struct inode *inode, struct file *file) {
   return 0;
}

static int fpga_release1 (struct inode *inode, struct file *file) {
   return 0;
}

static int fpga_fasync1 (int fd, struct file *filp, int on)
{
//#ifdef DEBUG
   //printk(KERN_INFO "\nfpga_drv: Inside fpga_fasync \n");
//#endif
   return fasync_helper(fd, filp, on, &l.fasync_fpga_queue);

} 

static ssize_t fpga_write1(struct file *filp, const char __user *buf, size_t count, loff_t *offp)
{
    int not_copied;

//#ifdef DEBUG
    //printk(KERN_INFO "\nfpga_drv: receive write command to fpga \n");
//#endif    

    not_copied = copy_from_user((void *)l.fpga_ptr, buf, count);

    return count - not_copied;

}

static ssize_t fpga_read1(struct file *filp, char __user *buf, size_t count, loff_t *offp)
{
    int not_copied;

//#ifdef DEBUG
    //printk(KERN_INFO "\nfpga_drv: receive read command from fpga \n");
//#endif    

    not_copied  = copy_to_user(buf, (void *)l.fpga_ptr, count);

    return count - not_copied;
}

static long fpga_ioctl1(struct file *file, unsigned int cmd, unsigned long arg) {

   int retval = 0;
   unsigned long value;
   unsigned int command_type;
   unsigned int offset;
   volatile unsigned int *access_addr;

//#ifdef DEBUG
   //printk(KERN_INFO "\nfpga_drv: Inside fpga_ioctl1 \n");
//#endif

   // Set the offset for register accesses
   offset = ~COMMAND_MASK & cmd & FPGA_MASK;
   if(offset > FPGA_SIZE)
      retval=-EINVAL;

   command_type = COMMAND_MASK & cmd;
   switch(command_type)
   {
      case 0:
         //read
         if(!access_ok(VERIFY_READ, (unsigned int *)arg, sizeof(int)))
            return -EFAULT;

	 value = readl((volatile unsigned int *)&l.fpga_ptr[offset]);
	 put_user(value, (unsigned long*)arg);

//#ifdef DEBUG
        // printk("fpga_drv: Read value %08lx\n", value);
//#endif
         break;

      case COMMAND_MASK:
         //write
         access_addr = l.fpga_ptr + offset;

         if(!access_ok(VERIFY_WRITE, (unsigned int *)arg, sizeof(int)))
            return -EFAULT;

         get_user(value, (unsigned long *)arg);
         writel(value, access_addr); 

//#ifdef DEBUG
         //printk("fpga_drv: Wrote value %08lx\n", value);
//#endif
         break;

      default:
//#ifdef DEBUG
         printk(KERN_ERR "fpga_drv: Invalid command \n");
//#endif
         retval = -EINVAL;
   }

   return retval;
}

/* define which file operations are supported by the driver */
struct file_operations fpga_fops = {
   .owner   = THIS_MODULE,
   .llseek  = NULL,
   .read    = fpga_read1,
   .write   = fpga_write1,
   .iterate = NULL,
   .poll    = NULL,
   .compat_ioctl = NULL,
   .unlocked_ioctl = fpga_ioctl1,
   .mmap    = NULL,
   .open    = fpga_open1,
   .flush   = NULL,
   .release = fpga_release1,
   .fsync   = NULL,
   .fasync  = fpga_fasync1,
   .lock    = NULL,
   .sendpage = NULL,
   .get_unmapped_area = NULL,
   .check_flags = NULL,
   .flock = NULL,
   .splice_write = NULL,
   .splice_read = NULL,
   .setlease = NULL,
   .fallocate = NULL,
   .show_fdinfo = NULL
};


/* =========================================================================
 * /proc entry
 */

/* Operations for /proc filesystem accesses */
static int proc_read_fpga_interrupt(struct seq_file *f, void *v)
{
  seq_printf(f, "Total number of interrupts %19i\n", interruptcount);

  return 0;
}

static int proc_open_fpga_interrupt(struct inode *inode, struct  file *file) {
  return single_open(file, proc_read_fpga_interrupt, NULL);
}

/* operations supported on the /proc entry */
static const struct file_operations proc_fops = {
  .owner = THIS_MODULE,
  .open = proc_open_fpga_interrupt,
  .read = seq_read,
  .llseek = seq_lseek,
  .release = single_release,
};


/* =========================================================================
 * Device handling
 */

/* /dev entry */
static struct miscdevice fpga_miscdev = {
        .minor =        MISC_DYNAMIC_MINOR,
        .name =         DRIVER_NAME,
        .fops =         &fpga_fops,
        .mode =	        S_IRUGO | S_IWUGO,
};


/* probbe and install module instance for device */
static int fpga_drv_probe (struct platform_device *pdev) 
{
  struct resource *r_irq; /* Interrupt resources */
  struct resource *r_mem; /* IO mem resources */
  struct device *dev = &pdev->dev;

   int rv = -EBUSY;

   dev_info(dev, "FPGA Device Tree Probing\n");

   // register device with the kernel
   if (misc_register(&fpga_miscdev)) 
   {
      dev_err(dev, "fpga_drv: unable to register device. ABORTING!\n");
      return -EBUSY;
   }

   // get memory region assigned to the device
   r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   if (!r_mem) {
     dev_err(dev, "fpga_drv: invalid address\n");
     rv = -ENODEV;
     goto no_mem;
   }

   l.mem_start = r_mem->start;
   l.mem_end = r_mem->end;

   // perform memory REMAP
   if(!request_mem_region(l.mem_start, l.mem_end - l.mem_start + 1, fpga_NAME))
   {
      dev_err(dev, "fpga_drv: Unable to acquire FPGA address.\n");
      goto no_mem;
   }

   l.fpga_ptr = (volatile unsigned int *)ioremap_nocache(l.mem_start, 
                                                 l.mem_end - l.mem_start + 1);
   if (!l.fpga_ptr)
   {
      dev_err(dev, "fpga_drv: Unable to map FPGA.\n");
      goto no_mem;
   }

   dev_info(dev, "fpga_drv: 0x%08lx size 0x%08lx mapped to 0x%08x\n", 
            l.mem_start, l.mem_end - l.mem_start + 1, 
            (unsigned int)l.fpga_ptr);
   dev_info(dev, "fpga_drv: using (major, minor) number (10, %d) on %s\n", 
            fpga_miscdev.minor, DRIVER_NAME); 

   // create /proc file system entry
   l.fpga_interrupt_file = proc_create(DRIVER_NAME, 0444, NULL, &proc_fops);
   if(l.fpga_interrupt_file == NULL)
   {
      dev_err(dev, "fpga_drv: create /proc entry returned NULL. ABORTING!\n");
      rv = -ENOMEM;
      goto no_proc;
   }

   // get the interrupt assigned to the device
   r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
   if (!r_irq) {
     dev_info(dev, "fpga_drv: no IRQ found\n");
     goto no_fpga_interrupt;
   } 

   l.irq = r_irq->start;

   // request interrupt from linux 
   rv = request_irq(l.irq, &fpga_int_handler, 0, DRIVER_NAME,  &l);
   if (rv)
   {
      dev_err(dev, "fpga_drv: Can't get interrupt %d: %d\n", l.irq, rv);
      goto no_fpga_interrupt;
   }

   dev_info(dev, "fpga_drv: using interrupt %d\n", l.irq);

   // everything initialized
   dev_info(dev, "fpga_drv: %s %s Initialized\n", fpga_NAME, fpga_VERSION);
   return 0;

   // error handling
no_fpga_interrupt:
   remove_proc_entry(DRIVER_NAME, NULL);
no_proc:
   release_mem_region(l.mem_start, l.mem_end - l.mem_start + 1);
no_mem:
   misc_deregister(&fpga_miscdev);
   return rv;
}

/* remove driver from kernel */
static int fpga_drv_remove (struct platform_device *pdev) 
{
   struct device *dev = &pdev->dev;

   // free interrupt
   free_irq(l.irq, &l);

   // unmap memory
   iounmap((void *)l.fpga_ptr);
   release_mem_region(l.mem_start, l.mem_end - l.mem_start + 1);
   dev_info(dev, "fpga_drv: Device released.\n");

   // de-register driver with kernel
   misc_deregister(&fpga_miscdev);

   // remove /proc entry
   remove_proc_entry(DRIVER_NAME, NULL);

   dev_info(dev, "fpga_drv: %s %s removed\n", fpga_NAME, fpga_VERSION);

   return 0;
}

#ifdef CONFIG_OF
static struct of_device_id fpga_drv_of_match[] = {
        { .compatible = "xlnx,gemm-lab4-1.0",},
	{ /* end of list */ },
};
MODULE_DEVICE_TABLE(of, fpga_drv_of_match);
#else
# define fpga_drv_of_match
#endif


static struct platform_device *fpga_dev = NULL;

/* Kernel driver data structure */
static struct platform_driver fpga_driver = {
  .driver = {
    .name = DRIVER_NAME,
    .owner = THIS_MODULE,
    .of_match_table = fpga_drv_of_match,
  },
  .probe          = fpga_drv_probe,
  .remove         = fpga_drv_remove,
};

#ifdef NO_DTS
/* Resources assigned to device */ 
static const struct resource fpga_resources[] = {
  {
    .start= FPGA_BASE,
    .end=   FPGA_BASE+FPGA_SIZE-1,
    .flags= IORESOURCE_MEM,
    .name= "io-memory"
    },
  {
    .start= INTERRUPT,
    .end= INTERRUPT,
    .flags= IORESOURCE_IRQ,
    .name= "irq",
    }
};
#endif

/* =========================================================================
 * Module handling
 */

/* Load and initialize module */
static int __init fpga_init_module(void)
{
   int rv = 0;

#ifdef DEBUG
   printk("FPGA Interface Module\n");
   printk(KERN_INFO "\nfpga_drv: FPGA Driver Loading.\n");
#endif

   // register driver with kernel
   rv = platform_driver_register(&fpga_driver);
   if (rv) return rv;

#ifdef NO_DTS
   // if we are asked to install the device, register (and hence probe) it
   if(install) {
     fpga_dev = platform_device_register_simple(DRIVER_NAME, -1, 
                                                &(fpga_resources[0]), 2);
     if (IS_ERR(fpga_dev)) {
       rv = PTR_ERR(fpga_dev);
       platform_driver_unregister(&fpga_driver);
       return rv;
     }
   }
#endif   

   return 0;
}

/* Unload module */
static void __exit fpga_cleanup_module(void)
{
  if(fpga_dev) platform_device_unregister(fpga_dev);
  platform_driver_unregister(&fpga_driver);
#ifdef DEBUG
  printk(KERN_ALERT "fpga_drv: Unloading.\n");
#endif
}

module_init(fpga_init_module);
module_exit(fpga_cleanup_module);
