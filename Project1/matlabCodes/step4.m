load 'matlab.mat'
Fs = 199.6140;
%% stage0
sigS0=stage0.Data(:,1);  
nfft = 2^nextpow2(length(sigS0));
P = abs(fft(sigS0,nfft)).^2/length(sigS0)/Fs;
psd0 = dspdata.psd(P(1:length(P)/2),'Fs',Fs);  
figure; 
plot(psd0);
title('stage0')

%% stage1
sigS1=stage1.Data(:,1);  
nfft = 2^nextpow2(length(sigS1));
P = abs(fft(sigS1,nfft)).^2/length(sigS1)/Fs;
psd1 = dspdata.psd(P(1:length(P)/2),'Fs',Fs);
figure;
plot(psd1)
title('stage1')

%% stage2
sigS2=stage2.Data(:,1); 
nfft = 2^nextpow2(length(sigS2));
P = abs(fft(sigS2,nfft)).^2/length(sigS2)/Fs;
psd2 = dspdata.psd(P(1:length(P)/2),'Fs',Fs);
figure; 
plot(psd2)
title('stage2')

%% tofind
sigTof=to_find.Data(:,1); 
nfft = 2^nextpow2(length(sigTof));
P = abs(fft(sigTof,nfft)).^2/length(sigTof)/Fs;
psdTof = dspdata.psd(P(1:length(P)/2),'Fs',Fs);
figure; 
plot(psdTof)
title('tofind')

%% tofind2
sigTof2=to_find2.Data(:,1);
nfft = 2^nextpow2(length(sigTof2));
P = abs(fft(sigTof2,nfft)).^2/length(sigTof2)/Fs;
psdTof2 = dspdata.psd(P(1:length(P)/2),'Fs',Fs);
figure; 
plot(psdTof2)
title('tofind2')