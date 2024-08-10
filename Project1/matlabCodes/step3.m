load 'matlab.mat'
%% Filtered signal
sig=stage2.Data(:,1); % satge0 & stage1 & stage2
Ts = 1/199.6140;              % Sampling rate
L = length(sig);              % Length of signal
nsamp=size(sig);   
t = (Ts)*(1:nsamp);
SIG = fft(sig);
SIGPlt = fftshift(SIG);
Fsamps=(0:L)/(Ts*L);
figure;
fplt = real((((1/(Ts*L):L)/(Ts*L))-100));
plot(fplt,real(SIGPlt));
xlabel('Frequency(Hz)')
ylabel('Amplitude')
figure;
subplot(6,1,1)
plot(t,sig);
xlim([0 30])
ylim([-2000 1000])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Filtered signal')

%% delta wave ( 0.5 to 4 Hz only)
Fdelta=SIG; %changin freq rate 
dLow=Fsamps<0.5; %Zeroing freq<-2.5
Fdelta(dLow)=0;
Fdelta(end-length(Fsamps(dLow))+2:end)=0;%zeroing 
dHigh=Fsamps<=4;%acceptable range upper bound is 4 Hz
% zeroing unacceptable range
Fdelta(length(Fsamps(dLow))+length(Fsamps(dHigh))+1:end-length(Fsamps(dLow))-length(Fsamps(dHigh))+1)=0; 
delta=ifft(Fdelta);
subplot(6,1,2)
plot(t,delta)
xlim([0 30])
ylim([-200 200])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Delta (0.5-4Hz)')

%% theta wave (4 to 8 Hz only)
Ftheta=SIG;%for changin freq rate 
tLow=Fsamps<4; %Zeroing freq<4
Ftheta(tLow)=0;
Ftheta(end-length(Fsamps(tLow))+2:end)=0;%zeroing 
tHigh=Fsamps>=4 &Fsamps<=8;%acceptable range
Ftheta(length(Fsamps(tLow))+length(Fsamps(tHigh))+1:end-length(Fsamps(tLow))-length(Fsamps(tHigh))+1)=0;
delta=ifft(Ftheta);
subplot(6,1,3)
plot(t,delta)
xlim([0 30])
ylim([-27 27])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Theta (4-8Hz)')

%% alpha wave (8 to 12 Hz only)
Falpha=SIG;%for alpha 
aLow=Fsamps<8;%Zeroing freq<8
Falpha(aLow)=0;
Falpha(end-length(Fsamps(aLow))+2:end)=0;%zeroing 
aHigh=Fsamps>=8 &Fsamps<=12;%acceptable range
Falpha(length(Fsamps(aLow))+length(Fsamps(aHigh))+1:end-length(Fsamps(aLow))-length(Fsamps(aHigh))+1)=0;
alpha=ifft(Falpha);
subplot(6,1,4)
plot(t,alpha)
xlim([0 30])
ylim([-20 20])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Alpha (8-12Hz)')

%% Beta wave (12 to 35 Hz only)
Fbeta=SIG; %for Beta
bLow=Fsamps<12; %Zeroing freq<12
Fbeta(bLow)=0;
Fbeta(end-length(Fsamps(bLow))+2:end)=0;%zeroing 
bHigh=Fsamps>=12 &Fsamps<=35;%acceptable range
Fbeta(length(Fsamps(bLow))+length(Fsamps(bHigh))+1:end-length(Fsamps(bLow))-length(Fsamps(bHigh))+1)=0;
beta=ifft(Fbeta);
subplot(6,1,5)
plot(t,beta)
xlim([0 30])
ylim([-50 50])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Beta (12-35Hz)')

%% Gamma wave (35 Hz and greater)
gLow=Fsamps<35; %Zeroing freq<35
G=SIG;%for Gamma
G(gLow)=0;
G(end-length(Fsamps(gLow))+2:end)=0;%zeroing 
gHigh=Fsamps>=35;%acceptable range
G(length(Fsamps(gLow))+length(Fsamps(gHigh))+1:end-length(Fsamps(gLow))-length(Fsamps(gHigh))+1)=0;
gamma=ifft(G);
subplot(6,1,6)
plot(t,gamma)
xlim([0 30])
ylim([-50 50])
xlabel('Time(sec)')
ylabel('Amplitude(uV)')
title('Gamma (35Hz & gt)')
