clear all
clc
%%
%load dataset
faceDatabase= imageSet('dataSet','recursive');
%% Face detector
Fdetect= vision.CascadeObjectDetector();
%%
%split dataset in training and test set
[training, test]=partition(faceDatabase,[0.8,0.2]);
%%
% extract HOG feature from training set 
featureCount=1;

for i=1:size(training,2)
    for j= 1:training(i).Count
        Image= read(training(i),j);
        BB= step(Fdetect,Image);
        if(size(BB,1)==0)
            disp("problem here")
            face=Image;
        else 
            [m, p]= max(BB(:,3));
            try
               face=imcrop(Image,BB(p,:));
            catch ME
               disp("found one");
            end
        end
        face= imresize(face,[224,224]);
        X(featureCount,:)= extractHOGFeatures(face);
        y{featureCount}= training(i).Description;
        featureCount= featureCount+1;
    end
end

disp("training Set image collected")


%%
% MatLab multiclass SVM classifier
faceClassifier= fitcecoc(X,y);
%%
% TrainingSet accuracy calculation
pred= predict(faceClassifier, X);
pd=zeros(size(X,1),1);

for i=1:size(X,1)
    if(strcmp(pred{i},y{i}))
        pd(i)=1;
    end
end

fprintf('\nTraining Set Accuracy: %f\n', mean(pd) * 100);

%%
% extract HOG feature from Test set
featureCount=1;
for i=1:size(test,2)
    for j=1:test(i).Count
        try 
         Image=read(test(i),j);
        catch ME
            disp("problem to read");
            continue;
        end
        if(size(Image,3)==3)
        Image=rgb2gray(Image);
        end
        BB= step(Fdetect,Image);
        [m,i]=max(BB(:,3));
        if(size(BB,1)==0) 
            continue;
        end
        try
        face=imcrop(Image,BB(i,:));
        catch ME
            disp("found one")
        end
        face= imresize(face,[224,224]);
        Xtest(featureCount,:)= extractHOGFeatures(face);
        ytest{featureCount}= test(i).Description;
        featureCount= featureCount+1;
    end
end

 disp("test Set image collected")
%%
% Test Set accuracy calculation
testPred= predict(faceClassifier, Xtest);

pdt=zeros(size(Xtest,1),1);
for i=1:size(Xtest,1)
    if(strcmp(testPred{i},ytest{i})==1)
        pdt(i)=1;
    end
end

fprintf('\nTest Set Accuracy: %f\n', mean(pdt) * 100);

%%
% Predictions from Live image.
takeImage_predict(faceClassifier);
%collectImage("name")

