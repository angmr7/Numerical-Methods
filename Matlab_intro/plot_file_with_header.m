filename = 'electric_potential.txt';
A = importdata(filename,' ',9); % ' ' es el delimitador del archivo
x = A.data(:,1)
y = A.data(:,2)
z = A.data(:,3)

clear A;
[x,y] = meshgrid(x,y);
Z = griddata(x,y,z,X,Y);

figure(1);
h = surf(X,Y,Z, 'FaceAlpha', 0.5)
