
%--histogram---
function out=Img_histogram(image,h)
img1=image;
img=img1(:);
j=0;
for i=1:256
    p(i)=sum(img==j);
    j=j+1;   
end

y=p;
x=0:255;

figure;
bar(x,y,1)
hold on
x = [h h];
y = [0 2*max(y)/3];
line(x,y,'Color','red','LineStyle','--')

title('histogram  ')
xlabel('pixel intensity values')
ylabel('frequency of pixel intensities')
legend('histogram of image','threshold value')
hold off
out=y;
end
