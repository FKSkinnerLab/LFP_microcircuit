function [P,PK]=basal_exc_make_pwrspec(Vlfp); %,fignum); 

% ESTIMATION OF POLARITY. THIS FUNCTION DOESN'T CALCULATE EXACT AMPLITUDE
% IT ONLY CALCULATES POLARITY AS FINDPEAKS CAN BE INACCURATE FOR NEGATIVE
% DIFLECTIONS.

M = Vlfp.electrodes;
for k1 = 1:size(M,1)
    pks = findpeaks(M(k1,:));    
    mean_pks = mean(pks);
    P(k1) = mean_pks; %vector with all mean peak values across electrodes for a particular network
    count_pks = length(pks(abs(pks)>0.0001)) %count peaks larger than a value to ignore baseline peaks
    PC(k1)=count_pks %vector with number of peaks
end
    
   PK=mean(PC) % I only need an average peaks number across all electrodes
 
   
   % this function has been seperately tested that it works. I load an
   % example mat file and made sure that the output variable are all generated correctly 
   % the check showed that:
   % k1 =15
   % pks_cor = find(pks(abs(pks)>0.0001)) that gave indexes not values - did
   % not work correctly






