%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Set Access Mode
%TODO: Make function; FIX MSG length

%Notes: All binary (Could use HEX in future)
%command structure:
%[starttext][MSG length][CMD Type][SPC][CMD][SPC][USRlvl][PSWRD][CHKSUM]

%% Alt Values
%USRlvl: [02:Maintenance; 03:Auth Client; 04:Service]
%PSWRD: [main: B21ACE26; client: F4724744; Service: 81BE23AA]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
SPC = {'20'};
STX = {'02','02','02','02'};

%LMS requires user login (USRlvl & PSWRD)
%predefined: (See INFO/command structure)
CMDtype = {'73','4D','4E'};
CMD = {'53','65','74','41','63','63','65','73','73','4D','6F','64','65'};
ETX = CHKSUM(CMD);  %{'B3'};
%Value for Authorized Client. See /Alt Values
USRlvl = {'03'};
PSWRD = {'F4','72','47','44'};

MSGlength = dec2hex(length(CMDtype)+length(CMD)+2*length(SPC)+length(USRlvl)+length(PSWRD),2);
%MSGLength = {'00','00','00',int2str(MSGlength)}


%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
telegramCell(5:8) = {'00','00','00','17'}; %Fix this
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:25) = CMD(1:13);
telegramCell(26) = SPC(1);
telegramCell(27) = USRlvl(1);
telegramCell(28:31) = PSWRD(1:4);
telegramCell(32) = {'B3'};  %Check Sum

% Convert to BIN
telegramDec2 = zeros(1,32);
j=0;
for(i=1:1:32)
    telegramDec2(i) = hex2dec(telegramCell(i));
    telegram2(i+j:i+7+j) = decimalToBinaryVector(telegramDec2(i),8,'MSBFirst'); 
    j=j+7;
end