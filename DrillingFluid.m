function rho_Sdf = DrillingFluid(rho_df, Depth, DP)
%z = [zeros(length(dp),1];
m =length(DP);
theta = polyfit(Depth,rho_df,2);
DP = [DP.^2 DP ones(m,1)];
rho_Sdf = DP*theta';
end

