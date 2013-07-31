%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to calculate message length and reurn value to telegram
%TODO make larger length values
%% NOTES
% MUST return HEX String cell array ~ie {'HEX'} length of 4
%% Function Header
function teleLength = findLength(MSGlength)
teleLength = {'00','00','00',dec2hex(MSGlength)};
end