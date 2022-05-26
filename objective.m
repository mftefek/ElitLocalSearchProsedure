function [f] = objective(x)
[r,c]=size(x);
for i=1:r
y=0;
for j=1:c
y=y+(x(i,j))^2; % Sphere function
end
z(i)=y;
end
f=z';
end