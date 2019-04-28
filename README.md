# Approxiamte_Computing_CNN 

EE382M - Low Power and Robustness Design - Akhila Bhat & Xuezhi Teng

### 1. What is project about?

Darknet is a CNN simulator written in C. What we need to do is changing the adders and multipliers to approximate version, maintaining a reletively high accuracy.

### 2. How to run the orignal(unmodified) program?

* Enter folder "/darknet", then type in "make" to compile the program.
* We will be using the pre-trained Tiny YOLO CNN for small and embedded devices. Get the pre-trained weight model from the following link: 

  `% wget https://pjreddie.com/media/files/yolov3-tiny.weights` 
  
   Of course, we can use other kinds of weights and models. Please see the README file inside the darknet to get more details. And finally, we need to be able to use the weights obtained by our own trainning.
* To run the CNN detector, use the command line: 

  `% ./darknet detect cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg`
  
  Here we are using the "dog.jpg" to perform the detection

