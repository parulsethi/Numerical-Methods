A = [-6 2 1 2 1;
     3 8 -4 1 0;
     -1 1 4 10 1;
     3 -4 1 9 2;
     2 0 1 3 10];
b = [3;4;-2 ;12;1];

m = length(A(:,1));
n = length(A(1,:));
 
% make scale vector
for i = 1:m
    S(i) = max(abs(A(i,:)));
end
S = S'

% pivoting
for p = 1:m-1

    M = abs(A(p:m,p))/S(p:m)
    a_max_p = max(M); 

    q = find(M(:) == a_max_p); % Row of a_max_p
    if isempty(q)
    q = find(M(:) == -a_max_p);
    end

    % Switch the row with the maximum value and the pivot row.
    if (a_max_p > A(p,p))
    temp = A(q,:);
    A(q,:) = A(p,:);
    A(p,:) = temp;
    end

    if A(p,p) ~= 0
    for i = (p+1):m % find multiplier
    Lij = A(i,p)/A(p,p);
    for j = p:n % multiply the row by multiplier
    A(i,j) = A(i,j) - Lij*A(p,j);
    end
    end
    end
end

x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end

disp(x);
