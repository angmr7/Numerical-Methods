function I = int_simpson(a,b,n)
% n has to be a pair number
% a < b
% in case n is not pair you can interpolate the data
    h = (b-a)/n;
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
end