%clearvars;
%x = (0:0.1:1)';
%y = exp(x);

%{
figure(1);
plot(x,y, 'ob');
xlabel('x');
ylabel('y');
%}
%xt = 0.05;
%epsilon = 1e-3;

function yt = neuville_interpolation(x,y,xt,epsilon)
    %{
    xt: value to interpolate
    epsilon: minimum error to stop the loop
    %}
    Q = zeros(size(x,1), size(x,1));
    Q(:,1)=y(:);
    
    for i=2:size(x,1) 
        for j=2:i
            Q(i,j) = ((xt-x(i-j+1))*Q(i,j-1)-(xt-x(i))*Q(i-1,j-1))/(x(i)-x(i-j+1))
        end
        error = abs(Q(i,j)-Q(i-1,j-1)) 
        if error < epsilon % stop the loop when the error is low enough
            %print(error)
            break;
        end
    end
    yt = Q(i,i);
end
%yt = exp(xt);

 

%{
figure(2);
plot(x,Q(:,1), 'ob');
xlabel('x');
ylabel('y');
%}