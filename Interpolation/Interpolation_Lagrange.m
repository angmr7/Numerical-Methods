clearvars;
x = (1:0.5:100)';
y = 1./x;
figure(1);
plot(x,y, 'ob');
xlabel('x');
ylabel('y');
xt = 50.3; %numero diferente a los que hay en el array x % Encontrar yt para xt

Lk = zeros(size(x));

L = 1;
for k=1:size(x,1) % 1 a 10 dado que ese size da el numero de columnas 
    for i=1:size(x,1)
        if x(i)~=x(k)
            Lt=(xt-x(i))/(x(k)-x(i));
            L=L*Lt;
        end
    end
    Lk(k)=L;
    L=1; % para que la productoria reinicie
end

yt=0;
for i=1:size(y,1)
    yt = y(i)*Lk(i)+yt;
end
diff = (1/xt-yt);

figure(2);
plot(x,Lk, '-b');