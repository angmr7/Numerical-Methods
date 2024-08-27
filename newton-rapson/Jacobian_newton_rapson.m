% y'' = y' cos(x) - y ln(y)
% Derivatives
%  fy = -ln(y)-1
%  fy' = cos(x)

clearvars;

N = 10;

a = 0;
b = pi/2;
y0 = 1;
yN = exp(1);
fy = @(y) -log(y) - 1;
fyp = @(x) cos(x);
h = (b-a)/(N+1);
x = (a:h:b)';
tol = 1e-10;

% Jacobian matrix (F and y)
J = zeros(N);
F = zeros(N,1);
y = 0.5*ones(N,1); %because is newton rapson and it needs an initial value for the iteration

% Fill the Jacobian matrix
n = 20;
for k=1:n
    for i=1:N
        J(i,i) = 2+h^2*fy(x(i+1));
    end
    for i = 1:N-1
        J(i,i+1) = -1+(h/2)*fyp(x(i+1));
        J(i+1,i) = -1-(h/2)*fyp(x(i+1));
    end
    %spy(J);
    
    % Fill F with an initial value
    F(1) = -y0 + 2*y(1) - y(2)+h^2*(((y(1)-y0)/(2*h))*cos(x(1))-y(1)*log(y(1)));
    
    for i=2:N-1
        F(i) = -y(i-1)+2*y(i)-y(i+1)+h^2*(((y(i+1)-y(i-1))/(2*h))*cos(x(i))-y(i)*log(y(i)));
    end
    F(N) = -y(N-1)+2*y(N)-yN+h^2*(((yN-y(N-1))/(2*h))*cos(x(N)-y(N)*log(y(N))));
    
    v = J\(-F);
    y = y+v;
    
    if sqrt(dot(v,v))<=tol
        break;
    end
    
    yt = [y0;y;yN];
    
    figure(1);
    plot(x,yt,'ob');
    pause(1);

end

y = [y0;y;yN];

ya = @(x) exp(sin(x));