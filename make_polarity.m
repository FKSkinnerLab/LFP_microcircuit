function [freq,pwr,max_theta_freq,max_theta_pwr,max_freq,max_pwr,av_pwr]=make_pwrspec(Vlfp,tot_time); %,fignum);   %fignum
%tot_time in seconds

n=length(Vlfp);
%n=length(Vlfp)-(si/1000000);   %number of total pts-number pts in 1st second
Fs=n/tot_time;
%Vlfp=Vlfp(Fs+1:end);    %cut of first second

freq=(0:n-1)*(Fs/n);
freq=freq(2:round(end/2));


LFP=fft(Vlfp);
pwr=abs(LFP).^2/n.^2;
%pwr=abs(LFP).^2/n;
pwr=pwr(2:round(end/2));

pks=findpeaks(Vlfp);
av_pwr=mean(pks);

%alternative but same method
%pwr=abs(LFP)/(n/2);
%pwr=pwr(1:n/2).^2;


%size(freq)
%size(pwr)

theta_freq=find(freq>2&freq<13);
max_theta_pwr=max(pwr(theta_freq(1):theta_freq(end)));
max_theta_pwr_ind=find(pwr==max_theta_pwr);
max_theta_freq=freq(max_theta_pwr_ind);

max_pwr=max(pwr);
max_pwr_ind=find(pwr==max_pwr);
max_freq=freq(max_pwr_ind);

  figure(2);
  clf;
 plot(freq,pwr);
 hold on;
 xlim([0 30]);
 xlabel('Frequency (Hz)','fontsize',16),
title_string = sprintf('max power=%.4f',max_pwr);
title(title_string, 'fontsize',16);

