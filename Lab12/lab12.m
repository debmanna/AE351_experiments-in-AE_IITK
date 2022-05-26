%% Dataset

Angles = (0:12:348)'; % in degrees

cylinder_dia = 0.100 ; % in m
cylinder_span = 0.305 ; % in m

Viscosity = 1.81*10^-5 ; % viscosity of air in Pa.S at 25deg C
rho = 1.184 ; % density of air in kg/m^3

Pressure = [	
    87.10191	72.91167	37.9926	-13.44178	-65.35959	-106.54676	-110.49359	-95.3258	-94.61049	-97.19377	-96.34289	-97.51694	-98.93449	-100.56821	-101.19451	-103.24507	-103.1136	-102.58394	-98.80074	-96.45013	-94.0555	-93.39553	-90.76656	-91.02906	-105.74578	-102.82098	-62.73351	-11.11725	41.19468	75.15166;
	216.89573	185.97714	105.62432	-9.51218	-120.63177	-189.02377	-155.29684	-149.64784	-153.37488	-155.95703	-159.83605	-167.94584	-170.48817	-164.20531	-153.41828	-149.46237	-153.92578	-168.32525	-172.08825	-169.66468	-162.41159	-158.98018	-155.25659	-151.47165	-157.22779	-191.08762	-122.97787	-11.27479	106.79157	187.78013;
	364.16561	312.09513	176.36751	-17.24517	-206.54388	-327.56184	-276.20896	-266.62869	-271.71264	-269.87238	-273.83688	-280.9481	-282.35472	-273.78473	-261.11609	-256.0278	-261.49598	-271.36434	-279.96623	-275.6527	-265.70488	-260.38383	-262.47796	-256.28995	-263.21801	-316.22997	-199.61434	-12.83034	183.12669	316.97779;
];

freeStream_DynamicPressure= [85.40511; 211.99871; 356.17322] ;

% Calculation of Atmospheric P_infinity
% Pressure (:,1) contains the Stagnation pressure
P_infinity = Pressure(:,1) - freeStream_DynamicPressure;

%% calculation of Re

Re = (cylinder_dia / Viscosity) * (sqrt(2*rho*freeStream_DynamicPressure)); 

%% calculation of Cp

% Cp theoretical

Cp_theoretical = 1-4*(sind(Angles)).^2;

% Cp from Experimental data

Cp = Pressure ./freeStream_DynamicPressure;

Cp = [ Cp [1;1;1]];

for i =1:3
    figure(i);
    plot([Angles;360],[Cp_theoretical;1],"-*b");
    hold on;
    plot([Angles;360],Cp(i,:),"-o");
    legend("Cp,theoretical",['Cp,Re=',num2str(Re(i,1),'%.2E')]);
    xlabel("Angle in degree ");
    ylabel("C_p -->");
end

figure(4)
plot([Angles;360],[Cp_theoretical;1],"-*b");
hold on;
plot([Angles;360],Cp,"-o");
xlabel("Angle in degree ");
ylabel("C_p -->");

