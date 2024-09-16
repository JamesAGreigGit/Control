clear 
close all
clc

P1 = readmatrix('ResultsP1.txt');
P2 = readmatrix('ResultsP2.txt');
P3 = readmatrix('ResultsP3.txt');

Angles = 40:10:160;


figure(1)
subplot(3,1,1);
errorbar(Angles,P1(1,:),P1(2,:),'o','MarkerSize',4,'linewidth',1,'color','red')
hold on
plot(Angles,Angles,'linewidth',1)
ylim([20 180])
xlim([30 170])
hold off
legend('Participant 1','Target','location','northwest')
subplot(3,1,2);
errorbar(Angles,P2(1,:),P2(2,:),'o','MarkerSize',4,'linewidth',1,'color',"#EDB120")
hold on
plot(Angles(1:11),Angles(1:11),'linewidth',1)
ylim([20 170])
xlim([30 170])
ylabel('Measured Angle (Degrees)')
hold off
legend('Participant 2','Target','location','northwest')
subplot(3,1,3);
errorbar(Angles,P3(1,:),P3(2,:),'o','MarkerSize',4,'linewidth',1,'color',"#7E2F8E")
hold on
plot(Angles(1:7),Angles(1:7),'linewidth',1)
ylim([20 170])
xlim([30 170])
hold off
legend('Participant 3','Target','location','northwest')
xlabel('Elbow Flexion Angle (Degrees)')
fontsize(16,"points")

figure(2)
errorbar(Angles,P1(3,:),P1(4,:),'o','MarkerSize',4,'linestyle','--','linewidth',1,'color','red')
hold on
errorbar(Angles,P2(3,:),P2(4,:),'o','MarkerSize',4,'linestyle','--','linewidth',1,'color',"#EDB120")
errorbar(Angles,P3(3,:),P3(4,:),'o','MarkerSize',4,'linestyle','--','linewidth',1,'color',"#7E2F8E")
hold off
ylim([0 60])
ylabel('Pressure (kPa)')
xlim([30 170])
xlabel('Target Angle (Degrees)')
legend('Participant 1','Participant 2','Participant 3','location','northwest')
fontsize(16,"points")

P1E = mean(P1(1,:)-Angles);
P2E = mean(P2(1,(1:11))-Angles(1:11));
P3E = mean(P3(1,(1:7))-Angles(1:7));

Error = mean([P1E P2E P3E]);