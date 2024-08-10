load 'matlab.mat'
%% stage0
[s0,~] = pwelch(stage0.Data(:,1));
figure;
plot(10*log10(s0));
title('stage0')
xlim([0 1200])
%% stage1
[s1,~] = pwelch(stage1.Data(:,1));
figure;
plot(10*log10(s1));
title('stage1')
xlim([0 1200])
%% stage2
[s2,~] = pwelch(stage2.Data(:,1));
figure;
plot(10*log10(s2));
title('stage2')
xlim([0 1200])
%% tofind
[tof,~] = pwelch(to_find.Data(:,1));
figure;
plot(10*log10(tof));
title('to find')
xlim([0 1200])
%% tofind2
[tof2,~] = pwelch(to_find2.Data(:,1));
figure;
plot(10*log10(tof2));
title('to find2')
xlim([0 1200])