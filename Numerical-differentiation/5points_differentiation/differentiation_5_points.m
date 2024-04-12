clearvars;
h = .5;
x = (1:h:10)';
y = log(x);
dy = zeros(size(x));


for i=3:size(x,1)-2
    dy(i) = (1/(12*h)) * (-y(i-2) + 8*y(i-1) - 8*y(i+1) + y(i+2));
end

dy(1)= 1/(12*h)*(-25*y(1)+48*y(2)-36*y(3)+16*y(4)-3*y(5));
dy(2)= 1/(12*h)*(-25*y(1)+48*y(2)-36*y(3)+16*y(4)-3*y(5));
dy(end-1) = 1/(12*h)*(-25*y(end-5)+48*y(end-4)-36*y(end-3)+16*y(end-3)-3*y(end-1));
dy(end) = 1/(12*h)*(-25*y(end-5)+48*y(end-4)-36*y(end-3)+16*y(end-3)-3*y(end-1));

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
plot(x, yy, '.b');
hold off;
