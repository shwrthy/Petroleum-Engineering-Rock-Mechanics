function C = Cohesion(Poisson_d, rho_rock, delta_tp, VCL)
V_p = 304.8./delta_tp*1000;
A = 3.4967e-15;
B = (1+Poisson_d)./(1-Poisson_d);
C = A*(1-2*Poisson_d).*(B.^2).*(rho_rock.^2).*(V_p).^4.*(1+0.78*VCL);

end