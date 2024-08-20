clearvars;
R = 0.010; % metros
d = 0.005; %diametro
mu_0 =  4*pi()*10^-7; %C² / (N·m²)
k = [0,0,1];
er = @(t) [cos(t), sin(t), 0];
erp = @(tp) [cos(tp), sin(tp), 0];
etp = @(tp) [-sin(tp), cos(tp), 0];
f = @(r,t,tp) (r*(r*dot(cross(etp(tp),er(t),k)+R)))/(r^2+R^2-2*R*dot(er(t),er(t)))^3/2