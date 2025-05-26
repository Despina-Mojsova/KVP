%% reshenie na prviot primer od AV9
clc;
clear;
p1=conv([13.81 ,1],[13.81, 1]);
p2=[18.4 ,1];
num_s_without_delay=conv(p1, p2);
p3=[59 1];
den_s=p3;
for k=1:4
    den_s=conv(den_s,p3);
end
G_s_without_delay=tf(num_s_without_delay,den_s);

% definiram vremensko docnenje
Tt=1; % vremensko docnenje od edna sekunda
[num_delay,den_delay]=pade(5,Tt); % 5 mi e zoshto diskretizacijata odi 
%do z^(-5) vo baranata forma na G
G_delay=tf(num_delay,den_delay);

% konecno prenosnata funkcija vo s domen
G_total_s=G_s_without_delay * G_delay;


% Definiranje na periodite na diskretizaciaj
T0_values=[1 4 8 16];

% Crtanje na tabela
fprintf('T0| b1 b2 b3 b4 b5 a1 a2 a3 a4 a5\n');
fprintf('-------------------------------------\n');

% for ciklus koj prenosnata funkcija kje ja diskretizira za povekje
% vremenski momenti
for T0=T0_values
    Gz=c2d(G_total_s,T0,'zoh');
    [bz,az]=tfdata(Gz,'v');
    b1=bz(2);
    b2=bz(3);
    b3=bz(4);
    b4=bz(5);
    b5=bz(6);
    a1=az(2);
    a2=az(3);
    a3=az(4);
    a4=az(5);
    a5=az(6);
    fprintf('%2d| %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f\n',T0, b1, b2, b3, b4, b5, a1,a2, a3, a4, a5);
end






