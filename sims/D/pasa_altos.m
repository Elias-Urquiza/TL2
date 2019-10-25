close all;
clear all;

pkg load control
pkg load symbolic

s=tf('s');



R=10E3
C=10E-9


h_ideal=1/(1+1/(s*R*C))


[y_step_ideal, t_step_ideal] = step(h_ideal);

[mod_bode_ideal, fase_bode_ideal, w_bode_ideal] = bode(h_ideal);

f=w_bode_ideal/(2*pi());

%%Modulo
figure(1)
hold on;

%Ideal:
semilogx(f, 20*log10(mod_bode_ideal), 'linewidth', 5, '-k');

%opciones graf
grid on;
grid minor on;
title("Diagrama de Bode - Modulo");
xlabel("w[log]","fontsize", 12);
ylabel("|H(jw)|[dB]","fontsize", 12);
%axis([100 10e4 -60 0]);
print("bode-mod.png");


hold off;

%%Fase
%%Opciones Graf
figure(2)
hold on;

semilogx(f, fase_bode_ideal, 'linewidth', 5, '-b');

grid on;
grid minor on;
title("Diagrama de Bode - Fase");
xlabel("f [log]","fontsize", 12);
ylabel("Arg[H(jw)] [º]","fontsize", 12);
%axis([100 10e4 -100 100]);
print("bode-fase.png");
hold off;
return;