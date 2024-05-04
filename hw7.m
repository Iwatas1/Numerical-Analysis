%% Computer Assignment 7
% Shun Iwata
% 
% ID: 28699490
% 1, 

format long
n = [10, 20, 50, 100];
exact = integral(@(x) cos(2*x) .* exp(-x), 0,2*pi);
f = @(x) cos(2.*x) .* exp(-x);
error =[];
for i = 1:length(n)
    error(i) = abs(exact - simpsons(f,0,2*pi,n(i)));
end
plot(n,error,'-r')
% 2, 

exact
Adaptive_Simpson(f,0,2*pi,5e-5,10)
%%
function y = Adaptive_Simpson(f,a,b,tol,depth)
c = (a+b)/2;
S = (b-a)/6 * (f(a) + 4 * f(c) + f(b));
S_left = (c-a)/6 * (f(a) + 4 * f((a + c)/2) + f(c));
S_right = (b-c)/6 * (f(c) + 4 * f((b + c)/2) + f(b));
S_2 = S_left + S_right;
depth = depth - 1;
if abs(S_2 - S) <= 15 * tol || depth == 0
    y = S_2 + (S_2 - S)/15;
else
    tol = tol/2;
    y = Adaptive_Simpson(f,a,c,tol,depth) + Adaptive_Simpson(f,c,b,tol,depth);
end
end

function y = simpsons(f,a,b,n)
h = (b-a)/n;
I_0 = f(b) + f(a);
I_1 = 0;
I_2 = 0;
for i = 1:n-1
    x = a + i*h;
    if mod(i,2) == 0
        I_2 = I_2 + f(x);
    else 
        I_1 = I_1 + f(x);
    end
y = h/3 * (I_0 + 2*I_2 + 4*I_1);
end
end