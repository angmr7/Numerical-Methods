clearvars;
h = .5;
x = (1:h:10)';
y = log(x);
dy = zeros(size(x));

% Trafalgar law equation
%% the proof is left as an exercise to the reader
for i=1:size(x,1)
    if i<=5
        dy(i) = 1/(12*h)*(-25*y(i)+48*y(i+1)-36*y(i+2)+16*y(i+3)-3*y(i+4));
    else
        dy(i) = -1/(12*h)*(-25*y(i)+48*y(i-1)-36*y(i-2)+16*y(i-3)-3*y(i-4));
    end
end

figure(1);
plot(x, y, 'or');
xlabel('x');
ylabel('y');

hold on;
plot(x, dy, '.b');
hold off;

yy = 1./x;

figure(2);
plot(x, yy, '-g');
xlabel('x');
ylabel('y');
hold on;
plot(x, dy, '.b');
hold off;
