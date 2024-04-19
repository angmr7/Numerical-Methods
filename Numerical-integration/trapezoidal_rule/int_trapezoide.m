function I = int_trapezoide(a,b,n)
    h = (b-a)/n;
    S0 = f(a);
    S = 0;
    Sn = f(b);
    for i=1:(n-1)
        x = a+i*h;
        S = S + f(x);
    end
    I = (h/2)*(S0 + 2*S + Sn);
end