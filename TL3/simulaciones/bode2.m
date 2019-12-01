close all;
clear all;
clc
%(!)%
graphics_toolkit gnuplot

%%guardo los datos
leido=dlmread('bode_sin_punta.txt',',');

frecuencias=leido(1:end,1);
tensiones=leido(1:end,2);
fases=leido(1:end,3);

%%gr�fico
Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;
%grid minor on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');

semilogx(Ha, frecuencias, tensiones, 'linewidth', 3); %mod
%semilogx(Ha, frecuencias, fases, 'linewidth', 2); %fase



%xlim([0,0.004])
%ylim([-40,-30])

ylabel('|A_{vs}| [dB]');
xlabel('Frecuencia (Hz) [log]');


%Hleg = legend(Ha,'V_i - Entrada','V_o - Salida',"location",'southeast');
%legend('boxon');
%set(Hleg,'FontName','Arial','FontSize',7);

print('sim_sin_bode.png','-dpng','-r300');