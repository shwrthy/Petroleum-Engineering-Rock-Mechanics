function DrawSDT(delta_tp, DP)
c = 0.2;
DTN = 10.^(-0.000095*DP+2.21);
plot(delta_tp, DP, 'b');
hold on
plot(DTN, DP, 'r', 'LineWidth',4);
set(gca, 'YDir', 'reverse');
xlabel('时间', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
hold off
pause;
DTN1 = log(DTN);
delta_tp1 = log(delta_tp);
plot(delta_tp1, DP, 'b');
hold on
plot(DTN1, DP, 'r', 'LineWidth',4);
set(gca, 'YDir', 'reverse');
xlabel('时间对数', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
hold off
legend('测井声波时差', '正常声波时差');
end
