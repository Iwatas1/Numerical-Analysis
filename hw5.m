%% Computer Assignment 5
% Shun Iwata
% 
% ID: 28699490
%% (1)
% Forward difference

n = [10, 20, 50, 100];
for N = n
    x = linspace(-5,5, N+1);
    h = 10/N;
    f_forward = (f(x(3:end))-f(x(2:end-1)))/h;
    plot(x(2:end-1),f_forward, 'DisplayName',['N = ' num2str(N)])
    hold on
end
hold off
% Backward difference

for N = n
    x2 = linspace(-5,5, N+1);
    h = 10/N;
    f_backward = (f(x2(2:end-1))-f(x2(1:end-2)))/h;
    plot(x2(2:end-1),f_backward, 'DisplayName',['N = ' num2str(N)])
    hold on
end
hold off
% Central difference

for N = n
    x3 = linspace(-5,5, N+1);
    h = 10/N;
    f_central = (f(x3(3:end))-f(x3(1:end-2)))/(2*h);
    plot(x3(2:end-1),f_central, 'DisplayName',['N = ' num2str(N)])
    hold on
end
hold off
%% (2) Central difference for second order derivative ${f^{\prime } }^{\prime } \left(x\right)$

for N = n
    x4 = linspace(-5,5, N+1);
    h = 10/N;
    f_second = (f(x4(1:end-2)) - 2* f(x4(2:end-1)) + f(x4(3:end)))/h^2;
    plot(x4(2:end-1),f_second, 'DisplayName',['N = ' num2str(N)])
    hold on
end
hold off
%% (3)

format long
N = [1,2,5,10,20,40];
D_f = [];
for i = 1:length(N)
    D_f(i) = (f(10^(-N(i)))-f(0))/(10^(-N(i)));
end
D_f
%% 
% As the N-value gets larger, the forward difference formula will be closer 
% to 0, which is the correct value of $f^{\prime } \left(x\right)=-\frac{2x}{{\left(1+x^2 
% \right)}^2 }$ at 0. In other words, the forward difference formula will be more 
% accurate as the N value gets larger. 

function y=f(x)
y=1./(1+x.^2);
end