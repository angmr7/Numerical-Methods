clearvars;
filename = 'absortion_of_pure_water_300_to_800_nm_s.txt';
A = readmatrix(filename);

lambda = A(3:end,1);
k = A(3:end,2);

lambdat = (lambda(1):1:lambda(end))';
kt = zeros(size(lambdat));

%*******************************************************
%Interpolacion por polinomios de Lagrange.
%*******************************************************
for i=1:size(lambdat,1)
    kt(i) = lagrange_interpolation(lambda,k,lambdat(i));
end

figure(1);
plot(lambda,k,'ob');
hold on;
plot(lambdat,kt,'.r');
hold off;
xlabel('\lambda(nm)');
ylabel('k(1/cm)');
ylim([0,0.03]);

%******************************************************
%Interpolacion por el metodo de Nevilles.
%******************************************************
epsilon = 1e-5;
n = zeros(size(lambda));

for i=1:size(lambdat,1)
    [kt(i),n(i)] = nevilles_interpolation(lambda,k,lambdat(i),epsilon);
end

figure(2);
plot(lambda,k,'ob');
hold on;
plot(lambdat,kt,'.r');
hold off;
xlabel('\lambda(nm)');
ylabel('k(1/cm)');
ylim([0,0.03]);

figure(3);
semilogy(lambdat,n,'-g');
xlabel('\lambda(nm)');
ylabel('n');

%******************************************************
%Interpolacion por el metodo de Spline.
%******************************************************

for i=1:size(lambdat,1)
    kt(i) = spline_interpolation(lambda,k,lambdat(i));
end

figure(4);
plot(lambda,k,'ob');
hold on;
plot(lambdat,kt,'.r');
hold off;
ylabel('k(1/cm)');
xlabel('\lambda(nm)')