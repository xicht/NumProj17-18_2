F = @(x,y) x.^2+y.^2-1;

[x0,y0,err]=findZero (F, -0.5, 0.5, -1, 1);

F(x0,y0)
