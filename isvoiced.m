function [voicedFlag, pitch] = isvoiced(x,Fs)

maxP=floor(Fs/50);

[gam_x, p] = autocorr(x,maxP);

p=floor(Fs/500):floor(Fs/50);
[~,P]=max(gam_x(p));

if gam_x(P)>=0.6*gam_x(P)
    voicedFlag = 1;
    pitch=Fs/P;
else
    voicedFlag = 0;
    pitch=0;
end
end
