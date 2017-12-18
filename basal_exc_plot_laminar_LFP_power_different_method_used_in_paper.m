%this function is for ploting the laminar LFP for the networks of correct
%polarity.
%steps
%1. detect the right polarity and plot the laminar LFP.

function [gsb,gbs,max_pwr,LPf]=plot_LFP_power(csb);

gsb=[0:0.25:6]'*ones(1,25);
gbs=((0:0.25:6)'*ones(1,25))';
tot_time=5; %total time of simulation in seconds
%cbs=0.1344
csb=0.21;
cbs=csb*0.64;

figure
% hold on;
for i=15:25
     for j=21:25
     
         gsb_temp=gsb(i,1);
         gbs_temp=gbs(1,j);

         f = load(['basal_exc_many_electrodes_LFP_power_only_gsb=' num2str(gsb_temp, '% 10.2f') '_gbs=' num2str(gbs_temp,'% 10.2f') '_csb=0.21.mat']);
        
%       k = (i-1)*length(j)+j
        lfp_data = f.electrodes;
        n=length(lfp_data(1,:));

        %first step adding the selection criteria, then power and then
        %laminar plot
        for k1 = 1:size(lfp_data,1)

             LFP=fft(lfp_data(k1,:));
             pwr=abs(LFP).^2/n.^2;
             pwr=pwr(2:round(end/2));
             LP_pks=max(pwr);
             LP(k1)= LP_pks
        end
        
        
         %else
        plot(LP);  hold on;    
        %display('plotting_only_selected_networks_today')

       %end
end
 
end
end

% whereas this is now very correct. so I think that the way i have done the
% polarity selection is very correct. the laminar stuff is suspicious.--
% which is good. it seems that I only transposed because I saw the final
% results not coming out right. the problem is in calculation of max power
% only. 

% this function has been seperately tested that it works. I load an
% example mat file and made sure that the output variable are all generated correctly 
% the check showed that:
% k1 =15
% pks_cor = find(pks(abs(pks)>0.0001)) that gave indexes not values - did
% not work correctly.

%NOTES AND IDEAS FOR MYSELF - I can delete when I no more need it. 
% so decision made. lets put the lamianr stuff in a for look nsde the for
% loop to make sure it works correclty without using the transpose cause it
% becomes confusing! therefore to plot laminar power I need to combne three
% things together.  need, the power aspect, the laminar aspect and the
% selection criteria.

%because before I only plottted the lamnianr LFP. Now I apply selection
%criteria that I need in order to choose which ones to plot - i did not
%have that before I plotted everything before. therefore because i need to
%aplly my selection critreria what I do is have more control by using the
%loop. This is something i have to do anyway because the loop will be used
%for the selection and the stuff in it should include the power plotting. 
