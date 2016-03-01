function [X, f, t] = stft(x,w,d,N_fft,Fs)
% This function computes the stft for m = [0, d, 2d, 3d...]
%This function outputs are:
% -> X, which is a matric of n_fft lines and M columns
%    M is the number of elements of m 
%    X(i,j) is the value of the spectrogram for time t(i) and frequency
%    f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t, is a row vector containing the times of the beginning of the
% windows


N=length(w);
L=length(x);
M=floor(L/d)+1;
X=zeros(N,M);
w=w(:);
N=length(w);
%matrix X : Spectre of one column : spectre for a range of frequence
%           Spectre of one line : spectre evolution in time

% step 1
for j=1:M;
    for i=1:N
        if ((j-1)*d+i<=L)
            X(i,j)=x((j-1)*d+i);
        else X(i,j)=0;
        end
    end
end

% step 2 
for i = 1:M;
    X(:,i) = X(:,i).*w;
end

% step 3

X=fft(X,N_fft);
nu=(0:1/N_fft:(N_fft-1)/N_fft);

f=nu*Fs;
t=((0:1:M-1)*d);

end
