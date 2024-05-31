clearvars;
q = 1.60217e-19; % C
ma = 1.66053906660e-27;
m = 6.6464e-27; % Kg
N = 1000;
B0 = 0.1; %Tesla
V1 = 100; %Volts
V2 = 0; %Volts
d = 0.02; %m
E0 = (V1-V2)/d; % Volts/m
E = [E0,0,0];
B = [0,0,B0];

a = @(V,E,B,m) (q/m)*(E+cross(V,B)); %dv/dt

v0 = [0,0,0];
r0 = [0,0,0];
ti = 0;
%tf = 50e-9*2;
tf = 15e-6;
h = (tf-ti)/N;


mm = ma*[1,2,3,4,5,6,7];
figure(555);
hold on;

for j=1:size(mm,2)
    t = zeros(N,1);
    r = zeros(N,3);
    v = zeros(N,3);
    r(1,:) = r0;
    v(1,:) = v0;
    t(1) = ti;
    
    for i=1:N
        t(i+1) = ti + i*h;
        if r(i,1) <= d
            B = [0,0,0];
            E = [E0,0,0];
        else
            B = [0,0,B0];
            E = [0,0,0];
        end
        v(i+1,:) = v(i,:) + h*a(v(i,:), E,B,mm(j)); 
        r(i+1,:) = r(i,:) + h*v(i,:);
    
        if ((v(i,1)<0)) && (r(i,1) <= d)
            break;
        end
    end
    plot(r(:,1), r(:,2), '.b')
end

hold off;

figure(1);
plot(t,v(:,1), 'ob');
xlabel('t');
xlabel('vx');

figure(2);
plot(t,v(:,2), 'or');
xlabel('t');
xlabel('vy');

figure(3);
plot(t,r(:,1),'.b');
xlabel('t(s)');
ylabel('x(t)');

figure(4);
plot(t,r(:,2),'.r');
xlabel('t(s)');
ylabel('y(t)');

figure(5);
plot(r(:,1),r(:,2),'.b');
xlabel('x(t)');
ylabel('y(t)');