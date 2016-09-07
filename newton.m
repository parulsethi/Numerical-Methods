a=input('Enter the function:','s');
x(1)=input('Enter Initial Guess:');
error=input('Enter allowed Error:');
f=inline(a)
dif=diff(sym(a));
d=inline(dif);
for i=1:100
x(i+1) = x(i)-((f(x(i))/d(x(i))));
% accelerated scheme
if i > 1
	x(i+1) = x(i+1)-(((x(i+1)-x(i))**2)/(x(i+1)+x(i-1)-2*x(i)));
err(i) = abs((x(i+1)-x(i))/x(i));
if err(i)<error
break
end
end
root=x(i)