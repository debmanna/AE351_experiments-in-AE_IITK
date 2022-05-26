% data recorded by five Dial Gauges

DG = [
      -0.08,-0.13,-0.03;
      -0.38,-0.79,-0.35;
      -0.44,-0.96,-0.56;
      -0.33,-0.78,-0.50;
      -0.09,-0.20,-0.19;
      ];
DG_position = [35;225;415;605;795];

% data recorded by fifteen strain gauges
SG = [
    -6.2404842,-8.134273,-5.2581246;
    -17.132253,-24.3465482,-11.1861586;
    -27.88941,-40.56093755,-16.93612955;
    -39.9428823,-57.7849215,-23.6619249;
    -50.2287377,-74.2941824,-29.9108772;
    -45.9132942,-75.41916395,-36.1662525;
    -40.5957683,-75.7341069,-42.24140595;
    -35.4617,-76.97573335,-48.8528695;
    -31.3017337,-80.11006035,-56.3217372;
    -25.8556194,-80.37432,-61.62379185;
    -20.9079855,-66.19042,-52.1282333;
    -15.6737955,-48.6537329,-38.6457681;
    -10.4002196,-32.02986065,-25.6696015;
    -5.7131479,-16.2006845,-13.32244285;
    -1.9110928,-2.2529271,2.64988115;
    ];
SG_position = [26;85;145;205;265;325;385;445;505;565;625;685;745;805;865];
%% deflection data plot
plot(DG_position,-DG(:,1),'-or');
hold on;
plot(DG_position,-DG(:,2),'-og');
hold on;
plot(DG_position,-DG(:,3),'-ob');
hold on;
xlabel('x (in mm)');
ylabel('deflection (in mm)');
title('x vs deflection plot');


%% Theoretically calculated value of Strain

%{
x = [0:0.01:865];
y1 = [];% strain in case1
y2 = [];% strain in case2
y3 = [];% strain in case3

% Case I
for t=0:0.01:269.99
    y1=[y1;(16.052*10^-5)*t*10^-3];
end

for t=270:0.01:865
    y1=[y1;(6.301-7.281*t*10^-3)*10^-5];
end

% Case II
for t=0:0.01:269.99
    y2=[y2;(23.872*10^-5)*t*10^-3];
end

for t=270:0.01:574.99
    y2=[y2;(6.301+0.539*t*10^-3)*10^-5];
end

for t=575:0.01:865
    y2=[y2;19.718*(1-t/865)*10^-5];
end

% Case III
for t=0:0.01:574.99
    y3=[y3;7.820*10^-5*t*10^-3];
end

for t=575:0.01:865
    y3=[y3;13.416*(1-t/865)*10^-5];
end

%}
%{
plot(x,y1*10^6,'-r');
hold on;
plot(SG_position,abs(SG(:,1)),'-ok');
hold on;
title("x vs |Strain|      [Case I]");
xlabel("x (in mm)");
ylabel("|Strain| (in 10^{-6} mm/mm)");
%}
%{
plot(x,y2*10^6,'-r');
hold on;
plot(SG_position,abs(SG(:,2)),'-ok');
hold on;
title("x vs |Strain|      [Case II]");
xlabel("x (in mm)");
ylabel("|Strain| (in 10^{-6} mm/mm)");
%}

%{
plot(x,y3*10^6,'-r');
hold on;
plot(SG_position,abs(SG(:,3)),'-ok');
hold on;
title("x vs |Strain|      [Case III]");
xlabel("x (in mm)");
ylabel("|Strain| (in 10^{-6} mm/mm)");
%}

%{
plot(x,y1*10^6,'-r');
hold on;
plot(x,y2*10^6,'-b');
hold on;
plot(x,y3*10^6,'-g');
hold on;
xlabel("x (in mm)");
ylabel("Strain (in 10^{-6} mm/mm)");
title("x vs |\epsilon_x(x)| --- Theoretical value");
%}

%% Theoretically calculated values of Moment
%{
m1=[];
m2=[];
m3=[];

% Case I
for t=0:0.01:269.99
    m1=[m1;6.742*t*10^-3];
end

for t=270:0.01:865
    m1=[m1;(2.646-3.058*t*10^-3)];
end

% Case II
for t=0:0.01:269.99
    m2=[m2;10.025*t*10^-3];
end

for t=270:0.01:574.99
    m2=[m2;(2.646+0.225*t*10^-3)];
end

for t=575:0.01:865
    m2=[m2;8.281*(1-1.156*t*10^-3)];
end

% Case III
for t=0:0.01:574.99
    m3=[m3;3.283*t*10^-3];
end

for t=575:0.01:865
    m3=[m3;5.635*(1-1.156*t*10^-3)];
end

plot(x,m1);
hold on;
plot(x,m2);
hold on;
plot(x,m3);
hold on;
title("x vs M(x)");
xlabel('x (in mm)');
ylabel('Moment(X) (in N.m)');
%}