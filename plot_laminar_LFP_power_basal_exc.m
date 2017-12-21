

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

        for k1 = 1:size(lfp_data,1)

             LFP=fft(lfp_data(k1,:));
             pwr=abs(LFP).^2/n.^2;
             pwr=pwr(2:round(end/2));
             LP_pks=max(pwr);
             LP(k1)= LP_pks
        end
        
        

        plot(LP);  hold on;    


end
 
end
end

 
