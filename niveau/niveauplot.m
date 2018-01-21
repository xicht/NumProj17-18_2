function niveauplot (F, dFx, dFy, Z, A, B, C, D, Steps, StepWidth,fontsize,logcolor)
% Plottet Niveaulinien von F zu den Werten Z(j)

%Die Startpunkte werden im Intervall [A(j),B(j)]x[C(j),D(j)] gesucht, wobei
%entweder Vektoren A aus R^(1 x k) oder Skalare a übergeben werden können,
%wobei Skalar so behandelt werden, dass A(j)=a für alle j.

% logcolor sorgt für Farbauswahl die nicht linear, sondern logarithmisch
% vom Funktionswert abhängt (die Option ist genau dann aktiv, wenn der 
% Parameter übergeben wird)

[X, Y] = nivlines4(F, dFx, dFy, Z, A, B, C, D, Steps, StepWidth); 
CAP=string(Z);


if exist('logcolor')
    Z=log(Z);
end

Zplot = (Z-min(Z))./(max(Z)-min(Z));  % jetzt sind es Werte im Invervall [0,1]
Zplot = floor(1+Zplot*63);  %integers von 1 bis 64

figure('DefaultAxesFontSize',fontsize);
figure(1)
colormap jet
MAP=colormap;
for i=1:64 % mach helle farben dunkler
    while norm(MAP(i,:))>1.2
        MAP(i,:)=MAP(i,:)*0.95;
    end
end

plot(X{1},Y{1},'Color',MAP(Zplot(1),:),'DisplayName',char(CAP(1)),'LineWidth',1);
hold on
%legend(char(CAP(1)),'AutoUpdate','on');

for j=2:length(Z)
   plot(X{j},Y{j},'DisplayName',char(CAP(j)),'Color',MAP(Zplot(j),:),'LineWidth',1);
end

hold off

end