function [z] = trimr(mini,maxi,x)
[row,col]=size(x);
for i=1:col
x(x(:,i)<mini(i),i)=mini(i);
x(x(:,i)>maxi(i),i)=maxi(i);
end
z=x;
end