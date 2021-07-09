function BER =BERvsSNR_channel2(I,Q,bitStream)

SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

BER=[];
for SNR = 0:15

    I_received = RayleighChannel_I.*I;
    Q_received = RayleighChannel_Q.*Q;

   bitStream_received = QPSK_demodulation(I_received,Q_received);

    % BER Computation 
    berValue = sum(bitStream~=bitStream_received)/length(bitStream);
BER = [BER berValue];
end

figure('Name','BER vs SNR for channel 2','NumberTitle','off');
semilogy(0:15, BER, 'ro-');
title('BER vs SNR for channel 2');
xlabel('SNR'); ylabel('BER'); grid on;

end