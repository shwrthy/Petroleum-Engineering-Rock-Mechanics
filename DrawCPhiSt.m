function DrawCPhiSt(C, phi_all, S_t, DP)
plot(C, DP)
hold on
plot(phi_all, DP);
hold on 
plot(S_t, DP,'r');
set(gca, 'YDir', 'reverse');
grid on
xlabel('粘聚力、内摩擦角与地层抗拉强度', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
legend('粘聚力','内摩擦角','地层抗拉强度');
end