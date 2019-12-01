%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circuitos 1
clear all, close all;
graphics_toolkit gnuplot

% Importo datos
SIM=dlmread("vomax.txt",'\t',1,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##Grafs.

Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');

plot(Ha,SIM(2:1:end,1)*10^3, SIM(2:1:end,2),'-b','linewidth',3); %Vi
plot(Ha,SIM(2:1:end,1)*10^3, SIM(2:1:end,3),'-r','linewidth',3); %Vo


%xlim([0,25])
ylim([-4,2])

ylabel('V [V]');
xlabel('t [ms]');


Hleg = legend(Ha,'V_i - Entrada; V_{p}=220mV ;f=5KHz', 'V_o - Salida; V_{pp}=4.2V',"location",'southeast');
legend('boxon');
set(Hleg,'FontName','Arial','FontSize',7);

print('vomax_sim.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

