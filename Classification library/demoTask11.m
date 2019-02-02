load('data/taskDataset');

X=[Xtr Ytr];
X = X(randperm(size(X,1)),:);
Xtr=X(:,1:256);
Ytr=X(:,257);

X=Xtr(1:800,:);
Y=Ytr(1:800,:);

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

model2=fcihTrainModel(X,Y,'KNN');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model2,x_new);
    result2(i,1)=y_new;
    if y_new~=Yte(i,1)
        knnErrors=knnErrors+1;
    end
end

model3=fcihTrainModel(X,Y,'decisionTree');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model3,x_new);
    if y_new~=Yte(i,1)
        decisionTreeErrors=decisionTreeErrors+1;
    end
end

model4=fcihTrainModel(X,Y,'ensemble');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model4,x_new);
    if y_new~=Yte(i,1)
        ensembleErrors=ensembleErrors+1;
    end
end

model5=fcihTrainModel(X,Y,'descriminant');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model5,x_new);
    if y_new~=Yte(i,1)
        descErrors=descErrors+1;
    end
end

svmErrors
svmRate=((size(Xte,1)-svmErrors)/size(Xte,1))*100
knnErrors
knnRate=((size(Xte,1)-knnErrors)/size(Xte,1))*100
decisionTreeErrors
decisionTreeRate=((size(Xte,1)-decisionTreeErrors)/size(Xte,1))*100
ensembleErrors
ensembleRate=((size(Xte,1)-ensembleErrors)/size(Xte,1))*100
descErrors
descRate=((size(Xte,1)-descErrors)/size(Xte,1))*100
