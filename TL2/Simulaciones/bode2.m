close all;
clear all;
clc
%(!)%
graphics_toolkit gnuplot

%%guardo los datos
leido=dlmread('Draft2.txt',',');

frecuencias=leido(1:end,1);
tensiones=leido(1:end,2);
fases=leido(1:end,3);

%%gráfico
Hf = figure(1);

set(Hf,'PaperUnits','inches','PaperPosition',[0 0 3.5 2.5]);

Ha = axes;

grid on;
%grid minor on;	
hold on;
set(Ha,'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',1,'TickDir','in');

%semilogx(Ha, frecuencias, tensiones, 'linewidth', 2); %mod
semilogx(Ha, frecuencias, fases, 'linewidth', 2); %fase



%xlim([0,0.004])
%ylim([-40,-30])

ylabel('Arg(T(s)) [º]');
xlabel('Frecuencia [Hz]');


%Hleg = legend(Ha,'V_i - Entrada','V_o - Salida',"location",'southeast');
%legend('boxon');
%set(Hleg,'FontName','Arial','FontSize',7);

print('bode-a-fase.png','-dpng','-r300');