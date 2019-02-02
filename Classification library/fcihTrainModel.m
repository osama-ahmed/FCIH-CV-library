function model=fcihTrainModel(X,Y,classifierName)

if strcmp(classifierName,'SVM')
    model = fitcsvm(X,Y,'KernelFunction','polynomial','PolynomialOrder' ,3,'Standardize',true,'CrossVal','off');

elseif strcmp(classifierName,'KNN')
    model = fitcknn(X,Y,'NumNeighbor',1);
    
elseif strcmp(classifierName,'decisionTree')
    model = fitctree(X,Y);
    
elseif strcmp(classifierName,'ensemble')
    model = fitensemble(X,Y,'AdaBoostM2',200,'Discriminant' );  %binaryClassification %use AdaBoostM2 for multiclass

elseif strcmp(classifierName,'descriminant')
    model = fitcdiscr(X,Y,'discrimType' , 'pseudoLinear');
end
    
end