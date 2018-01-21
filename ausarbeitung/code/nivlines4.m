function [ X ,Y ] =nivlines4 (F, dFx, dFy, Z, A, B, C, D, Steps, StepWidth)

X = cell(k,1);
Y = cell(k,1);

X0=zeros(1,k);
Y0=zeros(1,k);

for j = 1:k
    X{j}=zeros(Steps(j)+1,1);
    Y{j}=zeros(Steps(j)+1,1);
    Fj = @(x,y)F(x,y) - Z(j);
    [X0(j),Y0(j),err]=findZero(Fj,A(j),B(j),C(j),D(j));
    
    if err ~= 0 % kein Startwert gefunden
        X{j}=zeros(0); %leerer Vektor, damit nichts geplotet wird
        Y{j}=zeros(0);
    else
        [X{j},Y{j}] = implicitCurveXXX( Fj, dFx, dFy, X0(j), Y0(j), Steps(j), StepWidth(j) );
    end
end
end
