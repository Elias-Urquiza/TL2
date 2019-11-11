%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circuitos 1
clear all, close all;
graphics_toolkit gnuplot

% Importo datos
SIM=dlmread("oscilador.txt",'\t',1,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##Grafs.

Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');

plot(Ha,SIM(2:1:end,1)*10^3, SIM(2:1:end,2),'-r','linewidth',3);

xlim([0,25])
ylim([0,20])

ylabel('V [V]');
xlabel('t [ms]');


Hleg = legend(Ha,'V_o - Salida; V_{M}=13.03V; f=515Hz',"location",'southeast');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',7);

print('salida_oscilador.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

