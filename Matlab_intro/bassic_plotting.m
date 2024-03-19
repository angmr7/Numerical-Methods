a = 25;
clearvars; % borrar variables
filename = 'two_signals.csv';
A = readmatrix(filename);
n = A(:,1);
dt = 2.0e-9: % valor del timepo discreto 
t = n*dt;
V_C1 = A(:,2);
V_C2 = A(:,3);
figure(1);
plot(t,V1);

ylabel('Time (s)');

xlabel('Voltaje (V)');

hold on;

figure(2);
plot(t,V2);

ylabel('Time (s)')

xlabel('Voltaje (V)')

figure(3);
plot(t,V3, 'oog');

ylabel('Time (s)')
xlable('Voltaje (V)')

hold off;
