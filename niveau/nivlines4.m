function [ X ,Y ] =nivlines4 (F, dFx, dFy, Z, A, B, C, D, Steps, StepWidth)
% generiert Mengen von Wertpaaren (xij,yij) mit F(xij,yij)=Z(j) mit
% mit unterschiedlicher Schrittweite- und Anzahl.

%Die Startpunkte werden im Intervall [A(j),B(j)]x[C(j),D(j)] gesucht, wobei
%entweder Vektoren A aus R^(1 x k) oder Skalare a übergeben werden können,
%wobei Skalar so behandelt werden, dass A(j)=a für alle j.

% X und Y sind cell-Arrays der Länge k, wobei für alle j
% X{j} bzw Y{j} Vektoren aus R^(1 x Steps(j)) sind, die die zu plottenden
% Punkte enthalten.

%VEKTORDIMENSIONEN ASSERTS ETC

k = length(Z);

if length(Steps)==1
    Steps=Steps*ones(k,1);
end

if length(StepWidth)==1
    StepWidth=StepWidth*ones(k,1);
end

assert(k==length(Steps));
assert(k==length(StepWidth));
Steps=floor(Steps);

if length(A)==1
    A=A*ones(k,1);
end

if length(B)==1
    B=B*ones(k,1);
end

if length(C)==1
    C=C*ones(k,1);
end

if length(D)==1
    D=D*ones(k,1);
end

assert(k==length(A));
assert(k==length(B));
assert(k==length(C));
assert(k==length(D));

for i = 1:k
    assert(A(i)<B(i));
    assert(C(i)<D(i));
end




X = cell(k,1);
Y = cell(k,1);

X0=zeros(1,k);
Y0=zeros(1,k);

for j = 1:k
    X{j}=zeros(Steps(j)+1,1);
    Y{j}=zeros(Steps(j)+1,1);
    Fj = @(x,y)F(x,y) - Z(j);
    [X0(j),Y0(j),err]=findZero(Fj,A(j),B(j),C(j),D(j));
    
    
    if err ~= 0 % keine Nst gefunden
        warning('Zu folgendem Funktionswert wurde keine Startpunkt gefunden:');
        Z(j)
        X{j}=zeros(0); %leerer Vektor, damit nichts geplotet wird
        Y{j}=zeros(0);
    else
        [X{j},Y{j}] = implicitCurveXXX( Fj, dFx, dFy, X0(j), Y0(j), Steps(j), StepWidth(j) );
    end
    
end



end
