# FaceRecognition_with_MATLAB
In this project a facial recognition system was built using MATLAB. 
Histogram of Oriented Gradients (HOG) has been used as feature and SVM as classifier. The basic technique for all types of facial recognition using hand-coded feature is similar. So just changing the feature extractor we can use this project with different feature and increase its accuracy adding multiple features. 

There are also two other functions, one of which collect images if we want to add new member in dataset and other function shows the live detection and recognition. 

## Usage
- Use ``` collectImage``` to take 20 pictures for new member in the dataset. And make a folder with the person name in data folder.
- In the ```main.mat``` file locate the image folder directory in *imageset()* function.
- Run the other sections upto getting the training set and test set accuracy. 
- ```takeImage_predict.m``` takes continuous image and predicts with a bounding box. 
