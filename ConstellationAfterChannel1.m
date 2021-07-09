function ConstellationAfterChannel1(I, Q, SNR)

I_received_channel1 = awgn(I, SNR,'measured');
Q_received_channel1 = awgn(Q, SNR,'measured');

figure('Name','Constellation Diagram after channel 1','NumberTitle','off');
scatter(I_received_channel1, Q_received_channel1);
title('Constellation Diagram after channel 1');
xlabel('I'); ylabel('Q'); grid on;

end 