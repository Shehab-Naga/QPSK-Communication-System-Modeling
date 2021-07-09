function recovered_bitStream = QPSK_demodulation(received_I,received_Q)

    recovered_bitStream =[];
    
    for i =1: length(received_I)
    recovered_bitStream = [recovered_bitStream received_I(i)>0 received_Q(i)>0];
    end
    
end