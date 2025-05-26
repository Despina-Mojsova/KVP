%% primer 4
K=1;
T1=10;
T2=7;
T3=3;
T4=2;
Tt=4;
num_s=[K*T4 K];
p1=[T1, 1];
p2=[T2,1];
p3=[T3,1];
p12=conv(p1,p2);
den_s=conv(p12,p3);
[num_delay,den_delay]=pade(3,Tt);
G_delay=tf(num_delay,den_delay);
G_s=tf(num_s,den_s)
% VO SIMULACIITE NE GO ZEMAAT  VRMENSKOTO DOCNENJE

%% koga r=0 i T0=1
clc 
clear
T=1;
q0=17.2239;
q1=-32.5455;
q2=15.4545;
sim('AV9_4')
%% koga r=0 i T0=2
clc
clear
T=2;
q0=9.2620;
q1=-16.4581;
q2=7.4604;
sim('AV9_4')
%% koga r=0 i T0=4
clc
clear
T=4;
q0=4.5498 ;
q1=-7.1625;
q2=3.0287;
%% koga r=0 i T0=8
clc
clear
T=8;
q0=2.4367 ;
q1=-2.9948;
q2=1.1581;
%% koga r=0 i T0=16
clc
clear
T=16;
q0=1.9573 ;
q1=-1.6594;
q2=0.6675;







