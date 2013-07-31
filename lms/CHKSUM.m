%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to calculate check sum and reurn value to telegram

%% NOTES
%Caluclation by XOR each bit of MSG
% MUST return HEX String cell array ~ie {'HEX'}
%% Function Header
function ETX = CHKSUM(MSG)
%Predefined (Speed Optimizations)
L_MSG = length(MSG);
MSGDec = zeros(1,L_MSG);

%xor
lastBin = 00000000; %for xor function first run
for(i=1:L_MSG)
    MSGDec(i) = hex2dec(MSG(i));
    %Grab 8'b
    %MSGBin = decimalToBinaryVector(MSGDec(i),8,'MSBFirst');
    MSGBin = de2bi(MSGDec(i),8,'left-msb');
    lastBin = xor(MSGBin,lastBin);
end
%Convert back to hex
ETX = dec2hex(bi2de(lastBin,'left-msb'));
end