function [P_p, Pp] = PorePressure(G_0, P_0, DP, rho_Sdf, delta_tp)
DTN = 10.^(-0.000095*DP+2.21);
n = 0.2;
P_p = G_0 - (G_0-rho_Sdf).*(DTN./delta_tp).^n;
Pp = P_0 - (P_0 - rho_Sdf).*(DTN./delta_tp).^n;
plot(P_p, DP);
set(gca, 'YDir', 'reverse');
xlabel('地层孔隙压力当量密度', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
legend('地层孔隙压力当量密度');
end
