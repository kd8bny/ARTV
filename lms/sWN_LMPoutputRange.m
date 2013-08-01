%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Configure measurement angle of the output scan
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%Command Structure:
%[Start text][MSG length][CMD Type][SPC][CMD][SPC][Status Code]...
%   [Angle Res][Start Angle][Stop Angle][CHKSUM]

%% Alt Values
%Angular Resoultion: [0x9C4: 25deg; 0x1388: 5deg] %NOTE!!! DO NOT CHANGE!!!
%       To change edit: "mLMPsetscancfg"
%Start Angle: [0xFF F9 22 30 to 0x00 22 55 10]
%Stop Angle: [0xFF F9 22 30 to 0x00 22 55 10]

%% Setup
clc,clear
%Delclare telegram. See: INFO/Command Structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%Predefined: See INFO/Command Structure
CMDtype = {'73','57','4E'};
CMD = {'4C','4D','50','6F','75','74','70','75','74','52','61','6E','67','65'};
STAT = {'00','01'};
ARES = {'00','00','13','88'};   %DO NOT EDIT!! See: Alt Values

%Variables See: Alt Values
STARTA = {'00','00','00','00'};
STOPA = {'00','0D','BB','A0'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
% Compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:26) = CMD(1:14);
telegramCell(27) = SPC(1);
telegramCell(28:29) = STAT(1:2);
telegramCell(30:33) = ARES(1:4);
telegramCell(34:37) = STARTA(1:4);
telegramCell(38:41) = STOPA(1:4);
telegramCell(42) = {CHKSUM(telegramCell(9:41))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:41)))

%%now to send telegram