a=input('Enter function: ','s');
f=inline(a);
R=input( 'Range for the roots as [ x_min , x_max] :\n');

[nr,mr] = size(R);
if feval(f,R( 1,1))*feval(f,R(1,2)) == 0
if feval(f,R( 1,1)) == 0
R(1,1)
return
else
feval(f,R(1,2)) == 0
R(1,2)
return
end
end
% condition for convergence
if feval(f,R( 1,1) )*feval(f,R(1,2)) > 0
disp ( 'No root lies in the given range');
return
end

tol = abs(input('Enter the allowed error:'));
n = input('Enter the maximum number of iterations :');
%initializing the value of k and matrix X
k=1;
X = zeros(n+1,3);
x0 = R(1,1); x1= R(1,2); x_disp= x0; err = x1-x0;

% iteration loop
while k <= n && abs(err) > tol 
x = x1 - (x1-x0)/( feval(f,x1)-feval(f,x0))*feval(f,x1);

if feval(f , x0) * feval(f , x) == 0

return
else
if feval(f,x0) * feval(f,x) < 0
err = x - x1;
x1 = x;
x_disp=x1;
X(k,2) = x1;
else
err = x-x0;
x0 = x;
x_disp = x0;
X(k,2) = x0;
end 
end 
% accelerated scheme
if k > 2
	X(k,2) = X(k,2) - ((X(k,2)-X(k-1,2))**2)/(X(k,2)+X(k-2,2)-2*X(k-1,2))
% storing values in the form of matrix
X(k,1) = k;
X(k,3) = abs(err);
k = k + 1;
end
if abs(err) > tol
disp(sprintf ('The final answer obtained after %3d iterations is %10.10f with an error %10.10f \n' , n , X(n,2),X(n,3)))
disp('Try more no of iterations') 
else
disp(sprintf ('The final answer obtained after %3d iterations is %10.10f with an error %10.10f \n' , (k-1) , X((k-1),2),X((k-1),3)))
end