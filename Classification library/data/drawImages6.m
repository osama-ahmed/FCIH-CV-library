load('abdelRazekDataset.mat');

for i=1:226
current=X(i,:);
img=reshape(current,16,16);
%imshow(img);

name=['abdelRazekDataset/train/' int2str(i) '.jpg'];
imwrite(img,name);
end