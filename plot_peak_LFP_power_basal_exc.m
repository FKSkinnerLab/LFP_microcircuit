function [gsb,gbs,max_freq,max_pwr]=plot_LFP_power(csb);

gsb=[0:0.25:6]'*ones(1,25);
gbs=((0:0.25:6)'*ones(1,25))';
tot_time=5; %total time of simulation in seconds

csb=0.01;
cbs=csb*0.64;


for i=1:25
    for j=1:25
        gsb_temp=gsb(i,1);
        gbs_temp=gbs(1,j);

    filename_v = load(['basal_exc_many_electrodes_LFP_power_only_gsb=' num2str(gsb_temp, '% 10.2f') '_gbs=' num2str(gbs_temp,'% 10.2f') '_csb=0.01.mat']);

            [max_var_temp, max_pwr_value_temp]=amake_real_pwrspec_basal_exc(filename_v,tot_time); % edw kalei thn make pwr spec apo to allo arxeio

            max_pwr_value(i,j)=max_pwr_value_temp;
           
    end
end


filename=(['380PV_120BiC_350SOM_PV12913020-dn6p6-gnn0p21-gi0-giSD0-g3_SOM12915016-dn3p5-gnn0p12-shf5p32_gsb0-6_csb' int2str(csb*100) '_gbs0-6_cbs' int2str(cbs*100) '_.mat']); %BCw0.00038_BSCw0.00044_SOMw0.00067    BSCrise1p0_BSCdecay8p0
save(filename,'gsb','gbs','csb','cbs','max_pwr_value');



 figure(1); clf;


surf(gsb,gbs,max_pwr_value); view(0,90); %shading interp;
xlabel('SOM-BiC conductance (nS)','fontsize',16);
ylabel('BiC-SOM conductance (nS)','fontsize',16);
zlabel('BSC-SOM conductance (nS)','fontsize',16);

xlim([0,gsb(end,1)]);
%zlabel('Peak Power','fontsize',16);
%title('Noisy PV network, SD=0.25','fontsize',16);
set(gca,'CLim',[0,0.0000000000000000000000000000000000000000005]);
t = colorbar;
%set(get(t,'ylabel'),'String', 'Peak Frequency (Hz)','fontsize',16);
set(get(t,'ylabel'),'String', 'Peak LFP Power','fontsize',16);

%title({'LFP power w equal weights, csb=0.06, cbs=0.04';'BSC-PYR syn param dec'},'fontsize',16)
title_string = sprintf('Max_Power_value, csb=%.2f, cbs=%.4f',csb,cbs);
title(title_string,'fontsize',16);


set(gca,'FontSize',16)
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize',[6 4.5]);
set(gcf,'PaperPositionMode','manual');
set(gcf,'renderer','painters');
%name_file=['380PV_120BSC_467SOM_PV12913020-dn6p6-gnn0p21-gi3-giSD1p5-g3_SOM12915016-dn3p5-gnn0p12-shf5p32_SB-g0-3p2-c6_BS-g0-4-c4_BCw0p00067_BSCw0p00067_SOMw0p00067_0EPSC_Srise1p75_Sdecay5p9'];
%name_file=['380PV_120BSC_467SOM_PV12913020-dn6p6-gnn0p21-gi3-giSD1p5-g3_SOM12915016-dn3p5-gnn0p12-shf5p32_SB-g0-3p2-c6_BS-g0-4-c4_BCw0p00067_BSCw0p00067_SOMw0p00067_0EPSC_BSCPrise1_BSCPdecay8'];
name_file=['Power_380PV_120BiC_350SOM_PV12913020-dn6p6-gnn0p21-gi0-giSD0-g3_SOM12915016-dn3p5-gnn0p12-shf5p32_gsb0-6_csb' int2str(csb*100) '_gbs0-6_cbs' int2str(cbs*100)]; % BCw0.00038_BSCw0.00044_SOMw0.00067   BSCrise1p0_BSCdecay8p0
print(gcf,'-r300','-djpeg',name_file);
print(gcf,'-depsc',name_file);
saveas(gcf,name_file,'fig');

end
