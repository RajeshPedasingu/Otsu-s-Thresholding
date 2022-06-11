

function out=otsu(image)
figure;
imshow(image);
title('given image')

img=image(:,:,1);
img1=double(img);
img2=img1(:);
j=0;
for i=1:256
    p(i)=sum(img2==j);
    j=j+1;   
end
y=p;
a=y;
for i=1:length(a)
    th=i-1;
if th==0 
    k1=0;
    k2=y(th+1:length(y));
    wb=sum(k1)/sum(a);
    wf=sum(k2)/sum(a);
    m1=0;
    m2=sum(k2.*[th:length(y)-1])/sum(k2);

elseif th==255
    k1=y(1:th);
    k2=0;
    wb=sum(k1)/sum(a);
    wf=sum(k2)/sum(a);
    m1=sum(k1.*[0:th-1])/sum(k1);
    m2=0;
else
    k1=y(1:th);
    k2=y(th+1:length(y));
    if sum(k1)==0
        wb=0;
        m1=0;
    elseif sum(k2)==0
        wf=0;
        m2=0;
    else
    wb=sum(k1)/sum(a);
    wf=sum(k2)/sum(a);
    m1=sum(k1.*[0:th-1])/sum(k1);
    m2=sum(k2.*[th:length(y)-1])/sum(k2);
    end
end

Bth(i)=wb*wf*(m1-m2)^2;%between class variance
end
Bth;
x1=max(Bth);

x2 = find(Bth==x1);
threshold(img,x2);
out=x2;
Img_histogram(image,out) ;

end


