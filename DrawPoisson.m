function DrawPoisson(x, y, z)
plot(x,z);
hold on
plot(y,z);
hold on;
grid on
set(gca, 'YDir', 'reverse');
xlabel('≤¥À…±»', 'fontsize', 18);
ylabel('æÆ…Ó', 'fontsize', 18);
legend('∂ØÃ¨≤¥À…±»', 'æ≤Ã¨≤¥À…±»');
end