load('twoClasses.mat');

for i=1:67
current=Xtr(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['twoClasses/train/' int2str(i) '.jpg'];
imwrite(img,name);
end

for i=1:17
current=Xte(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['twoClasses/test/' int2str(i) '.jpg'];
imwrite(img,name);
end