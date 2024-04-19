clearvars;
n = 5;
a = 1;
b = 10;
I = int_trapezoide(a,b,n);
format long % convert the format of the doubles to long for more decimals
I_exac = (b*log(b)-b)-(a*log(a)-a);