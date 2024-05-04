%% Final Project
% Shun Iwata
% 
% ID:28699490
% Initialization

n=20;
tol=1e-4;
A=diag(-2.*ones(n,1))+diag(1*ones(n-1,1),-1)+diag(1*ones(n-1,1),1);
h=pi/(n+1);
x1=(1:n)*h;
f=h^2*sin(x1);
% part(1)
% SOR

N=1000;
tol=1e-4;
w=1.5;
x0=zeros(n,1);
x=zeros(n,1);
k=1;
while k<=N
    for i=1:n
        x(i)=(1-w)*x0(i)+w/A(i,i)*(f(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n));
    end
    if norm(x-x0)<tol
            
            fprintf('x found after %d iterations', k)
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
%% 
% Jacobi

k=1;
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(f(i)-A(i,1:n)*x0(1:n)+A(i,i)*x0(i))/A(i,i);
    end
    if norm(x-x0)<tol
            fprintf('x found after %d iterations', k)
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
% Gauss-Seidel

k=1;
x0=zeros(n,1);
x=zeros(n,1);
while k<=N
    for i=1:n
        x(i)=(f(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    end
    if norm(x-x0)<tol
            
            fprintf('x found after %d iterations', k)
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
% part(2)
% By comparing the number of iteration took to converge to x, SOR took the least 
% and Jacobi Iterative Method took the most iterations. Hence, SOR converges the 
% fastest among the three methods.
% part(3)

N=1000;
tol=1e-4;
w=1.5;
x0=zeros(n,1);
x=zeros(n,1);
k=1;
while k<=N
    for i=1:n
        x(i)=(1-w)*x0(i)+w/A(i,i)*(f(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n));
    end
    if norm(x-x0)<tol
            break;
    end
        k=k+1;
    for i=1:n
        x0(i)=x(i);
    end
end
figure
plot(x1,x,"Marker","o","MarkerSize",5)
% part(4)

x=ones(n,1);
D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);
T=-inv(D)*(L+U);
k=1;
p=min(find(abs(x(1:n))==abs(max(x))));
x=x/x(p);
while k<=N
    y=T*x;
    mu=y(p);
    p=min(find(abs(y(1:n))==abs(max(y))));
    if y(p)==0
        x
        disp('A has the eigenvalue 0 , select a new vector x and restart')
        break;
    end
    err=max(abs(x-y/y(p)));
    x=y/y(p);
    if err<tol
        mu 
        x
        fprintf('x and mu found after %d iterations', k)
        break;
    end
    k=k+1;
    if k==N+1
        disp('The maximum number of iterations exceeded')
    end
end
%% 
%