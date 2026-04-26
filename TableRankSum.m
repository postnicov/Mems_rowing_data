clear;close all;clc;

load dataPeriods

% March-April
for j=1:18
    [p,h]=ranksum(March(:,j),April(:,j));
    P(1,j)=p;
    H(1,j)=h;
end
% March-June
for j=1:18
    [p,h]=ranksum(March(:,j),June(:,j));
    P(2,j)=p;
    H(2,j)=h;
end
% April-June
for j=1:18
    [p,h]=ranksum(June(:,j),April(:,j));
    P(3,j)=p;
    H(3,j)=h;
end