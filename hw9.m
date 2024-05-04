x = linspace(-1,1,100);
N = 0;
tol = 1e-6;
f_1 = @(theta) exp(cos(theta));
f_2 = @(x) exp(x);
T = Cheby(f_1,x,3);
y = f_2(x);
plot(x,y,'b-')
hold on 
plot(x,T,'r-')

while true
    y = f_2(x);
    T = Cheby(f_1,x,N);
    error = max(abs(T - y));
    if error < tol
        disp(N);
        disp(error);
        break
    end
    N = N + 1;
end
N = [2,3,4,5];

for i = N
    y = piece(x);
    piece_theta = @(theta) piece(cos(theta));
    T = Cheby(piece_theta,x,i);
    error = max(abs(T-y))
end
%%
function y = Cheby(f,x,N)
sum_T = 0;
for i = 0:N
    F = @(theta) f(theta) * cos(i*theta);
    A = 2/pi * simpsons(F,0,pi,100);
    if i == 0 
        A = 1/2 * A;
    end
    sum_T = sum_T + A * chebyshevT(i,x);
end
y = sum_T;
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

function y = piece(x)
if x > 0
    y = 1;
elseif x == 0
    y = 0;
else
    y = -1;
end
end