%% the code is for finding the inverse laplace transformation and plotting the function

syms s t ;
rr = ilaplace ((12*s^3+38*s^2-224*s-120)/(s*(0.3*s^6+5.5*s^5+34.8*s^4+132*s^3+278*s^2-24*s^1-120*s^0))) ; %% write your function overhere
%rr = ilaplace(26.88/(s^4+11*s^3+10*s^2+4.48*s));
t = (0:0.01:10); %% control your time limit

plot(t,subs(rr));
xlabel("time in seconds");
ylabel("response") %% name accordingly
title("Slow Pilot's response for step input") %% name suitably
