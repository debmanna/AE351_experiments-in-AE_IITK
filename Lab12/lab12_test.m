%% Dataset

Angles = (0:12:348)'; % in degrees

cylinder_dia = 0.100 ; % in m
cylinder_span = 0.305 ; % in m

Viscosity = 1.81*10^-5 ; % viscosity of air in Pa.S at 25deg C
rho = 1.2 ; % density of air in kg/m^3

% Pressures are in Pa
Pressure_import = importdata("DATA for Students.xlsx");

All_Pressure = Pressure_import.data.PressureData (:,3:end);

freeStream_DynamicPressure = Pressure_import.data.PressureData(:,2);

% Calculation of Atmospheric P_infinity
% Pressure (:,1) contains the Stagnation pressure

P_infinity = All_Pressure(:,1) - freeStream_DynamicPressure;

%% calculation of Cp

% Cp from Experimental data

Cp = (All_Pressure - P_infinity)./freeStream_DynamicPressure;


%% calculation of Re

Re = (cylinder_dia / Viscosity) * (sqrt(2*rho*freeStream_DynamicPressure)); 

%% calculation of Cd

% Cd theoretical

Cd_theoretical = 0;

% Cd from Experimental data
Y = Cp .* (cosd(Angles))';

Cd = zeros(151,1);

for i=1:151
    for j=1:30
        Cd(i,1) = Cd(i,1)+Y(i,j);
    end
end

Cd = Cd/2;

plot(Re,Cd,"-*r");



