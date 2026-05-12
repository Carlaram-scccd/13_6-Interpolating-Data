% Interpolating Data 
% Load census data 
load census
% Create a plot 
plot(cdate,pop,'o')
grid on
title('US Population from 1770 to 1990')
xlabel ('Year')
ylabel('Population in million')
hold on 
t = 1770:1990; 
popCub = spline(cdate,pop,t);
plot(t,popCub)
legend("Census Data",'Interpolation',Location = "northwest")
% Find population using interpolation 
lin1945 = interp1(cdate,pop,1945);
cub1945 = spline(cdate,pop,1945);
pch1945 = pchip(cdate,pop,1945);
% Create 3 statements 
fprintf("A linear interpolation calculates a population of %.1f million in 1945.\n",lin1945)
fprintf("A cubisc spline interpolation calculates a population of %.1f million in 1945.\n",cub1945)
fprintf("A pchip interpolation calculates a population of %.1f million in 1945.\n",pch1945)
% use your cubic spline interpolation to approximate the year when pop is 100 million
% at100Mill = popCub>99 & popCub<101;
% pop100Mill = popCub(at100Mill)
% year100Mill = t(at100Mill)

idx = find(popCub>99 & popCub<101,1,"first")
year100Mill = t(idx)