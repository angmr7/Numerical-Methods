function [yt,n] = nevilles_interpolation(x,y,xt,epsilon)
%El Metodo de Interpolacion de Nevilles necesita de 
%los siguientes parametros:
% [x],[y]: los datos necesarios para realizar la interpolacion en dos
%         vectores columna.
% xt : un punto de la abscisa a interpolar.
% epsilon : la precision requerida de interpolacion de xt.
%Salidas de la funcion:
% yt : la ordenada producto de proceso de interpolacion de xt.
% n : grado del polinomio para la interpolacion de xt.
%*********************************************************************
Q = zeros(size(x,1),size(x,1));
Q(:,1) =y(:);

for i=2:size(x,1)
    for j=2:i
        Q(i,j) = ((xt-x(i-j+1))*Q(i,j-1)-(xt-x(i))*Q(i-1,j-1))/(x(i)-x(i-j+1));
    end
    if abs(Q(i,i)-Q(i-1,j-1))<epsilon
        break;
    end
end

yt = Q(i,i);
n = j-1;

end