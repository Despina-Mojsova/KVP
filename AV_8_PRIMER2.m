%% reshenie na primer 2 od AV8
clear;
clc;

% Definiranje na vrednostite na K,T1,T2
K=1;
T1=4;
T2=10;
 
% Definiranje na imenitel i broitel na prenosnata funkcija
num_s=K*[-T1,1]; % Ova e K*[-T1*s +K] stepeni na s od najvisok -> najnizok
den_s=conv([T1,1],[T2,1]); % funkcijata conv() mnozi povekje polinomi

% Definiranje na kontunualnata prenosna funkcija
G_s=tf(num_s,den_s);

%Definiranje na periodite na diskretizacija
T0_values=[1,4,8,16];
%Crtanje na tabela
fprintf(' T0   |   b1        b2        a1        a2\n');
fprintf('--------------------------------------------\n');

% for ciklus so koj prenosnata funkcija kje se diskretizira za povekje
% vremenski momenti
for T0=T0_values
    Gz=c2d(G_s,T0,'zoh'); % c2d za diskretizacija (funkcija,vreme,nechin)
    [bz,az]=tfdata(Gz,'v'); % v znachi rezultatite da gi vrati vo vektorska forma
    b1=bz(2); % od z^-1
    b2=bz(3); % od z^-2
    a1=az(2); %z^-1
    a2=az(3); %z^-2
    fprintf(' %2d   | %8.5f  %8.5f  %8.5f  %8.5f\n', T0, b1, b2, a1, a2); % 2 karakteri,
    %8 karakteri 5 decimali
end
    
