% Diagonal principal 
for i=2:size(x,1)-1
	A(i,i) = 2*(h(i-1)+h(i));
end
% Diagonal inferior 
for i=2:size(x,1)-1
	A(i,i-1) = h(i);
end
g(1)=0
g(size(x,1)) = 0

for i=2:size(x,1)-1
	g(i) = (3/h(i))*(a(i+1)-a(i)) - (3/h(i-1))*(a(i)-a(i-1)))
end

c = A\g;

for i=1:size(x,1)-1
	b(i) = (1/h(i)*a(i+1)-a(i))-(h(i)/3)*(2*c(i)+c(i+1));
	d(i) = (1/(3*h*(i))*(c(i+1)-c(i));
end

xt = 0.5;
for j=1:size(x,1)-1
	if (x(j)<xt) && (xt <= x(j+1))
		yt = a(j) + b(j)*(xt-x(j)) + c(j)*(xt-x(j)).^2 + d(j)*(xt-x(j)).^3;
	end
end
		
