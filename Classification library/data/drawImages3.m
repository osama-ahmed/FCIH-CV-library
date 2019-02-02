load('HOGDataset.mat');

for i=1:72
current=X(i,:);
img=reshape(current,12,12);
%imshow(img);

name=['HOGDataset/train/' int2str(i) '.jpg'];
imwrite(img,name);
end