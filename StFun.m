function S_t = StFun(E_d, VCL, K_tc)
S_t1 = 0.000642*E_d.*(1-VCL)+0.001118*VCL.*E_d;
S_t = 1/K_tc*S_t1;
end
