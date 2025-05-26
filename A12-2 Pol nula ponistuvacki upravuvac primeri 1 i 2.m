%% Primer 1
% Celata zadaca treba samo da ja napravis vo simulink bidejki celta e da se
% vidi koja od vleznite signali odgovata na minimalnata prenosna funkcija.
% Racnite dobieni rezultati ako sakas da gi napises vo matlab, a i ne moras
% ama eve
clc; clear;

% Definiranje na prenosnata funkcija Gw(z) = 2z^(-1) - z^(-2)
num = [0 2 -1];  % Numerator: z^(-1) => 2, z^(-2) => -1
den = 1;         % Denominator

N = 15;  % Broj na tocki (kolku vrednosti na y[k] sakas)

% a) Otsocna vlezna funkcija (step input)
u_step = ones(1, N);                  % u[k] = 1 za site k
y_step = filter(num, den, u_step);   % y[k] = 2u[k-1] - u[k-2]
disp('a) Otsocen odziv (step input):');
disp(y_step);

% b) Linearna vlezna funkcija (ramp input)
u_ramp = 0:N-1;                       % u[k] = k
y_ramp = filter(num, den, u_ramp);
disp('b) Ramp odziv (linearen vlez):');
disp(y_ramp);

% c) Parabolichen vlez (u[k] = k(k+1)/2)
k = 0:N-1;
u_parab = k .* (k + 1) / 2;           % Parabolic input
y_parab = filter(num, den, u_parab);
disp('v) Parabolichen odziv:');
disp(y_parab);

% Zaklucok:
% Od odzivite dobieni so simulink modelot, ocigledno e deka minimalnata
% sistemska prenosna funkcija obezbeduva sledenje bez greska vo stacionarna
% sostojba vo slucajot na linearno rastecki referenten signal. Ako
% upotrebime otskocen vlezen signal, gledame deka se dobiva sledenje bez
% greska vo stacionarna sostjba isto i za vakvata funkcija, dodeka odzivot
% ima mnogu golem preskok. Najdobar odziv se dobiva vo slucajot na linearna
% rastecka funkcija, t.e. pri onaa funkcija, za koja sto bese proektiran
% sistemot. Vo slucaj na vlezna funkcija od povisok red, dobivame greska vo
% stacionarna sostojba

%% POJMA NEAM SO E OVA NI OD KADE E
clc
s = tf('s');
z = tf('z',0.1);
G1 = 1/(s*(s+1));   % kontinualen proces 
G2 = c2d(G1,0.1);   % diskretizacija so To = 100ms
Gw = 1/z;           % minimalna prenosna funkcija na zatvoreniot sistem
Gr = (1/G2)*(Gw/(1-Gw));    % pol-nula ponistuvacki regulator 

%% Primer 2
clc
s = tf('s');
z = tf('z',T0);

K = 1;
T1 = 10;
T2 = 7;
T3 = 3;
T4 = 2;
Tt = 4;
T0 = 16;
%Ja definiram prenosnata funkcija bez docnenje na procesot
G_s = (K*(1+T4*s))/((1+T1*s)*(1+T2*s)*(1+T3*s))

% Aproksimacija na docnenjeto so prenosna funkcija od prv red
[num_pade, den_pade] = pade(Tt,1);
Pade = tf(num_pade, den_pade);

%Prenosnata funkcija so docnenje e
Gs = G_s*Pade;
% Prenosnata funkcija na procesot e 
Gp = c2d(Gs,T0)

% Bidejki se bara da ima nuleva stacionarna greska pri otskocen vlezen
% signal, togas Gw ke ima vakva forma
Gw = 1/z;

% Za upravuvacot ke dobieme
Gr = (1/Gp)*(Gw/(1-Gw))

% nesto ne iskaca kako vo labsot za Gr
