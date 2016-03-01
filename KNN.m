function [class]=KNN(test,matF,K)
L=length(matF);
class=zeros(2,L);
Fs=16000;
N=480;
Nfft=1024;
f_coeff=transpose(mfcc_features(test,hamming(N),N/2,Nfft,12,Fs,20));

for i=1:L
    k=2:12
    class(2,i)=norm(f_coeff(k,1)-matF(k,i),2);
    class(2,i)=matF(1:i);
end
