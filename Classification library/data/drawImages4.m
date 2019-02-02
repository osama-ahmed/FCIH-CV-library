load('MNIST.mat');

for i=1:60000
current=Xtr(i,:);
img=reshape(current,28,28);
%imshow(img);

name=['MNIST/train/' int2str(i) '.jpg'];
imwrite(img,name);
end

for i=1:10000
current=Xte(i,:);
img=reshape(current,28,28);
%imshow(img);

name=['MNIST/test/' int2str(i) '.jpg'];
imwrite(img,name);
end