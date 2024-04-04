clearvars;
x = (0:0.1:1)';
y = exp(x);
xt = 0.05;
epsilon = 1e-3;

yt = neuville_interpolation(x,y,xt,epsilon);