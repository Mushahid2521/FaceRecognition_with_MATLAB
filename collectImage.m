function  collectImage(name)
 
cam=webcam;
preview(cam)
pause(4);

for i=1:20
    pause(1);
    snap=snapshot(cam);
    baseName=sprintf('%s_%d.jpg',name,i);
    imwrite(snap,baseName);
end

clear('cam');