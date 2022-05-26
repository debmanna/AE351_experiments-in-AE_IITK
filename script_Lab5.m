%% calibration of the pressure sensor

Pressure_InchOfH2O = [0;0.5;1;1.6;2.1;2.5;3.2;3.6;4;3.7;3.3;2.7;2.2;1.8;1.4;0.9;0.3];
Voltage_mV = [0;5.1;10.3;16.1;21.1;24.9;32.1;36;39.6;36.8;33.1;26.9;21.8;18.6;14.4;10.4;3.1];

plot(Pressure_InchOfH2O,Voltage_mV,'*k');
xlabel("Pressure (in an inch of H2O)");
ylabel("Volatage reading from multimeter (in mV)");
title("Sensor Calibration");



%% Flow Meter Reading (Differential Pressure)
% orifice Nozzle Venturi
% Valve opening 5 6 7 8 9 10
% Mdot_Theoretical contains the Mdot Theoretical value

Differential_Pressure_cmofHg = [1.5,1.2,1.8;
    2.3,1.4,2.3;
    2.8,1.6,2.6;
    3.1,1.8,2.8;
    3.2,1.8,2.9;
    3.2,1.8,2.9 ];

Differential_Pressure_Pascal = (Differential_Pressure_cmofHg.*1333.29); % pressure in Pa

Area1 = 53.599 * 10^-4;
Area2 = [19.63, 18.10, 14.79].* 10^-4;

Mdot_Theoretical = zeros(6,3);

for j = 1:1:3
    Mdot_Theoretical(:,j) = (Differential_Pressure_Pascal(:,j) * (2*1.225/(1/Area2(1,j)^2 - 1/Area1^2))).^0.5;
end


%% calculation of MDot actual and the Discharge Coeff.

% differential Pressure Reading for Pitot tube

% it is in mV
Diff_Pressure_mv = [5.4,7.2,8.2,8.8,8.8,8.8;
    6.6,8.7,10.2,10.9,10.7,10.4;
    7.5,10.2,11.9,12.1,13,12.4;
    8.9,11.9,13.4,13.9,14,13.8;
    9.8,13.1,15.6,15.5,15.6,15.6;
    11.2,14.4,16.4,16.9,17,17.2;
    12,15.6,17.6,18.4,18.7,18.4;
    12.3,16.3,18.4,19,19.2,19.2;
    12.4,16.3,18.7,19.6,19.6,19.6;
    12.3,15.9,18.4,18.9,19.1,19.2;
    11.4,15.2,17.4,18.2,18.2,18.4;
    10.5,14.4,16.4,16.6,16.9,17.2;
    9.4,12.8,14.8,15.3,15.6,15.5;
    8.4,11.4,13.1,13.9,13.4,13.4;
    7.1,9.9,11.4,11.7,11.7,11.5;
    6.2,8.7,9.8,10.2,10.3,10.2;
    4.2,6,7.8,7.4,7.3,7.1;
    ];

Diff_Pressure_Pascal = (Diff_Pressure_mv-0.436).*(248.84/9.853); % Pressure in Pascal

% velocity in m/s
velocity = (Diff_Pressure_Pascal.*(2/1.225)).^0.5;

test=(4:-0.5:-4);
%% Velocity plot
plot(velocity(:,1),test,'-*');
hold on;
plot(velocity(:,2),test,'-*');
hold on;
plot(velocity(:,3),test,'-*');
hold on;
plot(velocity(:,4),test,'-*');
hold on;
plot(velocity(:,5),test,'-*');
hold on;
plot(velocity(:,6),test,'-*');
hold on;
xlabel("velocity (in m/s)");
ylabel("location of pitot tube (in cm)");
title("Flow velocity distribution");

%% Average Velocity calculation
Velocity_avg=zeros(1,6);

for j =1:1:6
    Velocity_avg(1,j) = trapz(velocity(:,j))/17;
end
%% Actual Mass Flow Rate
mdot_Actual=Velocity_avg.*1.225*Area1;

%% Cd calculation
Cd_Orifice = mdot_Actual./transpose(Mdot_Theoretical(:,1));
Cd_Nozzle  = mdot_Actual./transpose(Mdot_Theoretical(:,2));
Cd_Venturi = mdot_Actual./transpose(Mdot_Theoretical(:,3));

%% Mdot_Actual vs Cd plot 
plot(mdot_Actual,[Cd_Orifice;Cd_Nozzle;Cd_Venturi]);
title("Cd Vs Mdot Actual ");
xlabel("Mdot Actual (in Kg/m^3)");
ylabel("Discaharge Coefficient, Cd");

%% Differential Pressure Vs Cd plot
plot(Differential_Pressure_Pascal(:,1),Cd_Orifice);
hold on;
plot(Differential_Pressure_Pascal(:,2),Cd_Nozzle);
hold on;
plot(Differential_Pressure_Pascal(:,3),Cd_Venturi);
hold on;
title("Cd Vs Differential Pressure");
xlabel("Differential Presssure (in Pascal)");
ylabel("Discharge Coefficient, Cd");
