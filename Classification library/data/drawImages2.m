load('myDataset.mat');

dataset=dataset';

for i=1:86
current=dataset(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['myDataset/train/' int2str(i) '.jpg'];
imwrite(img,name);
end