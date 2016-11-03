xi = [-1 0 1 2];
fi = [5 1 1 11];
t = 1.5;

n = length ( xi );
m = length ( fi );

nf = fi;
for j = 2:n
    for i = n:-1:j
	    nf(i) = ( nf(i) - nf(i-1) ) / ( xi(i) - xi(i-j+1) );
	end
end

deg = length(nf) - 1;
y = nf(deg+1);
for j = deg : -1 : 1
	y = y .* ( t - xi(j) ) + nf(j) ;
end
disp(y)