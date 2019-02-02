function features=fcihExtractFeatures(image,featureType)

if strcmp(featureType,'HOG')
    features=extractHOGFeatures(image);
    
elseif strcmp(featureType,'SURF')
    points=detectSURFFeatures(image);
    features=extractFeatures(image,points);
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
elseif strcmp(featureType,'BRISK')
    points=detectBRISKFeatures(image);
    features=extractFeatures(image,points);
    features=features.Features;
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
elseif strcmp(featureType,'MSER')
    points=detectMSERFeatures(image);
    features=extractFeatures(image,points);
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);

elseif strcmp(featureType,'FAST')
    points=detectFASTFeatures(image);
    features=extractFeatures(image,points);
    features=features.Features;
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
elseif strcmp(featureType,'harris')
    points=detectHarrisFeatures(image);
    features=extractFeatures(image,points);
    features=features.Features;
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
elseif strcmp(featureType,'minEigen')
    points=detectMinEigenFeatures(image);
    features=extractFeatures(image,points);
    features=features.Features;
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
elseif strcmp(featureType,'SIFT')
    [features,descriptors]=vl_sift(single(image));
    %vectorSize=size(features,1)*size(features,2);
    %featureVector=reshape(features,1,vectorSize);
    
end
    
end