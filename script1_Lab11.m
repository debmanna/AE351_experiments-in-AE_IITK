%% uploading the dataset
A = importdata("U12mps.xlsx");

%% Creating a suitable Datastructure
mat = zeros(3,32,10);

% All the AoAs
AoA = [-5,(7:1:15)]';

% the 1st 2D array will contain the data for AoA = -5 deg
mat (:,:,1) = A.data(3:5,:);

% the 2nd 2D array will contain the data for AoA = 7 deg and so on ..
for i=2:10
    mat(:,:,i) = A.data(63+5*(i-2):65+5*(i-2),:);
end

%
x_by_c_upper = [0.000;0.030;0.055;0.080;0.104;0.146;0.187;0.228;0.286;0.351;0.425;0.507;0.598;0.679;0.754;0.819;0.876;0.943;1];
y_by_c_upper = [0.000;0.028;0.037;0.043;0.047;0.053;0.056;0.059;0.060;0.060;0.057;0.053;0.047;0.040;0.033;0.026;0.020;0.011;0.000];

x_by_c_lower = [0.000;0.029;0.055;0.097;0.145;0.211;0.287;0.369;0.427;0.492;0.567;0.650;0.748;1.000];
y_by_c_lower = [0.000;-0.028;-0.037;-0.046;-0.053;-0.058;-0.060;-0.059;-0.057;-0.054;-0.049;-0.043;-0.033;0.000];

slope_lower = diff(y_by_c_lower)./diff(x_by_c_lower);
temp = slope_lower(end,1);
slope_lower = [slope_lower;temp];

slope_upper = diff(y_by_c_upper)./diff(x_by_c_upper);
temp = slope_upper(end,1);
slope_upper = [slope_upper;temp];

%% C_p Calculation

C_n = zeros(10,1);
C_a = zeros(10,1);
C_l = zeros(10,1);
C_d = zeros(10,1);
Cd_wake = zeros(10,1);
L_ref = 610;
u = zeros(10,61);

y = [0; 20 ;40; 60; 80; 100; 120; 140; 150; 160; 170; 180; 190; 200; 210; 220; 230; 240; 245; 250; 255; 260; 265; 270; 275; 280; 285; 290; 295; 300; 305; 310; 315; 320; 325; 330; 335; 340; 345; 350; 355; 360; 365; 370; 380; 390; 400; 410; 420; 430; 440; 450; 460; 470; 490; 510; 530; 550; 570; 590; 610];

% density of the Liquid
rho = 1.225;

for i = 1:10

    % dynamic Pressure -- Port31
    q_infinity = mat(1,32,i);
    u_infinity = sqrt(2*q_infinity/rho);
    P_static = (mat(3,31,i)+mat(3,32,i))/2;

    P  = [mat(2,1:14,i),mat(2,16:end,i),mat(3,1:30,i)];
    u(i,:) = sqrt(2*(P - P_static)/rho);

    Cd_wake(i,1) = trapz(y,u(i,:).*(u(i,:)-u_infinity)) /(0.5*u_infinity^2*L_ref);

    % I have considered that each pressure gauge measures the Gauge pressure
    Cp = mat(1,:,i)./q_infinity; 
    Cp_upper = (Cp(1:1:19))';
    Cp_lower = ([Cp(1),Cp(31:-1:19)])';


    C_n(i,1) = - trapz(x_by_c_lower,Cp_lower) - trapz(x_by_c_upper,Cp_upper);

    C_a(i,1) = trapz(x_by_c_lower,Cp_lower.*slope_lower) + trapz(x_by_c_upper,Cp_upper.*slope_upper);

    C_l(i,1) = C_n(i,1) * cosd(AoA(i,1)) - C_a(i,1) * sind(AoA(i,1));
    
    C_d(i,1) = C_n(i,1) * sind(AoA(i,1)) + C_a(i,1) * cosd(AoA(i,1));

end

%% C_n Caluclation using the C_p data

figure(11)
plot(AoA(1:end),C_l(1:end),"-xb");
hold on;
plot(AoA(1:end),C_d(1:end),"-xr");
xlabel("Angle of Attack in degrees");
legend("C_l", "C_d");

%% Calculation of C_d from Wake
% have imported y values from the dataset

