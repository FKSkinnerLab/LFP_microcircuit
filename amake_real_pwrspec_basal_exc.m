function [max_var, max_pwr_value]=make_pwrspec(Vlfp,tot_time); %,fignum); 

% % ESTIMATION OF POLARITY. THIS FUNCTION DOESN'T CALCULATE EXACT AMPLITUDE
% % IT ONLY CALCULATES POLARITY AS FINDPEAKS CAN BE INACCURATE FOR NEGATIVE
% % DIFLECTIONS.
% pks=findpeaks(Vlfp);
% av_pwr=mean(pks);
% %av_pwr=av_pwr(2:round(end/


% % VARIANCE
lfp_data= Vlfp.electrodes;
V=var(lfp_data,0,2);
max_var=max(V);

% ESTIMATION OF POWER AND FREQUENCY
%tot_time in seconds

%n=length(Vlfp)-(si/1000000);   %number of total pts-number pts in 1st second
% Fs=n/tot_time;
%Vlfp=Vlfp(Fs+1:end);    %cut of first second

% freq=(0:n-1)*(Fs/n);
% freq=freq(2:round(end/2));

lfp_data= Vlfp.electrodes;
n=length(lfp_data(1,:));

for k1 = 1:size(lfp_data,1)
    
    LFP=fft(lfp_data(k1,:));
    pwr=abs(LFP).^2/n.^2;
    pwr=pwr(2:round(end/2));
    max_pwr=max(pwr);% is this for every electrode? maybe not. let's introduce a loop here to be safe. 
    LP(k1)= max_pwr
end

max_pwr_value=max(LP)

% theta_freq=find(freq>2&freq<13);
% max_theta_pwr=max(pwr(theta_freq(1):theta_freq(end)));
% max_theta_pwr_ind=find(pwr==max_theta_pwr);
% max_theta_freq=freq(max_theta_pwr_ind);
% 
% 
% max_pwr_ind=find(pwr==max_pwr);
% max_freq=freq(max_pwr_ind);





