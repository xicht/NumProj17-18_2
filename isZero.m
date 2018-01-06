function [ bool ] = isZero( val )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global epsZero;
if((exist(epsZero) ~= 1) || (epsZero == 0))
    epsZero = 5*eps;
end 

if(abs(val) > epsZero) 
    bool = true;
else
    bool = false;
end

