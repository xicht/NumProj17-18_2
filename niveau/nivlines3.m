function [ X ,Y ] =nivlines3 (F, dFx, dFy, Z, a, b, c, d, Steps, StepWidth)
% generiert Mengen von Wertpaaren (xij,yij) mit F(xij,yij)=F(X0j,Y0j) mit
% gegeben Stellen, durch die die Niveau-Linien gehen sollen mit
% unterschiedlicher Schrittweite- und Anzahl

% X und Y sind Matrizen aus R^(k x steps) wobei deren Zeilenvektoren
% X(j,:) bzw Y(j,:) genau die zu plotenden Graphen sind. (j=1,..,k)
%
% Z aus R^(1 x k) sind Funktionswerte für Niveaulinien, [a,b]x[c,d] ist
% der Suchbereich für Startpunkte der Niveaulinien 

k = length(Z);
assert(k==length(Z));
assert(k==length(Steps));
assert(k==length(StepWidth));
assert(a<b);
assert(c<d);
Steps=floor(Steps);

X = cell(k,1);
Y = cell(k,1);

X0=zeros(1,k);
Y0=zeros(1,k);

for j = 1:k
    X{j}=zeros(Steps(j)+1);
    Y{j}=zeros(Steps(j)+1);
    Fj = @(x,y)F(x,y) - Z(j);
    [X{j},Y{j},tmp]=findZero(Fj,a,b,c,d);
    xj=X{j}
    yj=Y{j}
    assert(tmp==0); % das gehört noch besser
    [X{j},Y{j}] = implicitCurveXXX( Fj, dFx, dFy, X0(j), Y0(j), Steps(j), StepWidth(j) );
    
end



end
