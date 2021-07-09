function [bitStream, numOfRows, numOfColumns, numOfChannels]= ImageToBitstream(ImageHandler)

[numOfRows, numOfColumns, numOfChannels] = size(ImageHandler);
bitStreamLength = numOfRows*numOfColumns*numOfChannels*8;
bitStream= zeros(1,bitStreamLength);
b =1;
for k= 1:numOfChannels
   for i= 1:numOfRows
       for j= 1:numOfColumns
        bitStream(b:b+7) = de2bi(ImageHandler(i,j,k),8,'left-msb');
        b = b+8;
       end 
   end
end

end