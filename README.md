# Approxiamte_Computing_CNN 

## EE382M - Low Power and Robustness Design - Akhila Bhat & Xuezhi Teng

## Experimental Set Up: luigi.ece.utexas.edu

### 1. What is project about?

Darknet is a CNN simulator written in C. What we need to do is changing the adders and multipliers to approximate version, maintaining a reletively high accuracy.

### 2. How to run the orignal(unmodified) program?

* Enter folder "/darknet", then type in "make" to compile the program.
* We will be using the pre-trained Tiny YOLO CNN for small and embedded devices. Get the pre-trained weight model from the following link: 

  `% wget https://pjreddie.com/media/files/yolov3-tiny.weights` 
  
   Of course, we can use other kinds of weights and models. Please see the README file inside the darknet to get more details. And finally, we need to be able to use the weights obtained by our own trainning.
   
   Here is a bigger model:
   
   ` % wget https://pjreddie.com/media/files/yolov3.weights`
   
* To run the **tiny** CNN detector, use the command line: 

  `% ./darknet detect cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg`
  
  Here we are using the "dog.jpg" to perform the detection. Also, there are some other pictures in the "/data" folder. change the name of picture that you want to test. You will see the results in the terminal.
  
  The following command line is used to run the bigger detector model:
  
  `% ./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights -thresh 0.25 data/dog.jpg`
  
  _This only works in the /misc/srcatch_
  

### 3. What does the result of detection look like?

Besides the reports in the terminal, there is a picture called "prediction.png" which shows you the detection result.

### 4. What do we need to do next?

We need to modify the "gemm.c" file to replace the accurate adder and multiplier with approxiamte ones. And re-train the CNN model to get new weights. Finally, we do the detection again and compare the result with original model.

### 5. How do we identify the bottleneck of the codes?

* Before you can profile your program, you must first recompile it specifically for profiling. To do so, add the **-pg** option the CFLAGS line in the Makefile. Then, recompile the code:

  `% make clean`

  `% make`

* Profile the code using:

  `% ./darknet detector test cfg/coco.data cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg`

  Or:

  `% ./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights -thresh 0.25 data/dog.jpg`
  
   _This only works in the /misc/srcatch_

  This command uses the expanded, general form of the above detect shortcut in darknet. It has the advantage that it does not overwrite the reference data/dog.txt output file by default (unless the –save_labels option is included). This will allow us to use the original reference output as ground truth to compare against when we start making modifications and optimizations of Darknet as discussed below.

* Running the program to completion causes a file named gmon.out to be created in the current directory. gprof works by analyzing the data collected during the execution of your program after your program has finished running. gmon.out holds this data in a gprof-readable format.

* Run gprof as follows:

  `% gprof darknet gmon.out > darknet.perf`

* Open the darknet.perf using any text editor that you like.

### 6. How to measure the accuracy of our prediction?

* First, we need to generate the img.txt file, which contains the feature of original detection. Run this command line in darknet_backup:

  `% ./darknet detect cfg/yolov3.cfg yolov3.weights -i 0 -thresh 0.25 data/dog.jpg`
  
* Then, copy the **dog.txt**, for example, to the /darknet/data.

* Then use these commands lines to generate mAp information:
  
  `% echo "data/dog.jpg" > coco_testdev`
  
  `% ./darknet detector map cfg/coco.data cfg/yolov3.cfg yolov3.weights`
  


