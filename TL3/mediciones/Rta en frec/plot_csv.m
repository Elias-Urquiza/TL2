%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circuitos 1
clear all, close all;
graphics_toolkit gnuplot

% Importo datos
SIM=dlmread("Activas.csv",';',1,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##Grafs.

Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',7,'GridLineStyle','--','LineWidth',1,'TickDir','in');

%Ideal:
semilogx(Ha,SIM(2:1:end,1), SIM(2:1:end,2), 'linewidth', 5, '-or', 'markersize', 2);


%opciones graf
grid on;
grid minor on;

%xlim([0,25])
%ylim([0,20])

title("Respuesta en Frecuencia medida con puntas activas");
xlabel("f[log] (Hz)","fontsize", 8);
ylabel("|A_{vs}| (V)","fontsize", 8);

%Hleg = legend(Ha,'V_o - Salida; V_{M}=13.03V; f=515Hz',"location",'southeast');
%legend('boxon');
%set(Hleg,'FontName','Arial','FontSize',7);

print('activas.png','-dpng','-r300');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

