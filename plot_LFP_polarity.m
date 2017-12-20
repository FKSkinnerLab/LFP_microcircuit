function [gsb,gbs,max_freq,max_pwr]=plot_LFP_power(csb);

gsb=[0:0.25:6]'*ones(1,25);
gbs=((0:0.25:6)'*ones(1,25))';
tot_time=5; %total time of simulation in seconds
%cbs=0.1344
csb=0.19;
cbs=csb*0.64;

for i=1:25
    for j=1:25
        gsb_temp=gsb(i,1);
        gbs_temp=gbs(1,j);
        %filename_v=(['LFP_BC380-BSC120-gi3-giSD1.5-PV12913020-dSD6.6ms-gnSD0.21-gpv3.0-gsb' num2str(gsb_temp,'% 10.1f') '-csb0.06-gbs' num2str(gbs_temp,'%10.1f') '-cbs0.04-SOM467-SOM12915016-dSD3.5ms-shift5.32ms-gnSD0.12_BCw0.00067_BSCw0.00067_SOMw0.00067_0EPSC_Srise1.75_Sdecay5.9_v.dat']);
        %filename_v=(['LFP_BC380-BSC120-gi3-giSD1.5-PV12913020-dSD6.6ms-gnSD0.21-gpv3.0-gsb' num2str(gsb_temp,'% 10.1f') '-csb0.06-gbs' num2str(gbs_temp,'%10.1f') '-cbs0.04-SOM467-SOM12915016-dSD3.5ms-shift5.32ms-gnSD0.12_BCw0.00067_BSCw0.00067_SOMw0.00067_0EPSC_BSCPrise1.0_BSCPdecay8.0_v.dat']);

% for the somatic potential
    %filename_v=(['LFP_BC380-BSC120-gi3-giSD1.5-PV12913020-dSD6.6ms-gnSD0.21-gpv3.0-gsb' num2str(gsb_temp,'% 10.1f') '-csb' num2str(csb,'% 10.2f') '-gbs' num2str(gbs_temp,'%10.1f') '-cbs' num2str(cbs,'% 10.4f') '-SOM467-SOM12915016-dSD3.5ms-shift5.32ms-gnSD0.12_BCw0.00067_BSCw0.00067_SOMw0.00067_0EPSC_Srise1.75_Sdecay5.9_v.dat']); %BCw0.00038_BSCw0.00044_SOMw0.00067   BSCrise1.0_BSCdecay8.0

    filename_v = (['somatic_LFP_power_only_gsb=' num2str(gsb_temp, '% 10.2f') '_gbs=' num2str(gbs_temp,'% 10.2f') '_csb=0.19.txt']);

    %somatic_LFP_power_only_gsb-0.75_gbs-0.75_csb-0.21.txt]);
        
           checkfile=exist(filename_v);
        if checkfile~=0
            fid=fopen(filename_v);
            v=textscan(fid,'%f');           
            fclose(fid);
            [freq,pwr,max_theta_freq,max_theta_pwr,max_freq_temp,max_pwr_temp,av_pwr_temp]=make_LFP_polarity(v{1}(:),tot_time);
            max_freq(i,j)=max_freq_temp;
            max_pwr(i,j)=max_pwr_temp;
            av_pwr(i,j)=av_pwr_temp;
        else
            %convert this to a warning or error.
            disp(['Could not open file'  filename_v]);
            %disp(['OS returned this message: ' message]);
            max_freq(i,j)=-10;    
            max_pwr(i,j)=0;
        end
    end
end


filename=(['380PV_120BSC_467SOM_PV12913020-dn6p6-gnn0p21-gi0-giSD0-g3_SOM12915016-dn3p5-gnn0p12-shf5p32_gsb0-6_csb' int2str(csb*100) '_gbs0-6_cbs' int2str(cbs*100) '_BCw0.00067_BSCw0.00067_SOMw0.00067_0EPSC_Srise1p75_Sdecay5p9.mat']); %BCw0.00038_BSCw0.00044_SOMw0.00067    BSCrise1p0_BSCdecay8p0
save(filename,'gsb','gbs','csb','cbs','max_freq');

figure(1);clf;

%% In the following line I made replaced "max_freq" with "av" for average peak value April 22 2016
%%surf(gsb,gbs,max_freq);view(0,90);shading interp;

surf(gsb,gbs,av_pwr);view(0,90);%shading interp;
xlabel('SOM-BSC conductance (nS)','fontsize',16);
ylabel('BSC-SOM conductance (nS)','fontsize',16);
zlabel('Polarity','fontsize',16);

xlim([0,gsb(end,1)+0.25]);
ylim([0,gbs(1,end)+0.25]);

set(gca,'CLim',[0,0.0000000000000000000000000000000000000000005]);
t = colorbar;
set(get(t,'ylabel'),'String', 'Polarity','fontsize',16);

title_string = sprintf('Polarity, csb=%.2f, cbs=%.4f',csb,cbs);
title(title_string,'fontsize',16);

set(gca,'FontSize',16)
set(gcf,'PaperUnits','inches');
set(gcf,'PaperSize',[6 4.5]);
set(gcf,'PaperPositionMode','manual');
set(gcf,'renderer','painters');

name_file=['380PV_120BSC_500SOM_PV12913020_gsb0-6_csb' int2str(csb*100) '_gbs0-6_cbs' int2str(cbs*100) '_0EPSC']; 
print(gcf,'-r300','-djpeg',name_file);
print(gcf,'-depsc',name_file);
% saveas(gcf,name_file,'fig'); hold on
% saveas(gcf,name_file,'png');
extensions = {'fig','png'};
    for k = 1:length(extensions)
    saveas(gcf,name_file, extensions{k})
    end

end
