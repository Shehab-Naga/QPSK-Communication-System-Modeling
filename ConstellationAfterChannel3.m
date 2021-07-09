function ConstellationAfterChannel3(I, Q, SNR)

SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

I_noise = awgn(I, SNR,'measured');
Q_noise = awgn(Q, SNR,'measured');

I_received_channel3 = I_noise + RayleighChannel_I.*I;
Q_received_channel3 = Q_noise + RayleighChannel_Q.*Q;

figure('Name','Constellation Diagram after channel 3','NumberTitle','off');
scatter(I_received_channel3, Q_received_channel3);
title('Constellation Diagram after channel 3');
xlabel('I'); ylabel('Q'); grid on;

end 