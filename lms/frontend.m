%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Frontend to all functions

%Notes: 
%Change IP and port here
%% Setup
clc,clear

%Prompt
fprintf('Welcome to LIDAR Communication frontend ~dwbennet@mtu.edu ~kd8bny@gmail.com')
fprintf('\nUse with LMS11x and LMS 15x \n')
fprintf('For use instructions see README.MD\n\n')

%Global Values
global udpstate entry IP port
entry = 'na'; IP = '169.254.43.166'; port = 2111;

while(entry~=0)
    fprintf('Commands:\n\t 1:Log in\n\t 2:Set Freq & Res\n\t 3:Configure Scan Content\n\t 4:Configure Scan Output\n\t 5:Store Parameters\n\t 6:Log out\n\t 7:Request Scan\n\t 8:Settings\n\n 0:QUIT\n')
    entry = input('Command Entry:');
    if(entry==1)
        sMN_setAccessMode
    
    elseif(entry==2)
        sMN_mLMPsetscancfg
    
    elseif(entry==3)
        sWN_LMDscandatacfg
    
    elseif(entry==4)
        sWN_LMPoutputRange
    
    elseif(entry==5)
        sMN_mEEwriteall
    
    elseif(entry==6)
        sMN_Run
    
    elseif(entry==7)
        fprintf('Try also sEM_**')
        sRN_LMDscandata
        %sEN_LMDscandata
    elseif(entry==8)
        IP = input('IP address of LMS 1xx: ','s');
        port = input('Port of LMS 1xx: ');
    else
        fprintf('Please enter valid command')
        pause(1)
    end
    %Prep for new command
    entry = 'na';
    clc
    fprintf('Next Command?\n\n')
end
fprintf('Thanks for using')