load('myDataset2.mat');

for i=1:60
current=Xtr(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['myDataset2/train/' int2str(i) '.jpg'];
imwrite(img,name);
end

for i=1:26
current=Xte(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['myDataset2/test/' int2str(i) '.jpg'];
imwrite(img,name);
end