clearvars;
ti = 0;
tf = 2;
x0 = 0.01;
v0 = 0;
k = 2.0;
m = 0.010;
f = @(x) -k/m*x;
N = 1e4;
h = (tf-ti)/N;
t = zeros(N+1,1);
v = zeros(N+1,1);
x = zeros(N+1,1);
t(1) = ti;
v(1) = v0;
x(1) = x0;
for i=1:N
    t(i+1) = ti + i*h;
    v(i+1) = v(i) + h*f(x(i));
    x(i+1) = x(i) + h*v(i);
end

figure(1);
plot(t,x, '.b');
xlabel('t');
ylabel('x');

figure(2);
plot(t,v, '.b');
xlabel('t');
ylabel('v');