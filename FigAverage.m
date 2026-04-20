clear;close all;clc
FS=12;

Tbl=[...
    3.38,0.20,2.12,0.11,1.22,0.21,3.25,0.20,2.13,0.10,1.09,0.22,3.14,0.15,2.14,0.12,0.97,0.20;...
3.33,0.18,2.45,0.27,0.88,0.34,3.27,0.15,2.43,0.28,0.83,0.31,3.07,0.18,2.40,0.31,0.68,0.36;...
3.29,0.12,2.36,0.27,0.94,0.31,3.19,0.18,2.35,0.28,0.86,0.31,2.92,0.20,2.26,0.31,0.69,0.36];

clr={'black','blue','red'};
mrk={'o','s','d'};
ttl={'(A)','(B)','(C)'};
ylims={[2.7 3.7],[1.75 2.75],[0.5 1.5]};

for n=1:3
    subplot(3,1,n)
    for k=1:3;
        errorbar([1:3]',Tbl(1:3,1+2*(n-1)+6*(k-1)),Tbl(1:3,2+2*(n-1)+6*(k-1)),...
            'Marker',mrk{k},'color',clr{k},'LineStyle',':','MarkerSize',6)
        hold on
    end
    xlim([0.75 3.25])
    ylim(ylims{n})
    ylabel('{\it \omega_x}, s^{-1}')
    title(ttl{n})
    set(gca,'FontName','Times','FontSize',FS,'XTick',[1:3],'XTickLabel',{'March','April','June'})
end

set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 15 12],'PaperSize',[15 12])
 print('FigAverage','-dpng','-r150','-f')