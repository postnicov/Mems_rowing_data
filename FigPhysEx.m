clear;close all;clc
FS=12;
load PhysExSets

subplot(2,1,1)
bar(Set1')
legend({'I','II','III','IV','V'})
xlabel('Week''s number')
ylabel('Trainings per week')
title('(A)')
xlim([0.5 10.5])
ylim([0 3.5])
set(gca,'Ytick',[0 1 2 3])
set(gca,'FontSize',FS,'FontName','Times')
subplot(2,1,2)
bar(Set2')
xlabel('Week''s number')
ylabel('Trainings per week')
title('(B)')
xlim([0.5 10.5])
ylim([0 3.5])
set(gca,'Ytick',[0 1 2 3])
set(gca,'FontSize',FS,'FontName','Times')

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 15 10],'PaperSize',[15 10])
 print('FigPhysEx','-dpng','-r150','-f') 



