%4-Feature extraction
close all 
clear all
clc;
load('two1.mat');
load('two2.mat');
load('one1.mat');
load('one2.mat');

%4-1 Voiced/Voiceless flag and pitch

%  A=autocorr(two1,1000);
%  figure(4)
%  plot(A)
%  
%  B=autocorr(two2,1000);
%  figure(3)
%  plot(B)
%  
%  C=autocorr(one1,1000);
%  figure(2)
%  plot(C)
%  
%  D=autocorr(one2,1000);
%  figure(1)
%  plot(D)


%% Question 10

Fs= 16000;
N=480;
Nfft=1024;

figure(5)
load('one1.mat');
Autocorr_one1=autocorr(one1,1000);
[voicedFlag1,pitch1]=isvoiced(one1,Fs);
plot(one1)
 
figure(6)
load('one2.mat');
Autocorr_one2=autocorr(one2,1000);
[voiceFlag2,pitch2]=isvoiced(one2,Fs);
plot(one2)
 
figure(7) 
load('two1.mat');
Autocorr_two1=autocorr(two1,1000);
[voiceFlag3,pitch3]=isvoiced(two1,Fs);
plot(two1)
 

load('two2.mat');
Autocorr_two2=autocorr(two2,1000);
[voicedFlag4,pitch4]=isvoiced(two2,Fs);
plot(two2)

% Question 13

load('one1.mat');
load('one2.mat');
load('two1.mat');
load('two2.mat');
N=441;
w= hamming(N);
P=20;
Nmfcc=20;

Nfft=1024;
d=N-0.015*Fs
N=(Fs*30)/1000;
figure(1)
mfcc_feat1=mfcc_features(one1,w,d,Nfft,Nmfcc,Fs)
plot(mfcc_feat1(2:end))
title('mfcc_feature(one)')
hold on
mfcc_feat2=mfcc_features(one2,w,d,Nfft,Nmfcc,Fs)
plot(mfcc_feat2(2:end),'r')
title('mfcc_feature(one)')
hold off

figure(2)
mfcc_feat3=mfcc_features(two1,w,d,Nfft,Nmfcc,Fs)
plot(mfcc_feat3(2:end),'g')
title('mfcc_feature(two)')
hold on
mfcc_feat4=mfcc_features(two2,w,d,Nfft,Nmfcc,Fs)
plot(mfcc_feat4(2:end), 'm')
title('mfcc_feature(two)')


