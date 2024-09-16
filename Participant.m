clear
clc
close all
%Read matrix files from folder
R40 = readmatrix('Results40.txt');
R50 = readmatrix('Results50.txt');
R60 = readmatrix('Results60.txt');
R70 = readmatrix('Results70.txt');
R80 = readmatrix('Results80.txt');
R90 = readmatrix('Results90.txt');
R100 = readmatrix('Results100.txt');
%R110 = readmatrix('Results110.txt');
%R120 = readmatrix('Results120.txt');
%R130 = readmatrix('Results130.txt');
%R140 = readmatrix('Results140.txt');
%R150 = readmatrix('Results150.txt');
%R160 = readmatrix('Results160.txt');

Angle = [R40(1,1) R50(1,1) R60(1,1) R70(1,1) R80(1,1) R90(1,1) R100(1,1) 0 0 0 0 0 0];
SD = [R40(1,2) R50(1,2) R60(1,2) R70(1,2) R80(1,2) R90(1,2) R100(1,2) 0 0 0 0 0 0];

Pressure = [R40(2,1) R50(2,1) R60(2,1) R70(2,1) R80(2,1) R90(2,1) R100(2,1) 0 0 0 0 0 0];
SDP = [R40(2,2) R50(2,2) R60(2,2) R70(2,2) R80(2,2) R90(2,2) R100(2,2) 0 0 0 0 0 0];
Target = 40:10:160;
Error = abs(Target-Angle);
ResultsP3 = [Angle;SD;Pressure;SDP]
writematrix(ResultsP3)

