%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send permanent data
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%command structure:
%[Start text][MSG length][CMD Type][SPC][CMD][SPC][Measurement][CHKSUM]

%% Alt Values
%Measurement: [Stop: 0x00; Start: 0x01]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%Predefined: See INFO/command structure
CMDtype = {'73','45','4E'};
CMD = {'4C','4D','44','73','63','61','6E','64','61','74','61'};
MEAS = {'01'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
% Compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:23) = CMD(1:11);
telegramCell(24) = SPC(1);
telegramCell(25) = MEAS(1);
telegramCell(26) = {CHKSUM(telegramCell(9:25))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:25)));

%%now to send telegram