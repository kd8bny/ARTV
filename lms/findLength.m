%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to calculate message length and reurn value to telegram

%% NOTES
% MUST return HEX String cell array ~ie {'HEX'} length of 4
%% Function Header
function MSGlength = findLength(CMDtype,SPC,CMD,USRlvl,PSWRD)
MSGlength = dec2hex(length(CMDtype)+length(CMD)+2*length(SPC)+length(USRlvl)+length(PSWRD),2);
MSGlength = {'00','00','00',MSGlength}
end