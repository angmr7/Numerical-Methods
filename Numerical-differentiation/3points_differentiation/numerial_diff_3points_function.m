%3 points derivation
function dy=numerical_diff_3point(x,y,h)
    dy = zeros(size(x));
    dy(1)= 1/(2*h)*(-3*y(1)+4*y(2)-y(3));
    
    figure(1);
    plot(x,y, ' or ');
    xlabel('x');
    ylabel('y');
    
    hold on;
    %plot(x,1/x,'ob')
    plot(x,dy,'.b');
    hold off;
    
    for i=2:size(x,1)-1
        dy(i)= 1/(2*h)*(-y(i-1)+y(i+1));
    end
    
    dy(end) = 1/(2*h)*(y(end-2)-4*y(end-1)+3*y(end));
    
    yy = 1./x;
    
    figure(2);
    plot(x,yy, ' -g ');
    xlabel('x');
    ylabel('y');
    hold on;
    plot(x,dy,'.b');
    hold off;
end