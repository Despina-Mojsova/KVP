%% reshenie za primer 1
clc
clear
K=1;
T1=4;
T2=10;
num=[-T1*K K];
den=conv([T1 1],[T2 1]);
G_s=tf(num,den);
T0_values=[1 4 8 16];

% Crtam tabela
fprintf('T0|  b1  b2   a1   a2\n');
fprintf('----------------------\n');

for T0=T0_values
    Gz=c2d(G_s,T0,'zoh');
    [bz,az]=tfdata(Gz,'v');
    b1=bz(2);
    b2=bz(3);
    a1=az(2);
    a2=az(3);
    fprintf('%d2|  %8.5f  %8.5f  %8.5f  %8.5f\n',T0,b1,b2,a1,a2);
end

G_s


%% za T0=1 r=0
T=1;
q0=5.958;
q1=-10.337;
q2=4.492;
sim('AV10_PRIMER1')
%% za T0=4 r=0
T=4;
q0=2.322;
q1=-3.074;
q2=1.105;
sim('AV10_PRIMER1')
%% za T0=8 r=0
T=8;
q0=2.000;
q1=-2.080;
q2=0.748;
sim('AV10_PRIMER1')
%% za T0=16 r=0
T=1;
q0=1.779;
q1=-1.089;
q2=0.361;
sim('AV10_PRIMER1')
%% za T0=4 r=0.1
T=4;
q0=1.933;
q1=2.432;
q2=0.816 ;
sim('AV10_PRIMER1')
%% za T0=4 r=0.25
T=4;
q0=1.633;
q1=-2.016 ;
q2=0.637;
sim('AV10_PRIMER1')
%% za T0=8 r=0.1
T=8;
q0=1.714;
q1=-1.685;
q2=0.557 ;
sim('AV10_PRIMER1')
%% za T0=8 r=0.25
T=8;
q0=1.512;
q1=-1.423;
q2=0.440;
sim('AV10_PRIMER1')
%%










