cylinder_diameter = 100*10^-3;
cylinder_span = 305*10^-3;
Cp = [pressure_data(1,2:end)./pressure_data(1,1);pressure_data(2,2:end)./pressure_data(2,1);pressure_data(3,2:end)./pressure_data(3,1)];
Cd = zeros(3,1);
for j = 1:3
 for i = 1:30
 Cd(j,1) = Cd(j,1) + Cp(j,i)*cos(location_of_port(i,2));
 end
end
Cd = Cd.*(-0.5);
big_data = cell2mat(DATAforStudents);
figure(1)
plot(location_of_port(:,2),Cp(1,:))
hold on
grid on
plot(location_of_port(:,2),Cp(2,:))
plot(location_of_port(:,2),Cp(3,:))
scatter(location_of_port(:,2),Cp(1,:))
hold on
grid on
scatter(location_of_port(:,2),Cp(2,:))
scatter(location_of_port(:,2),Cp(3,:))
hold off
Cp_big = zeros(151,30);
for k = 1:151
 Cp_big(k,:) = big_data(k,2:end)./big_data(k,1);
end
Cd_big = zeros(151,1);
for j = 1:151
 for i = 1:30
 Cd_big(j,1) = Cd_big(j,1) + Cp_big(j,i)*cos(location_of_port(i,2));
 end
end

Cd_big = Cd_big.*(-0.5);
% figure
% hold on
% grid on
% for n = 1:151
% plot(location_of_port(:,2),Cp_big(n,:));
% end
% hold off
rho = 1.2;
v = 0.15*10^-4;
D = 100*10^-3;
dynamic_pressure = cell2mat(DATAforStudents(:,1));
U = sqrt((2*dynamic_pressure)/rho);
Re = (U*D)/v;
figure(2)
scatter(Re,Cd_big)
set(gca,'xscale','log')
set(gca,'yscale','log')
grid on