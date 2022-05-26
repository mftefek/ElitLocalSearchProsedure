%% MATLAB code of Rao-1 algorithm
%% Unconstrained optimization
%% Sphere function
function Rao1 ()
clc
clear all
pop = 10; % Population size
var = 30; % Number of design variables
maxFes = 30000; % Maximum functions evaluation
maxGen = floor(maxFes/pop); % Maximum number of iterations
mini = -100*ones(1,var);
maxi = 100*ones(1,var);
[row,var] = size(mini);
x = zeros(pop,var);
for i=1:var
x(:,i) = mini(i)+(maxi(i)-mini(i))*rand(pop,1);
end
f = objective(x);
gen=1;
while(gen <= maxGen)
xnew = updatepopulation(x,f);
xnew = trimr(mini,maxi,xnew);
fnew = objective(xnew);
for i=1:pop
if(fnew(i)<f(i))
x(i,:) = xnew(i,:);
f(i) = fnew(i);
end
end
disp(['Iteration No. = ',num2str(gen)])
disp('%%%%%%%% Final population %%%%%%%%%')
disp([f])
fnew = []; xnew = [];
[fopt(gen),ind] = min(f);
xopt(gen,:)= x(ind,:);
gen = gen+1;
end
[val,ind] = min(fopt);
Fes = pop*ind;
disp(['Optimum value = ',num2str(val,10)])
end

function [xnew] = updatepopulation(x,f)
[row,col]=size(x);
[t,tindex]=min(f);
Best=x(tindex,:);
[w,windex]=max(f);
worst=x(windex,:);
xnew=zeros(row,col);
for i=1:row
for j=1:col
xnew(i,j)=(x(i,j))+rand*(Best(j)-worst(j));
end
end
end
