clearvars;
f = @(t,y) y-t^2+1;
% exact solution y(t) = (t+1)^2 + 1/2 exp(t)
a = 0;
b = 2;
N = 10;
h = (b-a)/N;
y = zeros(N+1,1);
y(1) = 1/2;
t = zeros(N+1,1);
t0 = 0;
y(1) = 1/2;
t(1) = t0;

for i=1:N
  t(i+1) = a+i*h;
  %t(i+1) = t(i);
  y(i+1) = y(i) + h*f(t(i), y(i));
end

figure(1);
plot(t,y,'ob')
