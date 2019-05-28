function [a, b] = DynamicsEv(x, y)
% ==================== input elta_tp, rho_rock =================
V_p = 304.8./x*1000;
V_s = (sqrt(0.01144*V_p + 18.03) - 5.686)*10^3;
alpha = (V_p./V_s).^2;
b = 0.5*(alpha-2)./(alpha-1);
a = y.*V_s.^2.*(3*alpha-4)./(alpha-1)*10^-3;
% ==================== output E_d, Poisson_d ===================
end