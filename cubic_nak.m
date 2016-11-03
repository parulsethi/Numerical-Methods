xi = [-1 0 1 2];
fi = [5 1 1 11];

n = length ( xi );

for i = 1 : n-1
    hi(i) = xi(i+1) - xi(i);
end
for i = 1 : n-2
    dd(i) = 2.0 * ( hi(i) + hi(i+1) );
	ri(i) = (3.0/hi(i+1))*(fi(i+2)-fi(i+1))-(3.0/hi(i))*(fi(i+1)-fi(i));
end
dd(1)   = dd(1)   + hi(1) + hi(1)^2 / hi(2);
dd(n-2) = dd(n-2) + hi(n-1) + hi(n-1)^2 / hi(n-2);

du = hi(2:n-2);
dl = du;
du(1) = du(1) - hi(1)^2 / hi(2);
dl(n-3) = dl(n-3) - hi(n-1)^2 / hi(n-2);

temp = tridiagonal( dl, dd, du, ri );

c = zeros ( n,1 );
d = c;   b = c;

c(2:n-1) = temp;
c(1) = ( 1 + hi(1) / hi(2) ) * c(2) - hi(1) / hi(2) * c(3);
c(n) = ( 1 + hi(n-1) / hi(n-2) ) * c(n-1) - hi(n-1) / hi(n-2) * c(n-2);
for i = 1 : n-1
    d(i) = (c(i+1)-c(i))/(3.0*hi(i));
	b(i) = (fi(i+1)-fi(i))/hi(i) - hi(i)*(c(i+1)+2.0*c(i))/3.0;
end

csn = [ xi' fi' b c d ];
