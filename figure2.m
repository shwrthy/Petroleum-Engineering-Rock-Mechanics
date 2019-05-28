function Boit = figure2(x, y)
%figure2此处显示有关此函数的摘要
figure;
Boit = zeros(length(x), 1);
for i =1:length(x)
    if x(i)<0.3
        Boit(i) = 0.8;
    elseif x(i)>0.3 & x(i)<0.5
        Boit(i) = 0.65;
    else
        Boit(i) = 0.5;
    end
end
plot(Boit, y, 'r');
set(gca, 'YDir', 'reverse');
xlabel('Biot系数', 'fontsize', 18);
ylabel('井深', 'fontsize', 18);
end
