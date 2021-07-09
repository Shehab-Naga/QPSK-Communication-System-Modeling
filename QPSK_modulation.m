function [mod_I, mod_Q] = QPSK_modulation(bitStream)

mod_I = []; mod_Q=[];
for i= 1:2:length(bitStream)
    if (bitStream(i) ==0) && (bitStream(i+1) ==0)
    Ivalue= cosd(225);
    Qvalue= sind(225);
    elseif (bitStream(i) ==0) && (bitStream(i+1) ==1)
    Ivalue= cosd(135);
    Qvalue= sind(135);
    elseif (bitStream(i) ==1) && (bitStream(i+1) ==0)
    Ivalue= cosd(315);
    Qvalue= sind(315);
    elseif (bitStream(i) ==1) && (bitStream(i+1) ==1)
    Ivalue= cosd(45);
    Qvalue= sind(45);
    end
mod_I = [mod_I Ivalue];
mod_Q = [mod_Q Qvalue];
end

end