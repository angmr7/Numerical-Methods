clearvars;
x = (-6:0.001:10)';

f = @(x) (x-2).*(x+5).*(x-7);
df = @(x) (x+5).*(x-7) + (x-2).*(x-7) + (x-2).*(x+5);

figure(1);
plot(x,f(x),'-b');
xlabel('x');
ylabel('y');
grid('on');

tol = 1e-10;
n = 100;
xn = 0;
for i=1:n
    xnn = xn - f(xn)/df(xn);

    if abs(xnn-xn) <= tol
        break;
    end
    xn = xnn;
end    

%---
%Solve the system 
%---

x = 0.1;
y = 0.1;

sn = [x,y]';

tol = 1e-10;
N = 100;

for i=1:N
    J = [8*x + 2*y, 2*y + 2*x-1;...
        4*x + 3*y, 3*x+2*y];
    F = [4*x^2+y^2+2*x*y-y-2;...
        2*x^2+3*x*y + y^2-3];
    v = J\(-F);

    snn = sn + v;
    test = sqrt(dot(sn-snn,sn-snn));

    if test<=tol
        break;
    end
    
    sn = snn;
    x = sn(1);
    y = sn(2);

end