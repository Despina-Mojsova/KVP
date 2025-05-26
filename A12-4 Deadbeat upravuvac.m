%%% Za prenosna funkcija na kontinualen proces dadena so negoviot broitel,
%%% imenitel, docnenje, i red so koj toa docnenje ke se aproksimira, se
%%% dobiva diskretiziran model: 
clc
clear;
sampling_time = 4;                      % Perioda na sempliranje
delay = 4;                              % Docnenje vo kontinualniot sistem
order = 1;                              % So koj red da se aproksimira docnenjeto
num = [2 1];                            % Broitel na kontinualniot proces
den = conv([10,1],conv([7 1],[3 1]));   % Imenitel na kontinualniot proces

sys_continous = tf(num,den)                       % Formiraj kontinualen proces
[num_delay, den_delay] = pade(delay,order);          % Aproksimiraj docnenje
sys_delay = tf(num_delay,den_delay);                
sys_series = sys_continous*sys_delay;                % Svrzi gi procesot i docnenjeto vo serija
sys_series_discrete = c2d(sys_series,sampling_time); % Diskretiziraj go celiot sistem 

%%% Od dobieniot diskreten model na procesot, se izveduva modelot na
%%% digitalen DeadBeat upravuvac. Ovoj upravuvac (t.e. polinomite na
%%% negovite broitel i imenitel) treba da se eksportiraat vo Simulink,
%%% konkretno vo delot "Primer 3" od fajlot KVP_vezba9.slx: 
num_d = sys_series_discrete.num{1,1};       % Broitelot na prenosnata funkcija na diskretniot proces
den_d = sys_series_discrete.den{1,1};       % Imenitelot na prenosnata funkcija na diskretniot proces
size_num_d = size(num_d);                   % Brojot na clenovi na ovie polinomi (t.e. redot na sistemot)
size_num_d = size_num_d(2);

sum = 0;                                    % Sumata na koeficientite na broitelot na procesot
q = zeros(1,size_num_d);                    % Definiraj prazen vektor za polinomot q
p = zeros(1,size_num_d);                    % Definiraj prazen vektor za polinomot p
for i=1:size_num_d
    sum = sum+num_d(i);                     % Presmetaj ja sumata na koeficientite na broitelot na procesot
end
q(1) = 1.0/sum;                             % q0 e sekogas reciprocna vrednost od sumata
p(1) = 1;                                   % p0 e sekogas 1

for i=1:size_num_d-1                        % Za site ostanati koeficienti (indeksite se pomesteni za 1 bidejki MATLAB numerira pocnuvajki od 1):
    q(i+1) = q(1)*den_d(i+1);               %   q(i) = a(i)*q0
    p(i+1) = -q(1)*num_d(i+1);             %   p(i) = b(i)*q0
end                                         % Po izvrsuvanje na ovaa komanda, q e broitelot, a p e imenitelot na DeadBeat upravuvacot

dead_beat_controller = tf(q,p,sampling_time) % Formiraj go DeadBeat upravuvacot 