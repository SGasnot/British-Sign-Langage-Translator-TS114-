function [matF] = train_classifier(data,train)
% This function return matF, a matrix containing features for every element
% of the train set.

L=length(train);
matF=zeros(12,L);
Fs=16000;
timeN=30;
timed=15;
N=(timeN*Fs)/1000;
d=(timed*Fs)/1000;
w=ones(1,N);
Nmfcc=12;
Nfft=1024;

for i=1:L
    matF(1,i)=train(1,i);
    tr_1=train(2,i);
    tr_2=train(3,i);
    X=data(tr_1:tr_2,1);
    Y=mfcc_features(X,w,d,Nfft,Nmfcc,Fs);
    matF(2:Nmfcc,i)=Y(2:Nmfcc);
end