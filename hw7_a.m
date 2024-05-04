%% Computer Assignment 7
% Shun Iwata
% 
% ID:28699490
% Initialization

A=[4 -1 0; -1 4 -1; 0 -1 4];
b=[-1; 4; -5];
tol=1e-4;
N=25;
k=1;
n=length(A(1,:));
x0=zeros(n,1);
x=zeros(n,1);
% Calculating ω

D=diag(diag(A));
L=tril(A,-1);
U=triu(A,1);
T=-inv(D)*(L+U);
e_vals=eig(T);
w=2/(1+sqrt(1-(max(abs(e_vals)))^2))
% SOR Iterative Method

while k<=N
    for i=1:n
        x(i)=(1-w)*x0(i)+w/A(i,i)*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n));
    end
    if norm(x-x0)<tol
            x
            fprintf('Root found after %d iterations', k)
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
% From the result, it is clear that choice of ω was optimal since it only required 
% 6 iterations, which is relatively low for computation
% With ω/2

x0=zeros(n,1);
x=zeros(n,1);
w2=w/2
while k<=N
    for i=1:n
        x(i)=(1-w2)*x0(i)+w2/A(i,i)*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n));
    end
    if norm(x-x0)<tol
            x
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
% Although it was able to find the x, compare to initial ω, it took way more 
% iterations, which show that ω/2 was not the best choice for SOR Iterative method.
% With 2ω

x0=zeros(n,1);
x=zeros(n,1);
w3=2*w
while k<=N
    for i=1:n
        x(i)=(1-w3)*x0(i)+w3/A(i,i)*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n));
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
% As the result shows, 2ω was unable to find x indicating that 2ω is not the 
% optimal value for SOR iterative mathod.