function [ X ,Y ] =nivlines1 (F, dFx, dFy, X0, Y0, steps, stepWidth)
% generiert Mengen von Wertpaaren (xij,yij) mit F(xij,yij)=F(X0j,Y0j) mit
% gegeben Stellen, durch die die Niveau-Linien gehen sollen

% X und Y sind Matrizen aus R^(k x steps) wobei deren Zeilenvektoren
% X(j,:) bzw Y(j,:) genau die zu plotenden Graphen sind. (j=1,..,k)
%
% X0 und Y0 sind Vektoren aus R^(1 x k) wobei (x(j),y(j)) die jeweiligen
% Startpunkte fuer Niveaulinien sind

k = length(X0);
assert(k==length(Y0));

X = zeros(k,steps+1);
Y = zeros(k,steps+1);

for j = 1:k
    Fj = @(x,y)F(x,y) - F(X0(j),Y0(j));
    [X(j,:),Y(j,:)] = implicitCurveXXX( Fj, dFx, dFy, X0(j), Y0(j), steps, stepWidth );
    
end



end
