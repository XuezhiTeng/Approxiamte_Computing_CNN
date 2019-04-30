#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x59d6e14e, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0xa9d2055e, __VMLINUX_SYMBOL_STR(single_release) },
	{ 0xfd5fd01e, __VMLINUX_SYMBOL_STR(seq_read) },
	{ 0x5b59901d, __VMLINUX_SYMBOL_STR(seq_lseek) },
	{ 0xdcde339d, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0xa2c0d80, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x3ce59a59, __VMLINUX_SYMBOL_STR(proc_create_data) },
	{ 0x79c5a9f0, __VMLINUX_SYMBOL_STR(ioremap) },
	{ 0x9416e1d8, __VMLINUX_SYMBOL_STR(__request_region) },
	{ 0x2712c7f, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0xaf237ed0, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0x32102194, __VMLINUX_SYMBOL_STR(misc_register) },
	{ 0x9b73b3ed, __VMLINUX_SYMBOL_STR(seq_printf) },
	{ 0xd732698c, __VMLINUX_SYMBOL_STR(single_open) },
	{ 0xbe67aae8, __VMLINUX_SYMBOL_STR(kill_fasync) },
	{ 0x85f74b00, __VMLINUX_SYMBOL_STR(iomem_resource) },
	{ 0x192bf643, __VMLINUX_SYMBOL_STR(remove_proc_entry) },
	{ 0xc506ab1b, __VMLINUX_SYMBOL_STR(misc_deregister) },
	{ 0x8f704705, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0x2ab3cc9d, __VMLINUX_SYMBOL_STR(__release_region) },
	{ 0xedc03953, __VMLINUX_SYMBOL_STR(iounmap) },
	{ 0xf20dabd8, __VMLINUX_SYMBOL_STR(free_irq) },
	{ 0xf4fa543b, __VMLINUX_SYMBOL_STR(arm_copy_to_user) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0x822137e2, __VMLINUX_SYMBOL_STR(arm_heavy_mb) },
	{ 0x353e3fa5, __VMLINUX_SYMBOL_STR(__get_user_4) },
	{ 0xbc10dd97, __VMLINUX_SYMBOL_STR(__put_user_4) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xf5bcf528, __VMLINUX_SYMBOL_STR(fasync_helper) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Cxlnx,gemm-lab4-1.0");
MODULE_ALIAS("of:N*T*Cxlnx,gemm-lab4-1.0C*");
