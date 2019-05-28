function [P_0, P_n] = Overburden(DP, G_0)
syms xx
yy = 2.155 + 0.00000408*xx - 0.1189*exp(-0.7577*xx);
fyy = int(yy,0,1600)/100;
mm = length(DP);
P_0 = zeros(mm,1);
for i=1:mm
    if i ==1
        P_0(i) = (fyy + G_0(i));%…œ∏≤—“≤„—π¡¶
    else
        P_0(i) = (0.01*G_0(i) + P_0(i-1));%…œ∏≤—“≤„—π¡¶
    end
end
P_n = 0.00981*1.03*DP;%æ≤“∫÷˘—π¡¶

end
