function figure1(x, y)
%figure1此处显示有关此函数的摘要
plot(x, y, 'r');
set(gca, 'YDir', 'reverse');
xlabel('泥质的体积含量', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
end
