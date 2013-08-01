%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to configure data content for scan
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%command structure:
%[Start text][MSG length][CMDType][SPC][CMD][SPC][Data Channel]...
%   [Remission][Resolution][Unit][Encoder][Position][Device Name]...
%       [Comment][Time][Output Rate][CHKSUM]

%% Alt Values
%Data Channel: [CH1:0x0100; CH2:0x0200; CH1&2:0x0300]
%Remission: [No: 0x00; Yes: 0x01]
%Resolution: [8'b: 0x00; 16'b: 0x01]
%Encoder: [None: 0x0000; CH1: 0x0100]
%Position: [No: 0x00; Yes: 0x01]
%Device Name: [No: 0x00; Yes: 0x01]
%Comment: [No: 0x00; Yes: 0x01]
%Time: [No: 0x00; Yes: 0x01]
%Output Rate: [All Scans: 0x0001; Each 2nd scan: 0x0002]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%Predefined: (See INFO/command structure)
CMDtype = {'73','57','4E'};
CMD = {'4C','4D','44','73','63','61','6E','64','61','74','61','63','66','67'};

%Variables See: Info/Alt Values
dataCH = {'01','00'};
REM = {'00'};%Correct value?
RES = {'01'};
UNIT = {'00'};
ENC = {'00','00'};
POS = {'00'};
uname = {'00'};
comment = {'00'};
time = {'00'};
OUT = {'00','01'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
%Compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:26) = CMD(1:14);
telegramCell(27) = SPC(1);
telegramCell(28:29) = dataCH(1:2);
telegramCell(30) = REM(1);
telegramCell(31) = RES(1);
telegramCell(32) = UNIT(1);
telegramCell(33:34) = ENC(1:2);
telegramCell(35) = POS(1);
telegramCell(36) = uname(1);
telegramCell(37) = comment(1);
telegramCell(38) = time(1);
telegramCell(39:40) = OUT(1:2);
telegramCell(41) = {CHKSUM(telegramCell(9:40))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:40)))

%%now to send telegram