function DrawYoung(x, y, z)
plot(x,z);
hold on
plot(y,z);
hold on;
grid on
set(gca, 'YDir', 'reverse');
xlabel('弹性模量', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
legend('动态弹性模量', '静态弹性模量');
end