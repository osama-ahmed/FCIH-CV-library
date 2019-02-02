imagesNum=43;
negativeImagesNum=29;

featureVectorSize=144;
for i=1:imagesNum
    folder='data/positive/';
    imgName=int2str(i);
    type='.jpg';
    file=[folder imgName type];
    img=imread(file);
    
    img=imresize(img,[28,28]);
  
    featureVector=fcihExtractFeatures(img,'HOG'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen' 'SIFT'
    X(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
    Y(i,1)=1;
end

for i=1:negativeImagesNum
    folder='data/negative/';
    imgName=int2str(i);
    type='.jpg';
    file=[folder imgName type];
    img=imread(file);
    
    img=imresize(img,[28,28]);
  
    featureVector=fcihExtractFeatures(img,'HOG'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
    X(i+imagesNum,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
    Y(i+imagesNum,1)=0;
end

%featureVectorSize=64;
% for i=1:imagesNum
%     folder='data/positive/';
%     imgName=int2str(i);
%     type='.jpg';
%     file=[folder imgName type];
%     img=imread(file);
%     
%     if size(img,3)>1
%     img=rgb2gray(img);
%     end
%     
%     img=imresize(img,[28,28]);
%   
%     featureVector=fcihExtractFeatures(img,'SURF'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
%     X2(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
%     Y2(i,1)=1;
% end

% featureVectorSize=144;
% for i=1:imagesNum
%     folder='data/positive/';
%     imgName=int2str(i);
%     type='.jpg';
%     file=[folder imgName type];
%     img=imread(file);
%     
%     if size(img,3)>1
%     img=rgb2gray(img);
%     end
%     img=imresize(img,[28,28]);
%   
%     featureVector=fcihExtractFeatures(img,'BRISK'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
%     X3(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
%     Y3(i,1)=1;
% end

% featureVectorSize=64;
% for i=1:imagesNum
%     folder='data/positive/';
%     imgName=int2str(i);
%     type='.jpg';
%     file=[folder imgName type];
%     img=imread(file);
%     
%     if size(img,3)>1
%     img=rgb2gray(img);
%     end
%     img=imresize(img,[28,28]);
%   
%     featureVector=fcihExtractFeatures(img,'MSER'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
%     X4(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
%     Y4(i,1)=1;
% end
% 
% % featureVectorSize=144;
% % for i=1:imagesNum
% %     folder='data/positive/';
% %     imgName=int2str(i);
% %     type='.jpg';
% %     file=[folder imgName type];
% %     img=imread(file);
% %     
% %     if size(img,3)>1
% %     img=rgb2gray(img);
% %     end
% %     img=imresize(img,[28,28]);
% %   
% %     featureVector=fcihExtractFeatures(img,'FAST'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
% %     X5(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
% %     Y5(i,1)=1;
% % end
% 
% % featureVectorSize=144;
% % for i=1:imagesNum
% %     folder='data/positive/';
% %     imgName=int2str(i);
% %     type='.jpg';
% %     file=[folder imgName type];
% %     img=imread(file);
% %     
% %     if size(img,3)>1
% %     img=rgb2gray(img);
% %     end
% %     img=imresize(img,[28,28]);
% %   
% %     featureVector=fcihExtractFeatures(img,'harris'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
% %     X6(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
% %     Y6(i,1)=1;
% % end
% 
% % featureVectorSize=144;
% % for i=1:imagesNum
% %     folder='data/positive/';
% %     imgName=int2str(i);
% %     type='.jpg';
% %     file=[folder imgName type];
% %     img=imread(file);
% %     
% %     if size(img,3)>1
% %     img=rgb2gray(img);
% %     end
% %     img=imresize(img,[28,28]);
% %   
% %     featureVector=fcihExtractFeatures(img,'minEigen'); % 'HOG' 'SURF' 'BRISK' 'MSER' 'FAST' 'harris' 'minEigen'
% %     X7(i,1:featureVectorSize)=featureVector(1,1:featureVectorSize);
% %     Y7(i,1)=1;
% % end
