%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Set Access Mode
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%Command Structure:
%[Start text][MSG length][CMD Type][SPC][CMD][SPC][USRlvl][PSWRD][CHKSUM]

%% Alt Values
%USRlvl: [02:Maintenance; 03:Auth Client; 04:Service]
%PSWRD: [main: B21ACE26; client: F4724744; Service: 81BE23AA]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%LMS requires user login (USRlvl & PSWRD)
%Predefined: See INFO/Command Structure
CMDtype = {'73','4D','4E'};
CMD = {'53','65','74','41','63','63','65','73','73','4D','6F','64','65'};

%Value for Authorized Client. See /Alt Values
USRlvl = {'03'};
PSWRD = {'F4','72','47','44'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
%compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:25) = CMD(1:13);
telegramCell(26) = SPC(1);
telegramCell(27) = USRlvl(1);
telegramCell(28:31) = PSWRD(1:4);
telegramCell(32) = {CHKSUM(telegramCell(9:31))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:31)))

%%now to send telegram