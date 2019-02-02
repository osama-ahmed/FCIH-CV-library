load('MNISTBinary.mat');

for i=1:12700
current=Xtr(i,:);
img=reshape(current,28,28);
%imshow(img);

name=['MNISTBinary/train/' int2str(i) '.jpg'];
imwrite(img,name);
end

for i=1:2167
current=Xte(i,:);
img=reshape(current,28,28);
%imshow(img);

name=['MNISTBinary/test/' int2str(i) '.jpg'];
imwrite(img,name);
end