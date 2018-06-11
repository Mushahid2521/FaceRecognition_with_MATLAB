function   takeImage_predict(classifier)

cam=webcam;
Fdetect= vision.CascadeObjectDetector();
pause(0)


 while true  
    img= snapshot(cam);
    pause(.5);
    BB=step(Fdetect,img);
    
    if(size(BB,1)==0) 
        disp("found no one");
        imshow(img);
        %continue
    else
        for i=1:size(BB,1)
             try
             fa=imcrop(img,BB(i,:));
             catch ME
                 disp("crop problem");
                 clear('fa');
                 continue;
             end
             fa=imresize(fa,[224,224]);
             feature=extractHOGFeatures(fa);
             name=predict(classifier,feature);
             disp(name);
             position=[(BB(i,1)+BB(i,3)) (BB(i,2)+BB(i,3))];
             img = insertText(img,position,name,'FontSize',10,'BoxColor',...
                              'red','BoxOpacity',0.4,'TextColor','white');
             img= insertShape(img,'rectangle',BB(i,:));
             imshow(img)
        end 
%clear('cam')
    end


end

