%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to get status of LMS
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%command structure:
%[Start text][MSG length][CMD Type][SPC][CMD][CHKSUM]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%predefined: (See INFO/command structure)
CMDtype = {'73','52','4E'};
CMD = {'4C','43','4D','73','74','61','74','65'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
%compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:20) = CMD(1:8);
telegramCell(21) = {CHKSUM(telegramCell(9:20))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:20)));

%%now to send telegram