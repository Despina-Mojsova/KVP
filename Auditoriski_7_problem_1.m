%% da se implementira PID vo matlab
% prvo se definiraat koeficientite
Kp=1;
Ki=1;
Kd=1;
% za PID upravuvach ima posebna funkcija vo matlab
Controller=pid(Kp,Ki,Kd);
% konstantite mora da se proporcionalna, integralna, diferencijanla po ovoj
% redoslad
G0=tf(1,[1,3,0.9]);
G=feedback(Controller*G0,1);
step(G) % na otskocna vlezna vozbuda; direkno crta grafik
pidTuner(G,'pid') %gi dava najdobrite parametri, matlab avotmatski go nagoduva PID

