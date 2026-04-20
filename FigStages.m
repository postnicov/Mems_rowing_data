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
mnt={'март','апрель','июнь'};
ttl={'I','II','III','IV','V','VI','VII'};
%
%% Curve extractions
jJ=[1,6];
for n=2;
    t=t3{n};
    omegax=omegax3{n};  
    for z=1:2;
        j=jJ(z);
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
          
%             figure
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
subplot(2,3,k+3*(z-1))
            for m=1:sz(1);
                plot(T(m,T(m,:)>0),OMEGA(m,T(m,:)>0),'color','cyan')
                hold on
            end            
            Lm=round(mean(L));
                omegam=mean(OMEGA(:,1:Lm));
                plot(t1(1:Lm)-t1(1),omegam,'-','color','black','LineWidth',2);
                xlim([0 4])
                ylim([-2 3.5])
                plot([0 4],[0 0],':','color',[0.5 0.5 0.5])
                %
                xlabel('{\it t}, s')
                ylabel('{\it \omega_x}, s^{-1}')
                title(['(',ttl{j},'-',num2str(k),')']);
                set(gca,'XTick',[0:4],'YTick',[-2:3]);
                set(gca,'FontSize',FS,'FontName','Times')
                %
            end
        end
    end
end
%
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 15 10],'PaperSize',[15 10])
 print('FigStages','-dpng','-r150','-f') 