function [ mfcc_feat ] = mfcc_features(x,w,d,Nfft,Nmfcc,Fs)
%This function returns the mfcc features
mfcc_feat=zeros(1,Nmfcc);
mfc_mat=mfcc(x,w,d,Nfft,Nmfcc,Fs);
[N,M]=size(mfc_mat);
for i=1:N
    mfcc_feat(i)=mean(mfc_mat(i,:));
end

end
