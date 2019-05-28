function [P_fmax, P_fmin] = IniPressure(DP, rho_rock, sigma_H, sigma_h, Boit, P_p, S_t)
P_fmax = (3*sigma_h - rho_rock - Boit.*P_p).*DP + S_t;
P_fmin = (3*rho_rock - sigma_H - Boit.*P_p).*DP + S_t;
plot(P_fmax, DP);
hold on
plot(P_fmin, DP);
set(gca, 'YDir', 'reverse');
xlabel('起裂压力', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
legend('最小起裂压力','最大起裂压力');
end
