%% Classification
close all;
clear all;
clc;


load('data_1.mat');
load('data_2.mat');
load('train_1.mat');
load('train_2.mat');
load('test_1.mat');
load('test_2.mat');


%Question16

[matFtrain1]=train_classifier(data_1,train_1);
figure(10)
plot([matFtrain1])
[matFtrain2]=train_classifier(data_2,train_2);
[matFtest1]=train_classifier(data_1,test_1);
[matFtest2]=train_classifier(data_2,test_2);

%L1=length(test_1);

[P1]=proba(matFtrain1,matFtest1,3);
 
[P2]=proba(matFtrain2,matFtest2,3);
  
[Cm_1]= confusion(matFtrain1,matFtest1,3);
figure(1)
imagesc(Cm_1)
title('Confusion matrix for test 1')

[Cm_2]= confusion(matFtrain2,matFtest2,3); 
figure(2);
imagesc(Cm_2)
title('Confusion matrix for test 2')
 
P_1=1/30*trace(Cm_1);
 
P_2=1/30*trace(Cm_2);








    
    