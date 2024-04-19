clearvars;
n = 20;
a = 1;
b = 10;
h = (b-a)/n;
xx = (a:h:b)';
y = f(xx);

figure(1);
plot(xx,y,'ob');
S0 = f(a)+f(b);
S1 = 0;
S2 = 0;
for i=1:n-1 % i = amount of intervals
    x = a + i*h;
    if mod(i,2)==0
        S2 = S2 + f(x);
    else 
        S1 = S1+f(x);
    end
end

I = h/3*(S0+2*S2 + 4 *S1);

% =============

I_exact = (b*log(b)-b)-(a*log(a)-a);