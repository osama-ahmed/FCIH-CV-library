img=imread('data/5.jpg');
%features=fcihExtractFeatures(img,'SIFT');
[features,descriptors]=vl_sift(single(img));

% figure;imshow(img);
% hold on;
% x=features(1,1);
% y=features(2,1);
% scale=features(3,1);
% orient=features(4,1);
% rectangle('position',[x,y,50,50]);