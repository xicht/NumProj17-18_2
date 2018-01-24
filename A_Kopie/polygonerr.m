function err=polygonerr(x,y,F)

%F stammfunktion von F

intp=0;

for i=1:length(x)-1
    intp = intp + (y(i)+y(i+1))/2 * (x(i+1)-x(i));
end

intf=F(x(length(x)))-F(x(1));

err=intf-intp;

end