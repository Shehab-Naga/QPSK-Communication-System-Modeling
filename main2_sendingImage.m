clear; clc;
% generating the bit stream from image
im= imread('test image.jpg');
[bitStream, numOfRows, numOfColumns, numOfChannels]= ImageToBitstream(im);

% QPSK Modulation
[I, Q] = QPSK_modulation(bitStream);

% channel 1 with agwan noise only
SNR = 10;
I_received = awgn(I, SNR,'measured');
Q_received = awgn(Q, SNR,'measured');
    % QPSK Demodulation
bitStream_received = QPSK_demodulation(I_received,Q_received);
    % Regenerating the image from bit stream
im_recovered1 =BitstreamToImage(bitStream_received, numOfRows, numOfColumns, numOfChannels);
im_recovered1_uint8 =uint8(im_recovered1);
figure('Name','channel 1','NumberTitle','off');
image(im_recovered1_uint8);

% channel 2 with Rayleigh channel only
SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

I_received = RayleighChannel_I.*I;
Q_received = RayleighChannel_Q.*Q;
    % QPSK Demodulation
bitStream_received = QPSK_demodulation(I_received,Q_received);
    % Regenerating the image from bit stream
im_recovered2 =BitstreamToImage(bitStream_received, numOfRows, numOfColumns, numOfChannels);
im_recovered2_uint8 =uint8(im_recovered2);
figure('Name','channel 2','NumberTitle','off');
image(im_recovered2_uint8);

% channel 3 with Rayleigh channel and agwan noise
SNR = 10;
SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

I_noise = awgn(I, SNR,'measured');
Q_noise = awgn(Q, SNR,'measured');

I_received = I_noise + RayleighChannel_I.*I;
Q_received = Q_noise + RayleighChannel_Q.*Q;
    % QPSK Demodulation
bitStream_received = QPSK_demodulation(I_received,Q_received);
    % Regenerating the image from bit stream
im_recovered3 =BitstreamToImage(bitStream_received, numOfRows, numOfColumns, numOfChannels);
im_recovered3_uint8 =uint8(im_recovered3);
figure('Name','channel 3','NumberTitle','off');
image(im_recovered3_uint8);
