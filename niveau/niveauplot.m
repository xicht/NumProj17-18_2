function niveauplot (F, dFx, dFy, Z, a, b, c, d, Steps, StepWidth,logcolor)

[X, Y] = nivlines3(F, dFx, dFy, Z, a, b, c, d, Steps, StepWidth); 
CAP=string(Z);


if exist('logcolor')
    Z=log(Z);
end

Zplot = (Z-min(Z))./(max(Z)-min(Z));  % jetzt sind es Werte im Invervall [0,1]
Zplot = floor(1+Zplot*63);  %integers von 1 bis 64

figure(1)
colormap jet
MAP=colormap;
for i=1:64 % mach helle farben dunkler
    while norm(MAP(i,:))>1.2
        MAP(i,:)=MAP(i,:)*0.95;
    end
end

plot(X{1},Y{1},'Color',MAP(Zplot(1),:),'DisplayName',char(CAP(1)));
hold on
%legend(char(CAP(1)),'AutoUpdate','on');

for j=2:length(Z)
   plot(X{j},Y{j},'DisplayName',char(CAP(j)),'Color',MAP(Zplot(j),:));
end

hold off

end