%{
airlpm5_86 = airLPM3(2:end,2:end);
airlpm5_86 = cell2mat(airlpm5_86);
[x,y] = meshgrid([0 5 10 15 20 22.5],0:5:100);
z = airlpm5_86;
contourf(x,y,z);
xlabel("X coordinate");
ylabel("Y coordinate");

%}

T = [503 668 739 771 815 879 947 963 1036 1068 1062 1058 1027 1017];

phi = [5.5369 3.691 2.768 2.215 1.846 1.582 1.384 1.230 1.107 1.007 0.945 0.923 0.852 0.791];

plot(phi,T,'-*r');
xlabel("\phi ");
ylabel("Temperature (in C degree)");
title("Equivalence Ratio, \phi Vs Temperature,T");


