%% Computer Assignment 8
% Shun Iwata
% 
% ID: 28699490
% 1,

f = @(x) sin(1./x)./x;
a = 1;
b = 3;
N = 100;
depth = 0;
e = 1e-7;
exact = integral(f,a,b)
Gauss(f,a,b)
% 3,

adaptive(f,a,b,depth, N, e)
%%
function y = Gauss(f,a,b)
t = 1/sqrt(3);
y = (b-a)/2 * (f((b-a)/2 * t +  (b+a)/2) + (f((b-a)/2 * -t + (b+a)/2)));
end

function y = adaptive(f,a,b,depth, N, e)
One = Gauss(f,a,b);
c = (a + b)/2;
Two = Gauss(f,a,c) + Gauss(f, c,b);
if depth > N
    fprintf('Error: Max Depth Reached \n');
    y = Two;
else
    if abs(One - Two) < e
        fprintf("depth of %i", depth)
        sub_interval = [a b];
        y = Two
    else
        y = adaptive(f,a,c,depth + 1, N, e) + adaptive(f,c,b, depth + 1, N, e);
    end
end
end