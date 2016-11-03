% fpa - derivative value at left endpoint i.e., xi(1)
% fpb - derivative value at right endpoint i.e., xi(n)

xi = [-1 0 1 2];
fi = [5 1 1 11];

n = length ( xi );

for i = 1 : n-1
    hi(i) = xi(i+1) - xi(i);
end
dd(1) = 2.0*hi(1);  dd(n) = 2.0*hi(n-1);
ri(1) = (3.0/hi(1))*(fi(2)-fi(1)) - 3.0 * fpa;
ri(n) = 3.0 * fpb - (3.0/hi(n-1))*(fi(n)-fi(n-1));
for i = 1 : n-2
    dd(i+1) = 2.0 * ( hi(i) + hi(i+1) );
	ri(i+1) = (3.0/hi(i+1))*(fi(i+2)-fi(i+1))-(3.0/hi(i))*(fi(i+1)-fi(i));
end

c = tridiagonal ( hi(1:n-1), dd, hi(1:n-1), ri );

d = zeros ( n, 1 );
b = d;

for i = 1 : n-1
    d(i) = (c(i+1)-c(i))/(3.0*hi(i));
	b(i) = (fi(i+1)-fi(i))/hi(i) - hi(i)*(c(i+1)+2.0*c(i))/3.0;
end
csc = [ xi' fi' b c' d ];
