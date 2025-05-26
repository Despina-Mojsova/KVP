%% reshenie na prviot primer od AV9, idejata na ova e da go pogodam Tt zoshto ne e dadeno
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
Tt=2; % vremensko docnenje od edna sekunda
[num_delay,den_delay]=pade(5,Tt); % 5 mi e zoshto diskretizacijata odi 
%do z^(-5) vo baranata forma na G
G_delay=tf(num_delay,den_delay);

% konecno prenosnata funkcija vo s domen
G_total_s=G_s_without_delay * G_delay;
