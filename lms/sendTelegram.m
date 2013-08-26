%% INFO
%Use of SICK LMS 111 
%Daryl W. Bennett ~dwbennet@mtu.edu ~kd8bny@gmail.com
%Purpose: Function to send msg to LMS 1xx

%% NOTES
% Set IP and Port in front end
%% Function Header
function readT = sendTelegram (msg)
global IP port
echoudp('off')
echoudp('on',2111)
address = udp(IP, port, 'LocalPort', port)
set(address,'Timeout',30);
fopen(address);
udpstate = 1;

for i=1:length(msg)
    fwrite(address,msg{i})
    fread(address)
end

fclose(address)
echoudp('off')
end