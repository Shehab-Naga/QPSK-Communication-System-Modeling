clear; clc;
% testing vector for shorter modulation time
N= 100000;
bitStream = randi([0,1],1,N); 

% QPSK Modulation
[QPSKmod_I, QPSKmod_Q] = QPSK_modulation(bitStream);

% Constellation Diagram after modulation
figure('Name','Constellation Diagram after modulation','NumberTitle','off');
scatter(QPSKmod_I,QPSKmod_Q);
title('Constellation Diagram after modulation');
xlabel('I'); ylabel('Q'); grid on;

% channel 1 with agwan noise only
SNR = 10;
ConstellationAfterChannel1(QPSKmod_I, QPSKmod_Q, SNR); % plot at SNR= 10;
BER1 =BERvsSNR_channel1(QPSKmod_I,QPSKmod_Q,bitStream);

% channel 2 with Rayleigh channel only
SNR = 10;
ConstellationAfterChannel2(QPSKmod_I, QPSKmod_Q, SNR); % plot at SNR= 10;
BER2 =BERvsSNR_channel2(QPSKmod_I,QPSKmod_Q,bitStream);

% channel 3 with Rayleigh channel and agwan noise
SNR = 10;
ConstellationAfterChannel3(QPSKmod_I, QPSKmod_Q, SNR); % plot at SNR= 10;
BER3 =BERvsSNR_channel3(QPSKmod_I,QPSKmod_Q,bitStream);

% comparing BER vs SNR for channel 1, 2, and 3
figure('Name','BER vs SNR for channel  and 3','NumberTitle','off');
semilogy(0:15, BER1, 'go-');
title('BER vs SNR');
xlabel('SNR'); ylabel('BER'); grid on;
hold on
semilogy(0:15, BER2, 'ro-');
hold on
semilogy(0:15, BER3, 'bo-');
hold off
legend('channel 1','channel 2','channel 3');


