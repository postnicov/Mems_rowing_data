clear;close all;clc
FS=12;
%% Load data
load DataPinsk
t3{1}=t;
omegax3{1}=omegax;
load DataPinsk2
t3{2}=t;
omegax3{2}=omegax;
load DataPinsk3
t3{3}=t;
omegax3{3}=omegax;
clear t omegax
%

% 
mnt={'March','April','June'};
clr={'black','blue','red'};
fmt={'-','--','-.'};
ttl={'IV','V','VII'};
%
%% Curve extractions
jJ=[4,5,7];
for m=1:3;
    j=jJ(m);
for n=1:3;
    t=t3{n};
    omegax=omegax3{n};  
           for k=1:3;%length(t(j,:))% 
            clear OMEGA ind0 omegax1 L J  Ff T
            t1=t{j,k};
            J=2:length(t1)-2;       
            omegax1=omegax{j,k};
            F=fft(omegax1);
            Ff=F;
            FT=400;
            Ff(FT:end-FT+1)=0;
            omegax1f=ifft(Ff,'symmetric');
            ind0=find((omegax1f(J)>0)&(omegax1f(J+1)<0));             
          
            if length(omegax1)>0;
          
             subplot(3,3,k+3*(m-1))
             box on
            hold on
            for jj=1:length(ind0)-1;
                L(jj)=ind0(jj+1)-ind0(jj)+1;
                T(jj,1:L(jj))=t1(ind0(jj):ind0(jj+1))-t1(ind0(jj))';
                OMEGA(jj,1:L(jj))=omegax1(ind0(jj):ind0(jj+1))';
            end
%             sz=size(OMEGA);
            indL=find((L>2000)&(L<4500));
            L=L(indL);
            T1=T(indL,:);
            OMEGA1=OMEGA(indL,:);
            T=T1;
            OMEGA=OMEGA1;
            sz=size(OMEGA);
%             %
%             for m=1:sz(1);
%                 plot(T(m,T(m,:)>0),OMEGA(m,T(m,:)>0),'color','cyan')
%                 hold on
%             end            
            Lm=round(mean(L));
                omegam=mean(OMEGA(:,1:Lm));
                plot(t1(1:Lm)-t1(1),omegam,fmt{n},'color',clr{n},'LineWidth',1.5);
                %
                plot([0 3.8],[0 0],':','color',[0.5 0.5 0.5])
                xlim([0 3.8])
                ylim([-1.5 2.2])
                %
                xlabel('{\it t}, s')
                ylabel('{\it \omega_x}, s^{-1}')
                title(['(',ttl{m},'-',num2str(k),')']);
                set(gca,'XTick',[0:3])
                set(gca,'FontSize',FS,'FontName','Times')
            end
        end
end

end
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 15 15],'PaperSize',[15 15])
 print('FigRowingCurves','-dpng','-r150','-f') 
