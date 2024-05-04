%% Computer Assignment 8
% Shun Iwata
% 
% ID:28699490
% Initialization

A=[-4 14 0; -5 13 0; -1 0 2];
x=[1;1;1];
N=1000;
tol=1e-6;
n=length(A(:,1));
k=1;
p=min(find(abs(x(1:n))==abs(max(x))));
x=x/x(p);
% Power Method

while k<=N
    y=A*x;
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
        g=sprintf('%d',x);
        mu 
        x
        break;
    end
    k=k+1;
    if k==N+1
        disp('The maximum number of iterations exceeded')
    end
end