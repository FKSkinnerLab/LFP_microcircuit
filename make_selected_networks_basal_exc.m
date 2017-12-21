function [max_var, max_pwr_value]=make_pwrspec(Vlfp,tot_time); %,fignum); 

lfp_data= Vlfp.electrodes;
V=var(lfp_data,0,2);
max_var=max(V);


lfp_data= Vlfp.electrodes;
n=length(lfp_data(1,:));

for k1 = 1:size(lfp_data,1)
    
    LFP=fft(lfp_data(k1,:));
    pwr=abs(LFP).^2/n.^2;
    pwr=pwr(2:round(end/2));
    max_pwr=max(pwr);
    LP(k1)= max_pwr
end

max_pwr_value=max(LP)






