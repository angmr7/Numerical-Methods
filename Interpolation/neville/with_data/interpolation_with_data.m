clearvars;
filename = 'absortion_of_pure_water_300_to_800_nm_s.txt';
A = readmatrix(filename);
lambda = A(4:end,1);
k = A(4:end,2);

figure(1);
xlabel('\lambda (nm)');
ylabel('\k (1/cm)');
plot(lambda,k, 'ob');

filename2 = 'absortion_of_pure_water_667_to_2500_nm_s.txt';
B = readmatrix(filename2);
lambda2 = B(4:end,1);
k2 = B(4:end,2);

figure(2);
xlabel('\lambda (nm)');
ylabel('\k (1/cm)');
plot(lambda2,k2);

lambdat = (300:4:800)';
kk = zeros(size(lambdat));
epsilon = 1e-5;

for i=1:size(lambdat,1)
    kk(i) = neuville_interpolation(lambda, k, lambdat(i), epsilon);
end

figure(3);
xlabel('\lambda (nm)');
ylabel('\k (1/cm)');
plot(lambda,k, 'ob');
hold on;
plot(lambdat, kk, '.r');
hold off;