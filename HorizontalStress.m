function [sigma_H, sigma_h] = HorizontalStress(DP, Poisson_s, G_0, VCL, P_p)
A = Poisson_s./(1-Poisson_s);
omega_1 = 0.540186;
omega_2 = 0.13384778;
m = length(DP);
alpha = zeros(m, 1);
for i =1:m
    if VCL(i)<0.3
        alpha(i) = 0.8;
    elseif VCL(i)>0.3 & VCL(i)<0.5
        alpha(i) = 0.65;
    else
        alpha(i) = 0.5;
    end
end
sigma_H = (A+omega_1).*(G_0-alpha.*P_p)+alpha.*P_p;
sigma_h = (A+omega_2).*(G_0-alpha.*P_p)+alpha.*P_p;
plot(sigma_H, DP);
hold on
plot(sigma_h, DP);
set(gca, 'YDir', 'reverse');
xlabel('水平应力', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
legend('最大水平应力', '最小水平应力');
end
