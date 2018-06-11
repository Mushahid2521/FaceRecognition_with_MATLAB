# FaceRecognition_with_MATLAB
In this project a facial recognition system was built using MATLAB. 
Histogram of Oriented Gradients (HOG) has been used as feature and SVM as classifier. The basic technique for all types of facial recognition using hand-coded feature is similar. So just changing the feature extractor we can use this project with different feature and increase its accuracy adding multiple features. 

There are also two other functions, one of which collect images if we want to add new member in dataset and other function shows the live detection and recognition. 

## Usage
- Use ``` collectImage``` to take 20 pictures for new member in the dataset. And make a folder with the person name in data folder.
- In the ```main.m``` file locate the image folder directory in *imageset()* function.
- Run the other sections upto getting the training set and test set accuracy. 
- Run ```takeImage_predict.m``` which takes continuous image and shows predictions with a bounding box. 

## Note:
- No need to take the image of face only. It finds the face itself and use the face for training and prediction. 
## Dependency:
- Support package for USB webcam

## Example:
 ![sample](https://github.com/Mushahid2521/FaceRecognition_with_MATLAB/blob/master/sample.jpg)
