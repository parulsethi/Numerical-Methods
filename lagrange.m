xi = [-1 0 1 2];
fi = [5 1 1 11];
t = 1.5;

n=size(xi,2);
L=ones(n,1);
if (size(xi,2)~=size(fi,2))
   fprintf(1,'\nERROR!\nxi and fi must have the same number of elements\n');
   y=NaN;
else
   for i=1:n
      for j=1:n
         if (i~=j)
            L(i,:)=L(i,:).*(x-xi(j))/(xi(i)-xi(j));
         end
      end
   end
   y=0;
   for i=1:n
      y=y+fi(i)*L(i,:);
   end
end