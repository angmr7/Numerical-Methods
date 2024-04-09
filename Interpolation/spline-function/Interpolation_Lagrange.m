clearvars;

x = [0:0.5:10]';
y = exp(x);

xt = 1.28;

yt = spline_interpolation(x,y,xt);

xt = spline_interpolation(y,x,yt); % should be the almost the same as the definition