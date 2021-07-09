function BER =BERvsSNR_channel3(I,Q,bitStream)
SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

BER=[];
for SNR = 0:15

    I_noise = awgn(I, SNR,'measured');
    Q_noise = awgn(Q, SNR,'measured');

    I_received = I_noise + RayleighChannel_I.*I;
    Q_received = Q_noise + RayleighChannel_Q.*Q;
    
   bitStream_received = QPSK_demodulation(I_received,Q_received);

    % BER Computation 
    berValue = sum(bitStream~=bitStream_received)/length(bitStream);
BER = [BER berValue];
end

figure('Name','BER vs SNR for channel 3','NumberTitle','off');
semilogy(0:15, BER, 'ro-');
title('BER vs SNR for channel 3');
xlabel('SNR'); ylabel('BER'); grid on;

end