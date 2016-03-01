function [mfcc] = mfcc(x,w,d,Nfft,Nmfcc,Fs)
%This fonction returns the mfcc features

X=stft(x,w,d,Nfft,Fs);
[N,M]=size(X);
P=20;
R=[300,3700];
mfcc=ones(Nmfcc,M);
[H,f] = compute_filter_bank(P, Nfft, R, Fs);
T=zeros(P,Nfft);
U=zeros(P,M);

for i=1:M
    Y=transpose(X(:,i));
    for j=1:P
       T(j,:)=Y.*H(j,:);
       U(j,i)=sum(T(j,:).*conj(T(j,:)));
    end
end


for j=1:Nmfcc
       for l=1:M
        mfcc(j,l)=sum(sqrt(2/P)*(log(U(:,l))).*cos(pi/P*j*(transpose(1:P)-0.5)));
    end
end
end


% X =stft(x,w,d,Nfft,Fs);
% L=length(x);
% M=floor(L/d);
% X=abs(X);
% R=[300 3700];
% [H,f]=compute_filter_bank(P,Nfft,R,Fs);
% Y=zeros(P,Nfft);
% E=zeros(P,M);
% mfcc=zeros(Nmfcc,M);
% 
% 
% for i=1:M
%     for j=1:P
%         
%         Y(j,:)=transpose(X(:,i)).*(H(j,:));
%    
%            E(j,i)=norm(Y(j,:),2);
% 
%     end
% end
% 
% for i=1:Nmfcc
%     for l=1:M
%        
%             mfcc(i,l)=sum(sqrt(2/P)*log10(E(:,l))*cos((pi/P)*i*(l-0.5)));
%      
% 
%     end
% end
% end