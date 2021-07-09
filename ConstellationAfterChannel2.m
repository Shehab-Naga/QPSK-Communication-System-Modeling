function ConstellationAfterChannel2(I, Q, SNR)

SCR =10;
RayleighChannel_I = sqrt(1/SCR)*randn(1, length(I))/sqrt(2); 
RayleighChannel_Q = sqrt(1/SCR)*randn(1, length(Q))/sqrt(2);

I_received_channel2 = RayleighChannel_I.*I;
Q_received_channel2 = RayleighChannel_Q.*Q;

figure('Name','Constellation Diagram after channel 2','NumberTitle','off');
scatter(I_received_channel2, Q_received_channel2);
title('Constellation Diagram after channel 2');
xlabel('I'); ylabel('Q'); grid on;

end 