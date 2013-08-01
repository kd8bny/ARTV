%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to Set Frequency and Resolution
%TODO: Make function

%Notes: All binary (Could use HEX in future)
%command structure:
%[Start text][MSG length][CMD Type][SPC][CMD][SPC][Scan Freq][Reserved][Angular Res][Start Angle][Stop Angle][CHKSUM]

%% Alt Values
%Scan Frequency: [0x9C4: 25Hz; 0x1388: 50Hz]
%Angular Resoultion: [0x9C4: 25deg; 0x1388: 5deg] %NOTE!!! If changed...
%       CHANGE "LMPoutputRange"
%Start Angle: [0xFF F9 22 30 to 0x00 22 55 10]
%Stop Angle: [0xFF F9 22 30 to 0x00 22 55 10]

%% Setup
clc,clear
%Delclare telegram. See: INFO/command structure
telegramCell = {};
STX = {'02','02','02','02'};
SPC = {'20'};

%Predefined: See INFO/command structure
CMDtype = {'73','4D','4E'};
CMD = {'6D','4C','4D','50','73','65','74','73','63','61','6E','63','66','67'};
SFREQ = {'00','00','13','88'};
RES = {'00','01'};
ARES = {'00','00','13','88'};   %If chaned read Alt Values
STARTA = {'FF','F9','22','30'};
STOPA = {'00','22','55','10'};

%% Set Telegam
% See: INFO/command structure
telegramCell(1:4) = STX(1:4);
%compute telegramCell(5:8) last for modular code
telegramCell(9:11) = CMDtype(1:3);
telegramCell(12) = SPC(1);
telegramCell(13:26) = CMD(1:14);
telegramCell(27) = SPC(1);
telegramCell(28:31) = SFREQ(1:4);
telegramCell(32:33) = RES(1:2);
telegramCell(34:37) = ARES(1:4);
telegramCell(38:41) = STARTA(1:4);
telegramCell(42:45) = STOPA(1:4);
telegramCell(46) = {CHKSUM(telegramCell(9:45))};  %Check Sum

telegramCell(5:8) = findLength(length(telegramCell(9:45)));

%%now to send telegram

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Receiver
%code receive based on LIDAR output 
%for now using cell array
%Default:
telegramRX = {'02','02','02','02','00','00','00','26','73','41','4E','20','6D','4C','4D','50','73','65','74','73','63','61','6E','63','66','67','20','00','00','00','13','88','00','01','00','00','13','88','FF','F9','22','30','00','22','55','10','2D'};

% Preset
Success = {'00'};
FREQError = {'01'};
RESError = {'02'};
RESscanError = {'03'};
SCANError = {'04'};
genError = {'05'};

%Grab "Error"
value = telegramRX(8+4+2+length(CMD)); %account for SPC & CMDtype 
if(isequal(value,Success))
    fprintf('Success\nLOGOUT to set values\n')
elseif(isequal(value,FREQError))
    fprintf('Error: Frequnecy\n')
elseif(isequal(value,RESError))
    fprintf('Error:Resolution\n')
elseif(isequal(value,RESscanError))
    fprintf('Error:Resolution and Scan\n')
elseif(isequal(value,SCANError))
    fprintf('Error:Scan Area\n')
elseif(isequal(value,genError))
    fprintf('Error: Ahhhhhhhh IDK! (gen error)\n')
else
    fprintf('Strange error....passedthrough if statement')
end









