clear all;
clc;
%% ==================== 参数读取 =================================
DP = xlsread('A井测井数据与钻井液密度','测井数据', 'B1:B2502');%深度
GR = xlsread('A井测井数据与钻井液密度','测井数据', 'E1:E2502');%目的层自然伽马值
delta_tp = xlsread('A井测井数据与钻井液密度','测井数据', 'F1:F2502');%声波
rho_rock = xlsread('A井测井数据与钻井液密度','测井数据', 'G1:G2502');%岩石密度
G_0 = xlsread('A井测井数据与钻井液密度','测井数据', 'M1:M2502');%上覆岩层压力梯度
%% ==================== 评估地层地层泥质含量 =======================
GRmax = 120;
GRmin = 60;
I_GR = (GR-GRmin)/(GRmax-GRmin);
GCUR = 3.7;
VCL = (power(2,(GCUR*I_GR)-1))./(power(2,(GCUR)-1));
figure1(VCL, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 动态/静态弹性模量和泊松比 ==================
[E_d, Poisson_d] = DynamicsEv(delta_tp, rho_rock); 
[E_s, Poisson_s] = StaticsEv(G_0, DP, E_d, Poisson_d);
hold off
DrawYoung(E_d, E_s, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
hold off
DrawPoisson(Poisson_d, Poisson_s, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 评估Biot系数与井深的关系 ===================
hold off
Boit = figure2(VCL, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 上覆岩层压力四参数拟合 =====================
%使用cftool工具箱拟合.拟合函数：y = a + b*x - c*exp(-d*x)。其中:x=DP、y=G_0
%% ==================== 上覆岩层压力 ==============================
% 拟合公式 G_0(x) = 2.155 + 0.00000408*x - 0.1189*exp(-0.7577*x)
[P_0, P_n] = Overburden(DP, G_0);
rho_Sdf = DrillingFluid(rho_df, Depth, DP);
[P_p, Pp] = PorePressure(G_0, P_0, DP,rho_Sdf, delta_tp);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 声波时差 =================================
DrawSDT(delta_tp, DP);
%% ==================== 粘聚力与内摩擦角 ==========================
sigma_1 = [39.5 146.4 215.4;50.6 155.2 201.4;52.5 148.2 187.7;18.4 97.5 128.5];
sigma_3 = [0 20 40;0 20 40;0 20 40;0 20 40;];
%线性拟合：sigma_1 = (tan(beta))^2*sigma_3 + 2*C*tan(beta)
for i=1:size(sigma_1,1)
    x = sigma_3(i,:);
    y = sigma_1(i,:);
    p = polyfit(x, y, 1);
    P(i,:) =p;
end
for i=1:size(P,1)
    tan_beta(i) = sqrt(P(i,1));
    phi(i) = (atan(tan_beta(i))-pi/4)*360/pi;
    C(i) = P(i,2)/2/tan_beta(i);
end
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 粘聚力、内摩擦角与地层抗拉强度的连续剖面 =====
C = Cohesion(Poisson_d, rho_rock, delta_tp, VCL);%a, b, a_1, b_1均为岩石有关常数。
a = 2.654;   b = 20;   a_1 = 58.93;   b_1 = 1.785;
phi_all = PhiFun(C, a, b, a_1, b_1);
K_tc = 15;
S_t = StFun(E_d, VCL, K_tc);
DrawCPhiSt(C, phi_all, S_t, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 水平最大、最小主应力 =======================
[sigma_H, sigma_h] = HorizontalStress(DP, Poisson_s, G_0, VCL, P_p);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 安全泥浆密度窗口 ==========================
[P_b, P_f] = SafetyFun(sigma_H, sigma_h, phi_all, C, P_p, DP, S_t, Boit);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 出砂可能性分析 ============================
B = SandFun(E_d, Poisson_d, DP);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% ==================== 起裂压力 =================================
[P_fmax, P_fmin] = IniPressure(DP, rho_rock, sigma_H, sigma_h, Boit, P_p, S_t);
fprintf('Program paused. Press enter to continue.\n');
pause;