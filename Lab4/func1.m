function index = func1(Pz,Py,delZ,delY)

m=size(Pz);
n=m(2);

temp1 = Pz./Py;
temp2 = delZ./delY;
index =[];

mx = inf;
for i=(1:n)
    if abs(temp1(i)-temp2(i))<mx
        mx=abs(temp1(i)-temp2(i));
        index=i;
    elseif abs(temp1(i)-temp2(i)) == mx
        index=[index,i];
    end
end