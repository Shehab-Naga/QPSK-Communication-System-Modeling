function BER =BERvsSNR_channel1(I,Q,bitStream)

BER=[];
for SNR = 0:15
    I_received = awgn(I, SNR,'measured');
    Q_received = awgn(Q, SNR,'measured');
    
   bitStream_received = QPSK_demodulation(I_received,Q_received);

    % BER Computation 
    berValue = sum(bitStream~=bitStream_received)/length(bitStream);
BER = [BER berValue];
end

figure('Name','BER vs SNR for channel 1','NumberTitle','off');
semilogy(0:15, BER, 'ro-');
title('BER vs SNR for channel 1');
xlabel('SNR'); ylabel('BER'); grid on;

end