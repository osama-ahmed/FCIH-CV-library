load('data/HOGDataset');
Xtr(1:30,:)=X(1:30,:);
Xtr(31:50,:)=X(44:63,:);
Ytr(1:30,:)=Y(1:30,:);
Ytr(31:50,:)=Y(44:63,:);    

Xte(1:13,:)=X(31:43,:);
Xte(14:22,:)=X(64:72,:);
Yte(1:13,:)=Y(31:43,:);
Yte(14:22,:)=Y(64:72,:);

X=Xtr;
Y=Ytr;


svmErrors=0;
knnErrors=0;
decisionTreeErrors=0;
ensembleErrors=0;
descErrors=0;

model=fcihTrainModel(X,Y,'SVM');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model,x_new);
    if y_new~=Yte(i,1)
        svmErrors=svmErrors+1;
    end
end

model2=fcihTrainModel(X,Y,'KNN');  % 'SVM' 'KNN' 'decisionTree' 'ensemble' 'descriminant'

for i=1:size(Xte,1)
    x_new=Xte(i,:);
    y_new=fcihPredict(model2,x_new);
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
knnErrors
decisionTreeErrors
ensembleErrors
descErrors