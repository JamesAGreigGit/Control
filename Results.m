clear
clc
close all
%Read matrix files from folder
data = readmatrix('100.txt');

%Collect sample rate and elbow flexion angle
Sample = data(:,1);
%Sample Freq, Hz
Fs = 2000;
Time = Sample/Fs;
FlexionAngleRaw = abs(data(:,2));
FlexionAngle = smoothdata(FlexionAngleRaw,'gaussian',2000);

%Apply Gaussian filter to pressure and force
Gauss = smoothdata(data(:,3),'gaussian',50);

%Pressure Function
PressureV = Gauss(:,1);
pmax = 30;
pmin = -30;
Vs = 5;

func2 = @(x) (x * ((pmax - pmin)/(0.8 * Vs)) - (0.1 * Vs) + pmin - 3.54)*6.89476;
Pressure = arrayfun(func2,PressureV);

%Find peaks in elbow flexion angle
[pks,locs] = findpeaks(FlexionAngle,Sample,'MinPeakProminence',30);
[pks2,locs2] = findpeaks(Pressure,Sample,'MinPeakProminence',10);

figure(1)
subplot(2,1,1);
plot(Time,FlexionAngle);
findpeaks(FlexionAngle,Time,'MinPeakProminence',30)
ylabel('Elbow Flexion Angle (Degrees)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
subplot(2,1,2);
plot(Time,Pressure);
findpeaks(Pressure,Time,'MinPeakProminence',10)
xlim([0 max(Time)])
ylim([0 60])
ylabel('Pressure (kPa)')
set(get(gca,'ylabel'),'rotation',0)

Results100 = [mean(pks(1:9)) std(pks(1:9));mean(pks2) std(pks2)];
writematrix(Results100);
