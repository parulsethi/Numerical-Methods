% LU using crout's method

A=[1 1 2;2 -1 1;1 2 0];
b=[1 2 1]; 

sz = size(A);
n = sz(1);
L = eye(n);
P = eye(n);
U = A;
 
for i=1:sz(1)
 
    % Row reducing    
    if U(i,i)==0
        maximum = max(abs(U(i:end,1)));
        for k=1:n
           if maximum == abs(U(k,i))
               temp = U(1,:);
               U(1,:) = U(k,:);
               U(k,:) = temp;
           end
        end 
    end
 
    if U(i,i)~=1
        temp = eye(n);
        temp(i,i)=U(i,i);
        L = L * temp;
        U(i,:) = U(i,:)/U(i,i);
    end
 
    if i~=sz(1) 
        for j=i+1:length(U)
            temp = eye(n);
            temp(j,i) = U(j,i);
            L = L * temp;
            U(j,:) = U(j,:)-U(j,i)*U(i,:); 
        end
    end 
end

[nRow,nCol]=size(L);    

y=zeros(nRow,1);
y(1)=b(1)/L(1,1);
b=b(:);

for n=2:nRow
    y(n)=( b(n) - L(n,1:n-1)*y(1:n-1) ) / L(n,n);
end

[nRow,nCol]=size(y);
[nRow,nCol]=size(U);

x=zeros(nRow,1);
x(nRow)=y(nRow)/U(nRow,nRow);

y=y(:);

for n=(nRow-1):-1:1
    x(n)=(y(n)-(U(n,n+1:end)*x(n+1:end))) / U(n,n);
end
disp(x)
