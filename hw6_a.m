%% Computer Assignment 6
% Shun Iwata
% 
% ID:28699490
%% Problem 1

A1=[2 -1 1;2 2 2; -1 -1 2];
b1=[-1;4;-5];
tol=1e-4;
N=25;
% Jacobi Iterative Method

k=1;
n=length(A1(1,:));
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(b1(i)-A1(i,1:n)*x0(1:n)+A1(i,i)*x0(i))/A1(i,i);
    end
    if norm(x-x0)<tol
            x
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
if k>N
    disp("Max number of iterations exceeded")
end
% Gauss Siedel Iterative Method

k=1;
n=length(A1(1,:));
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(b1(i)-A1(i,1:i-1)*x(1:i-1)-A1(i,i+1:n)*x0(i+1:n))/A1(i,i);
    end
    if norm(x-x0)<tol
            x
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
if k>N
    disp("Max number of iterations exceeded")
end

% Problem 2
% Jacobi Iterative Method

A2=[1 2 -2; 1 1 1; 2 2 1];
b2=[7; 2; 5];
k=1;
n=length(A1(1,:));
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(b2(i)-A2(i,1:n)*x0(1:n)+A2(i,i)*x0(i))/A2(i,i);
    end
    if norm(x-x0)<tol
            x
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
if k>N
    disp("Max number of iterations exceeded")
end
%% 
% Gauss Siedel Iterative Method

k=1;
n=length(A1(1,:));
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(b2(i)-A2(i,1:i-1)*x(1:i-1)-A2(i,i+1:n)*x0(i+1:n))/A2(i,i);
    end
    if norm(x-x0)<tol
            x
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
if k>N
    disp("Max number of iterations exceeded")
end