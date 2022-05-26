%% Importing the Dataset 
% Scanner 9749 --> Channel_20
% Scanner 0818 --> Channel_18
% Scanner 0916 --> Channel_24

% Column1 Scanner Pressure
% Column2 Scanner Voltage

% Scanner 9749 --> Channel_20
channel_20 = [
    -1	0.000212;
    -303	-0.102226;
    -604	-0.204231;
    -901	-0.304763;
    -1179	-0.399051;
    -1491	-0.504427;
    -1794	-0.607035;
    -2092	-0.707918;
    -2301	-0.778766
];

% Scanner 0818 --> Channel_18
channel_18 = [
    -1	0.014538;
-303	-0.087709;
-604	-0.204234;
-901	-0.289509;
-1179	-0.383353;
-1491	-0.488122;
-1794	-0.590048;
-2092	-0.690164;
-2301	-0.760414;
];

% Scanner 0916 --> Channel_24
channel_24 = [
    -1	0.008361;
-303	-0.096297;
-604	-0.200301;
-901	-0.302775;
-1179	-0.398819;
-1491	-0.505928;
-1794	-0.61021;
-2092	-0.712554;
-2301	-0.784385;
    ];


% Scanner 9749 --> Channel_20 Scanner Presssure Vs Voltage Curve
plot(channel_20(:,1),channel_20(:,2),"*k");
xlabel("Scanner Pressure (in Pascal) -->");
ylabel("Scanner Voltage (in Volts) -->");
title("[Scanner 9749 Channel 20] Scanner Pressure vs Scanner Voltage Curve");

% Scanner 0818 --> Channel 18 Scanner Presssure Vs Voltage Curve
plot(channel_18(:,1),channel_18(:,2),"*k");
xlabel("Scanner Pressure (in Pascal) -->");
ylabel("Scanner Voltage (in Volts) -->");
title("[Scanner 0818 Channel 18] Scanner Pressure vs Scanner Voltage Curve ");

% Scanner 0916 --> Channel 24 Scanner Presssure Vs Voltage Curve
plot(channel_24(:,1),channel_24(:,2),"*k");
xlabel("Scanner Pressure (in Pascal) -->");
ylabel("Scanner Voltage (in Volts) -->");
title("[Scanner 0916 Channel 24] Scanner Pressure vs Scanner Voltage Curve");


