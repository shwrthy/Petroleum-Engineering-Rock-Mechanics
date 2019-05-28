function [P_b, P_f] = SafetyFun(sigma_H, sigma_h, phi_all, C, P_p, DP, S_t, Boit)
eta = 0.9;
phi = 45 - phi_all/2;
A = cot(phi*pi/180);
P_f = ((3*sigma_h - sigma_H - Boit.*P_p) + S_t./DP);
P_b = (eta*(3*sigma_H - sigma_h) - 2*C.*A./DP + Boit.*P_p.*(A.^2-1))./(A.^2 + eta);
plot(P_p, DP);
hold on
plot(P_f, DP);
hold on
plot(P_b, DP);
set(gca, 'YDir', 'reverse');
xlabel('Ñ¹Á¦µ±Á¿×ê¾®ÒºÃÜ¶È', 'fontsize', 18);
ylabel('¾®Éî', 'fontsize', 18);
legend('¿×Ï¶Ñ¹Á¦','ÆÆÁÑÑ¹Á¦','Ì®ËúÑ¹Á¦');
end
