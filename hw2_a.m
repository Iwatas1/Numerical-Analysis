%% Math 105LA Computer Assignment 2
% Shun Iwata
% 
% ID:28699490
% *(a) Fixed point algorithm*

a=1;
b=2;
x=linspace(a,b,100);
p_0=1;
tol=1e-5;
N0=300;
plot(x,f(x),'linewidth',2);hold on; 
i = 1;
while i<= N0
    p =f(p_0);
    plot(p_0,p,"Marker","o","MarkerSize",5)
    if abs(p-p_0)<tol
        fprintf("After %d iterations, p=%.5f \n",i,p);
        break;
    end
    p_0=p;
    i=i+1;
    if i == N0+1
    fprintf('The method failed after %d iterations.\n',N0);
    end
end
% (b) Newton's method

j=1;
p0=-1;
plot(x,f(x));hold on; 
while j<=N0
    p=p0-(g1(p0)./g2(p0))
    plot(p0,p,"Marker","o","MarkerSize",5)
    if abs(p-p0)<tol
        fprintf("After %d iterations, p=%.5f \n",j,p);
        break;
    end
    p0=p;
    j=j+1;
    if j == N0+1
    fprintf('The method failed after %d iterations.\n',N0);
    end
end
% (c) 
% Since both method required only 4 iterations, for p0=1, speed of convergence 
% is the same. 
% 
% 

function y=f(x)
y=(1/2).*x+1./x;
end

function y=g1(x)
y=-x^3-cos(x)-x;
end

function y=g2(x)
y=-3*x^2+sin(x)-1;
end