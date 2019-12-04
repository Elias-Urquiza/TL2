%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circuitos 1
clear all, close all;
graphics_toolkit gnuplot

% Importo datos
SIM=dlmread("vi2.csv",';',1,0);
SIM2=dlmread("vo.csv",';',1,0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##Grafs.

Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');

plot(Ha,SIM(1:1:end-1000,1)*10^3, SIM(1:1:end-1000,2)*10^3,'-b','linewidth',3); %Vi
plot(Ha,SIM2(2:1:end-1000,1)*10^3-0.1, SIM2(2:1:end-1000,2)*10^3,'-r','linewidth',3); %Vo


xlim([0,0.5])
ylim([-1500,1000])

ylabel('V [mV]');
xlabel('t [ms]');


Hleg = legend(Ha,'V_i - Entrada; V_{p}=100mV ;f=5KHz', 'V_o - Salida; V_{p}=880mV',"location",'southeast');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',7);

print('AvTRUCHO.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

