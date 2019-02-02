load('data/faces');
facesNum=2429;
nonFacesNum=4547;

X(1:2000,:)=features(1:2000,:);
Y(1:2000,:)=labels(1:2000,:);
X(2001:6000,:)=features(2430:6429,:);
Y(2001:6000,:)=labels(2430:6429,:);

Xte(1:429,:)=features(2001:2429,:);
Yte(1:429,:)=labels(2001:2429,:);
Xte(430:976,:)=features(430:976,:);
Yte(430:976,:)=labels(430:976,:);

% X(1:20,:)=features(1:20,:);
% Y(1:20,:)=labels(1:20,:);
% X(21:40,:)=features(2430:2449,:);
% Y(21:40,:)=labels(2430:2449,:);
% 
% Xte(1:10,:)=features(2001:2010,:);
% Yte(1:10,:)=labels(2001:2010,:);
% Xte(11:20,:)=features(430:439,:);
% Yte(11:20,:)=labels(430:439,:);



svmErrors=0;
knnErrors=0;
decisionTreeErrors=0;
ensembleErrors=0;
descErrors=0;

% model=fcihTrainModel(X,Y,'SVM');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'
% 
% for i=1:size(Xte,1)
%     x_new=Xte(i,:);
%     y_new=fcihPredict(model,x_new);
%     if y_new~=Yte(i,1)
%         svmErrors=svmErrors+1;
%     end
% end
% 
% model2=fcihTrainModel(X,Y,'KNN');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'
% 
% for i=1:size(Xte,1)
%     x_new=Xte(i,:);
%     y_new=fcihPredict(model2,x_new);
%     if y_new~=Yte(i,1)
%         knnErrors=knnErrors+1;
%     end
% end
% 
% model3=fcihTrainModel(X,Y,'decisionTree');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'
% 
% for i=1:size(Xte,1)
%     x_new=Xte(i,:);
%     y_new=fcihPredict(model3,x_new);
%     if y_new~=Yte(i,1)
%         decisionTreeErrors=decisionTreeErrors+1;
%     end
% end

model4=fcihTrainModel(X,Y,'ensemble');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model4,x_new);
    if y_new~=Yte(i,1)
        ensembleErrors=ensembleErrors+1;
    end
end

% model5=fcihTrainModel(X,Y,'descriminant');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'
% 
% for i=1:size(Xte,1)
%     x_new=Xte(i,:);
%     y_new=fcihPredict(model5,x_new);
%     if y_new~=Yte(i,1)
%         descErrors=descErrors+1;
%     end
% end

svmErrors
knnErrors
decisionTreeErrors
ensembleErrors
descErrors