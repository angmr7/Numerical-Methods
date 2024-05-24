clearvars;
% ODE: ma = [0,-mg]
% a = [0,-g]
% a = dv/dt
% dv/dt = [0,-g]
% drdt = v
g = 9.81; %m/s^2
f = @() [0,-g];
ti = 0; %s
tf = 1.4; %s
r0 = [0,0];
vm = 10; % m/s
theta = 45;
v0 = [vm*cos(theta*pi/180), vm*sin(theta*pi/180)]; % matlab use rad
N = 1e4;
h = (tf-ti)/N;
t = zeros(N+1,1);
v = zeros(N+1,2); % ,2 because it will have the components of vx and vy
r = zeros(N+1,2);
t(1) = ti;
v(1,:) = v0; % fill the first row all the columns
r(1,:) = r0;
for i=1:N
    t(i+1) = ti + i*h;
    v(i+1,:) = v(i,:) + h*f();
    r(i+1,:) = r(i,:) + h*v(i,:);
end

figure(1);
plot(t,r, '.b');
xlabel('t');
ylabel('x & y');

figure(2);
plot(t,v, '.b');
xlabel('t');
ylabel('v');

figure(3);
plot(t,v(:,2), '.b');
xlabel('t');
ylabel('v_y');

figure(4);
plot(t,v(:,1), '.b');
xlabel('t');
ylabel('v_x');

figure(5);
plot(r(:,1),r(:,2), '.b');
xlabel('t');
ylabel('x & y');
