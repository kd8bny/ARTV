%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Get Frequency and Angular Resolution
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%Command Structure:
%[Start text][MSG length][CMD Type][SPC][CMD][CHKSUM]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%predefined: (See INFO/command structure)
CMDtype = {'73','52','4E'};
CMD = {'4C','4D','50','73','63','61','6E','63','66','67'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
%compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:22) = CMD(1:10);
telegramCell(23) = {CHKSUM(telegramCell(9:22))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:22)))

%%now to send telegram