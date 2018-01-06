function [ output_args ] = implicitCurve( F, x0, y0, steps, stepWidth )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

assert(isZero(F(x0, y0)));

x = x0 + stepWidth * (0:steps);
y = zeros(steps+1);
y(1) = y0;

for i = 2:steps+1
    y(i) = ImplicitDiff(F, x(i-1), y(i-1), 0.00001);
end

end

