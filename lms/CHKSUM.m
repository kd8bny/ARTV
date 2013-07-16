%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to calculate check sum and reurn value to telegram

%% NOTES
%Caluclation by XOR each bit of MSG
% MUST return HEX String cell array ~ie {'HEX'}
%% Function Header
function ETXtemp = CHKSUM(MSG)
%Predefined (Speed Optimizations)
L_MSG = length(MSG);
MSGDec = zeros(1,L_MSG);

%Convert to BIN
j=0;
for(i=1:L_MSG)
    MSGDec(i) = hex2dec(MSG(i));
    MSGBin(i+j:i+7+j) = decimalToBinaryVector(MSGDec(i),8,'MSBFirst'); 
    j=j+7;
end

%Speed Optimizations
L_MSGBin = length(MSGBin);
xorVec = zeros(1,L_MSGBin);
ETXtemp = zeros(1,L_MSGBin);

%Compute Checksum
for (i=1:L_MSGBin)
    ETXtemp(i) = xor(MSGBin(i),xorVec(i));
end

%Convert to HEX
temp = bi2de(ETXtemp(1:L_MSGBin),'right-msb')
ETX = dec2hex(temp)
end