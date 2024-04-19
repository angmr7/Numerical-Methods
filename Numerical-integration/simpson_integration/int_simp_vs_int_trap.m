clearvars;
n = 10;
a =1;
b= 10;
I_trap = int_trapezoide(a,b,n);
I_simp = int_simpson(a,b,n);
I_exact = (b*log(b)-b)-(a*log(a)-a);