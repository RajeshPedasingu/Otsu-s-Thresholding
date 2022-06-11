

%thresholding
function out=threshold(image,threshold)
th=threshold;
img1=image;


img1(img1<th)=0;
img1(img1>=th)=255;

figure;
imshow(img1)
title('after thresholding')
out=img1;
end
%thresholding

