%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Frontend to all functions

%Notes: 

%% Setup
clc,clear

%Prompt
fprintf('Welcome to LIDAR Communication frontend ~dwbennet@mtu.edu ~kd8bny@gmail.com')
fprintf('\nUse with LMS11x and LMS 15x \n')
fprintf('For use instructions see README.MD\n\n')

%Entry
entry = 99;

while(entry~=0)
    fprintf('Commands:\n\t 1:Log in\n\t 2:Set Freq & Res\n\t 3:Configure Scan Content\n\t 4:Configure Scan Output\n\t 5:Store Parameters\n\t 6:Log out\n\t 7:Request Scan\n\n 0:QUIT\n')
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
        fprintf('Not wriiten yet')
        %sMN_mEEwriteall
        pause(1)
    
    elseif(entry==6)
        fprintf('Not wriiten yet')
        %sMN_Run
        pause(1)
    
    elseif(entry==7)
        fprintf('Try also sEM_**')
        sRN_LMDscandata
        %sEN_LMDscandata
    else
        fprintf('Please enter valid command')
        pause(1)
    end
    %Prep for new command
    clc
    entry = 99;
    fprintf('Next Command?\n\n')
end
fprintf('Thanks for using')