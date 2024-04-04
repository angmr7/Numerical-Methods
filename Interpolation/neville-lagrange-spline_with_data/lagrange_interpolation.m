function yt = lagrange_interpolation(x,y,xt)
%El Metodo de Interpolacion con Polinomios de Lagrange, 
%genera una interpolacion con un polinomio del grado maximo n-1, 
%donde n es el numero de los datos base.
%Los parametros de entrada son:
%[x],[y]: los datos necesarios para realizar la interpolacion en dos
%         vectores columna.
%xt : un punto de la abscisa a interpolar.
%yt : la ordenada producto de proceso de interpolacion de xt.
%*********************************************************************
Lk = zeros(size(x));
L = 1;
for k=1:size(x,1)
    for i=1:size(x,1)
        if x(i)~=x(k)
            Lt = (xt - x(i))/(x(k)-x(i));
            L = L*Lt;
        end
    end
    Lk(k) = L;
    L = 1;
end

yt = 0;
for i=1:size(y,1)
    yt = y(i)*Lk(i) + yt;
end

end