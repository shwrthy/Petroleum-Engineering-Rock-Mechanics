function phi_all = PhiFun(C, a, b, a_1, b_1)
M = a_1 - b_1*C;
MM = M + (M.^2+1).^2;
phi_all = a*log10(MM) + b;
end