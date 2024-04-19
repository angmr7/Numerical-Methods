% there is no restriction for n in this algorithm
clearvars; 
n = 50;
a = 1;
b = 10;
h = (b-a)/n;
x = (a:h:b)';
y = log(x);
%-------------

figure(1);
plot(x,y,'ob');

%-------------

S0 = y(1);
S = 0;
Sn = y(end);

for i=1:(n-1)
    xx = a + i*h; % you can directly sent the function without applying log
    S = S + y(i+1);
end

I_num = (h/2)*(S0 +2*S+Sn);

%-------------
format long % convert the format of the doubles to long for more decimals
I_exac = (x(end)*log(x(end))-x(end))-(x(1)*log(x(1))-x(1));