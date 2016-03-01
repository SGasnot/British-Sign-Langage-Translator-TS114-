clc
close all
clear all

%% An isolated word speech to British Sign Language

%% Initialisation of some variables

%%Start of the processing

Fs = 44100;
Ts = 1/Fs;

%Read the sampples from HelloWorld.wav
[x, Fs] = wavread('/net/t/tcayla/Documents/MATLAB/TDS/HelloWorld.wav');

% Question 1

tinf1 = 0.01 / Ts;
tsup1 = 0.04 / Ts;

x1 = x(tinf1:tsup1);
figure(1)
subplot(221), plot(x1);
xlabel('time');
ylabel('amplitude');
title('x1(t)');

% x1 isn't periodic, it's unvoiced

% Question 2

tinf2 = 0.2 / Ts;
tsup2 = 0.23 / Ts;

x2 = x(tinf2:tsup2);
figure(1)
subplot(222), plot(x2);
xlabel('time');
ylabel('amplitude');
title('x2(t)');

% x2 is periodic, it's voiced

% Question 3 

figure(2)
subplot(211), plot(x);


tinfh = 0.0156*10000;
tsuph = 1.8508*10000;

xhello = x(tinfh:tsuph);
figure(2)
subplot(212), plot(xhello);
xlabel('time');
ylabel('amplitude');
title('xhello(t)');

sound(x,Fs);

% The word Hello is contained in [0.0156*1.0e+04,1.8508*1.0e+04], the
% values were found thanks to ginput fonction

% Question 4

F1 = linspace(-Fs/2,Fs/2,tsup1-tinf1+1);
figure(10)

X1 = fftshift(abs(fft(x1)));
semilogy(F1,X1,'r')
hold all;
F2 = linspace(-Fs/2,Fs/2,tsup2-tinf2+1);
figure(10)
X2 = fftshift(abs(fft(x2)));
semilogy(F2,X2)
ylabel ('Magnitude')
xlabel('time')
hold off;

%The magnitude spectra of x1 is 3.5 and the magnitude spectra of x2 is 100

% Question 5 

d=441;
N_fft=1024;;

N1=441;

w1=hamming(N1);
X1=stft(x,w1,d,N_fft,Fs);
figure(7)
[Sx1, f, t] = spectro(x,w1,d,N_fft,Fs);
imagesc(t,f,10*log(Sx1(1:512,:)));
title('spectro1');
xlabel('time');
ylabel('Frequencies');

w2=ones(1,N1);
figure(8)
X2=stft(x,w2,d,N_fft,Fs);
[Sx2, f, t] = spectro(x,w2,d,N_fft,Fs);
imagesc(t,f,10*log(Sx2(1:512,:)));
title('spectro2');
xlabel('time');
ylabel('Frequencies');

N2=882;
w3=hamming(N2);
X3=stft(x,w3,d,N_fft,Fs);
figure(9)
[Sx3, f, t] = spectro(x,w3,d,N_fft,Fs);
imagesc(t,f,10*log(Sx3(1:512,:)));
title('spectro3');
xlabel('time');
ylabel('Frequencies');
% Analysis : 






