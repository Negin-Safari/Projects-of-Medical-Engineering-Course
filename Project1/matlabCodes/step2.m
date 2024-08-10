load 'matlab.mat'
Ts = 1/199.6140;
numOfsamp=size(stage0.Data);
t = (Ts)*(1:numOfsamp);
figure;
plot(t,stage0.Data);
title('Stage0 EEG data');