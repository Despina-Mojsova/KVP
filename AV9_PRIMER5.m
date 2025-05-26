%% reshenie na primer 5
K=1;
T1=10;
T2=7;
T3=3;
T4=2;
Tt=4;
num=[K*T4 K];
p1=[T1, 1];
p2=[T2 ,1];
p3=[T3 ,1];
p12=conv(p1,p2);
p123=conv(p12,p3);
den=[p123];
G=tf(num,den)
%% za T=2 spored I2 -> r=0
T=2;
q0 = 1.8585;   
q1 = -1.8585;   
q2 = 0.1190;
sim('AV9_5')
%% za T=4 spored I2->r=0
T=4;
q0 = 1.8649;   
q1 = -1.8649;   
q2 = 0.2403;
sim('AV9_5')
