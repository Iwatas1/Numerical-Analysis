%% Computer Assignment 6
% Shun Iwata
% 
% ID: 28699490
% 1,

exact = integral(@(x) x.*log(x),1,2)
% 2,

a = 1;
b = 2;

trapezoid_whole = trapezoid(a,b,1)
simpsons_whole = simpsons(a,b,2)
% 4,

n = [10,20,50,100];
trap = [];
for i = 1:length(n)
    trap(i) = trapezoid(1,2,n(i));
end
plot(n,trap,'-r')
hold on 

simp = [];
for i = 1:length(n)
    simp(i) = simpsons(1,2,n(i));
end
plot(n,simp, '-b')
hold off
%%
function y = trapezoid(a,b,n)
sum = 0;
h = (b-a)/n;
for i = 1:n-1
    x = a + i*h;
    sum = sum + f(x);
end
y = h/2 * (f(a) + 2*sum + f(b));
end
   
 

function y = simpsons(a,b,n)
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

function y = f(x)
y = x * log(x);
end