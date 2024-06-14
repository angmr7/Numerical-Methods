clearvars;

%Constantes a utilizar:
e = 1.60217662e-19; %C
m = 9.10938356e-31; %Kg
epsilon_0 = 8.8541878128e-12; %C^2/(N*m^2)

%Carga movil
n = -1;
q = n*e;
r0 = [0,0,0];
v0 = [0,0,0];

%Primera carga fija.
n = -1;
q1 = n*e;
r1 = [0.1,-0.1,0];

%Segunda carga fija.
n = 3;
q2 = n*e;
r2 = [0.2,-0.1,0];

%Tercera carga fija.
n = -1;
q3 = n*e;
r3 = [0.2,-0.2,0];

%Cuarta carga fija.
n = 10;
q4 = n*e;
r4 = [0.2,-0.2,1];

figure(1);
clf(1);
plot3(r0(1),r0(2),r0(3),'o','Color','g','MarkerFaceColor','k');
hold on;
plot3(r1(1),r1(2),r1(3),'o','Color','r','MarkerFaceColor','r');
plot3(r2(1),r2(2),r2(3),'o','Color','r','MarkerFaceColor','r');
plot3(r3(1),r3(2),r3(3),'o','Color','b','MarkerFaceColor','b');
plot3(r4(1),r4(2),r4(3),'o','Color','r','MarkerFaceColor','r');
hold off;
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
text(r1(1),r1(2),r1(3),'\leftarrow q_1');
text(r2(1),r2(2),r2(3),'\leftarrow q_2');
text(r3(1),r3(2),r3(3),'\leftarrow q_3');
text(r4(1),r4(2),r4(3),'\leftarrow q_4');

% E1 = @(r) (1/(4*pi*epsilon_0))*q1*(r-r1)/(dot((r-r1),(r-r1)))^(3/2);
% E2 = @(r) (1/(4*pi*epsilon_0))*q2*(r-r2)/(dot((r-r2),(r-r2)))^(3/2);
% E3 = @(r) (1/(4*pi*epsilon_0))*q3*(r-r3)/(dot((r-r3),(r-r3)))^(3/2);
% E4 = @(r) (1/(4*pi*epsilon_0))*q4*(r-r4)/(dot((r-r4),(r-r4)))^(3/2);
% f = @(r) (q/m)*(E1(r)+E2(r)+E3(r)+E4(r));


N = 1e6;
t = zeros(N,1);
r = zeros(N,3);
v = zeros(N,3);
r(1,:) = r0;
v(1,:) = v0;
% ti = 0;
% tf = 10e-4;
% tf = 10e-3;
% h = (tf-ti)/N;
h = 10e-8;

for i=1:N-1

    E1 = (1/(4*pi*epsilon_0))*q1*(r(i,:)-r1)/(dot((r(i,:)-r1),(r(i,:)-r1)))^(3/2);
    E2 = (1/(4*pi*epsilon_0))*q2*(r(i,:)-r2)/(dot((r(i,:)-r2),(r(i,:)-r2)))^(3/2);
    E3 = (1/(4*pi*epsilon_0))*q3*(r(i,:)-r3)/(dot((r(i,:)-r3),(r(i,:)-r3)))^(3/2);
    E4 = (1/(4*pi*epsilon_0))*q4*(r(i,:)-r4)/(dot((r(i,:)-r4),(r(i,:)-r4)))^(3/2);
    f = (q/m)*(E1+E2+E3+E4);

    k1 = h*f;
    k2 = h*f;
    k3 = h*f;
    k4 = h*f;
    v(i+1,:) = v(i,:) + (1/6)*(k1+2*k2+2*k3+k4);

    k1 = h*v(i,:);
    k2 = h*v(i,:);
    k3 = h*v(i,:);
    k4 = h*v(i,:);
    r(i+1,:) = r(i,:) + (1/6)*(k1+2*k2+2*k3+k4);
    t(i+1) =t(i)+h; 
end


figure(2);
clf(2);
plot3(r0(1),r0(2),r0(3),'o','Color','g','MarkerFaceColor','k');
hold on;
plot3(r1(1),r1(2),r1(3),'o','Color','b','MarkerFaceColor','b');
plot3(r2(1),r2(2),r2(3),'o','Color','r','MarkerFaceColor','r');
plot3(r3(1),r3(2),r3(3),'o','Color','b','MarkerFaceColor','b');
plot3(r4(1),r4(2),r4(3),'o','Color','r','MarkerFaceColor','r');
plot3(r(:,1),r(:,2),r(:,3),'-','Color','k');
hold off;
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
text(0,0,0,'\leftarrow t = 0');
text(r1(1),r1(2),r1(3),'\leftarrow q_1');
text(r2(1),r2(2),r2(3),'\leftarrow q_2');
text(r3(1),r3(2),r3(3),'\leftarrow q_3');
text(r4(1),r4(2),r4(3),'\leftarrow q_4');
text(r(end,1),r(end,2),r(end,3),['\leftarrow t = ',num2str(t(end))]);
%xlim([0,1]);
%ylim([0,1]);