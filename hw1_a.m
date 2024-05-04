%% Math 105LA Computer Assignment 1
% Shun Iwata
% 
% ID:28699490
% Initialization/Input

a = -1;
b = 1;
tol = 1e-6;
Nmax = 300;
x=linspace(a,b,100);
plot(x,f(x));hold on;
% Algorithm

for i = 1:Nmax
    p = (a + b)/2;
    e = abs(b - a);
    FP = f(p);
    FA = f(a);
    plot(p,FP,"Marker","o","MarkerSize",5)
    
    if e < tol
        break;
    end
    
    if FP == 0
        break;
    end
    
    if FA * FP > 0
        a = p;
    else
        b =p;
    end
    
    i= i+1;
end

if i == Nmax + 1
    disp('MAX ITERATION REACHED. NO SOLUTION FOUND.');
else
    fprintf('Root found after %d iterations: %f\n', i, p);
    e
end
% Function

function y=f(x)
y=6*(exp(x) - x) - (7 + 3*x.^2 + 2*x.^3);
end