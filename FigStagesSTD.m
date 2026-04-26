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
jJ=[1:7];
%%
for n=1;
    t=t3{n};
    omegax=omegax3{n};  
    for z=1:7;
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
            Lm=round(mean(L));
                omegam=mean(OMEGA(:,1:Lm));
                omegastd=std(OMEGA(:,1:Lm));
                Stab(k,z)=100*mean(omegastd./abs(omegam));
                %
            end
        end
    end
end
%
subplot(3,1,1)
plot([1:7],Stab(1,:),'o','color','black')
hold on
plot([1:7],Stab(2,:),'s','color','blue')
plot([1:7],Stab(3,:),'d','color','red')
%
xlim([0.5 7.5])
% xlabel('Participant')
% ylabel('$\langle \mathrm{STD}(\omega_x)/|\omega_x|\rangle,~\%$','Interpreter','Latex')
title('Stage I');
set(gca,'XTick',[1:7],'XTickLabel',ttl);
set(gca,'FontSize',FS,'FontName','Times')
%%
for n=2;
    t=t3{n};
    omegax=omegax3{n};  
    for z=1:7;
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
            Lm=round(mean(L));
                omegam=mean(OMEGA(:,1:Lm));
                omegastd=std(OMEGA(:,1:Lm));
                Stab(k,z)=100*mean(omegastd./abs(omegam));
                %
            end
        end
    end
end
%
subplot(3,1,2)
plot([1:7],Stab(1,:),'o','color','black')
hold on
plot([1:7],Stab(2,:),'s','color','blue')
plot([1:7],Stab(3,:),'d','color','red')
%
xlim([0.5 7.5])
% xlabel('Participant')
ylabel('$\langle \mathrm{STD}(\omega_x)/|\omega_x|\rangle,~\%$','Interpreter','Latex')
title('Stage II');
set(gca,'XTick',[1:7],'XTickLabel',ttl);
set(gca,'FontSize',FS,'FontName','Times')
%%
for n=3;
    t=t3{n};
    omegax=omegax3{n};  
    for z=1:7;
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
            Lm=round(mean(L));
                omegam=mean(OMEGA(:,1:Lm));
                omegastd=std(OMEGA(:,1:Lm));
                Stab(k,z)=100*mean(omegastd./abs(omegam));
                %
            end
        end
    end
end
%
subplot(3,1,3)
plot([1:7],Stab(1,:),'o','color','black')
hold on
plot([1:7],Stab(2,:),'s','color','blue')
plot([1:7],Stab(3,:),'d','color','red')
%
xlim([0.5 7.5])
xlabel('Participant')
% ylabel('$\langle \mathrm{STD}(\omega_x)/|\omega_x|\rangle,~\%$','Interpreter','Latex')
title('Stage III');
set(gca,'XTick',[1:7],'XTickLabel',ttl);
set(gca,'FontSize',FS,'FontName','Times')
%%
set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 15 10],'PaperSize',[15 10])
print('FigStabParticipants','-dpng','-r150','-f') 