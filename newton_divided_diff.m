xi = [-1 0 1 2];
fi = [5 1 1 11];
t =  1.5
n = length ( xi );
m = length ( fi );

temp = fi;
for j = 2:n
    for i = n:-1:j
	    temp(i) = ( (t-xi(i-j+1))*temp(i) - (t-xi(i))*temp(i-1) ) / ...
		          ( xi(i) - xi(i-j+1) );
	end
end

disp (temp(n))
