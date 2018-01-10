function [ X ,Y ] =nivlines2 (F, dFx, dFy, X0, Y0, Steps, StepWidth)
% generiert Mengen von Wertpaaren (xij,yij) mit F(xij,yij)=F(X0j,Y0j) mit
% gegeben Stellen, durch die die Niveau-Linien gehen sollen mit
% unterschiedlicher Schrittweite- und Anzahl

% X und Y sind Matrizen aus R^(k x steps) wobei deren Zeilenvektoren
% X(j,:) bzw Y(j,:) genau die zu plotenden Graphen sind. (j=1,..,k)
%
% X0 und Y0 sind Vektoren aus R^(1 x k) wobei (x(j),y(j)) die jeweiligen
% Startpunkte fuer Niveaulinien sind

k = length(X0);
assert(k==length(Y0));
assert(k==length(Steps));
assert(k==length(StepWidth));
Steps=floor(Steps);

X = cell(k,1);
Y = cell(k,1);

for j = 1:k
    X{j}=zeros(Steps(j)+1);
    Y{j}=zeros(Steps(j)+1);
    Fj = @(x,y)F(x,y) - F(X0(j),Y0(j));
    [X{j},Y{j}] = implicitCurveXXX( Fj, dFx, dFy, X0(j), Y0(j), Steps(j), StepWidth(j) );
    
end



end
