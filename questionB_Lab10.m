
% 190255	Debanjan Manna	debmanna		2	8	0.3	3	0.8	1	0.9	4

%% Importing the Dataset
% Column1 Weight and Column2 Voltage

% N1 loading
N1_dataset = [
0 -0.000167;
0.9972 0.071126;
1.9945 0.142133;
2.9918 0.213486;
3.9892 0.284649;
4.9866 0.356253;
];

% S1 loading
S1_dataset = [
   0 0.000021;
0.2494 0.055423;
0.4987 0.110942;
0.7448 0.166075;
0.9942 0.221599;
];

%RM loading
RM_dataset = [
0 -0.000025;
0.2492 -0.027407;
0.4982 -0.054461;
0.7476 -0.081971;
0.9966 -0.109403;
];

%AX loading
AX_dataset = [
0 0.000033;
0.2492 0.037166;
0.4982 0.07442;
0.748 0.111681;
0.9974 0.148855;
];

%% plot of Voltage vs Weight for N1 loading

plot(N1_dataset(:,2),N1_dataset(:,1),"*k");
xlabel("N1(in Voltage)");
ylabel("Weight(in Kg");
title("Voltage (in V) vs Weight (in kg) for N1 loading");

%% plot of Weight vs Voltage for S1 loading

plot(S1_dataset(:,2),S1_dataset(:,1),"*k");
xlabel("S1(in Voltage)");
ylabel("Weight(in Kg");
title("Voltage (in V) vs Weight (in kg) for S1 loading");
%% plot of Weight vs Voltage for RM loading

plot(RM_dataset(:,2),RM_dataset(:,1),"*k");
xlabel("RM(in Voltage)");
ylabel("Weight(in Kg");
title("Voltage (in V) vs Weight (in kg) for RM loading");

%% plot of Weight vs Voltage for AX loading

plot(AX_dataset(:,2),AX_dataset(:,1),"*k");
xlabel("AX(in Voltage)");
ylabel("Weight(in Kg");
title("Voltage (in V) vs Weight (in kg) for AX loading");