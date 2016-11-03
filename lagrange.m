function lp = lagrange_poly ( xi, i, t )
  n = length ( xi );
  temp = [1];
  denom = 1;

  if ( i == 1 )
     for j = 2:n
         temp = conv ( temp, [1 -xi(j)] );
  	   denom = denom * ( xi(1) - xi(j) );
     end
  elseif ( i == n )
     for j = 1:n-1
         temp = conv ( temp, [1 -xi(j)] );
  	   denom = denom * ( xi(n) - xi(j) );
     end
  else
     for j = 1:i-1
         temp = conv ( temp, [1 -xi(j)] );
  	   denom = denom * ( xi(i) - xi(j) );
     end
     for j = i+1:n
         temp = conv ( temp, [1 -xi(j)] );
  	   denom = denom * ( xi(i) - xi(j) );
     end
  end
  lp = temp/denom;

xi = [-1 0 1 2];
fi = [5 1 1 11];
t = 1.5;

temp = [0];
for i = 1:n
    temp = temp + lagrange_poly ( xi, i, t ) * fi(i);
end

disp(temp)