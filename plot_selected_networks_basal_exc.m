function [P,PK]=make_selected_networks_basal_exc(Vlfp); %,fignum); 


M = Vlfp.electrodes;
for k1 = 1:size(M,1)
    pks = findpeaks(M(k1,:));    
    mean_pks = mean(pks);
    P(k1) = mean_pks; %vector with all mean peak values across electrodes for a particular network
    count_pks = length(pks(abs(pks)>0.0001)) %count peaks larger than a value to ignore baseline peaks
    PC(k1)=count_pks %vector with number of peaks
end
    
   PK=mean(PC) 
 
   





