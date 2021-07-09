function ImageHandler =BitstreamToImage(bitStream, numOfRows, numOfColumns, numOfChannels)

ImageHandler = zeros(numOfRows, numOfColumns, numOfChannels);
b =1;
for k= 1:numOfChannels
   for i= 1:numOfRows
       for j= 1:numOfColumns
        ImageHandler(i,j,k) = bi2de(bitStream(b:b+7),'left-msb');
        b = b+8;
       end 
   end
end

end