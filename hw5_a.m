%% Computer Assignment 5
% Shun Iwata
% ID: 28699490
% Initialization

A=[4 -1 1; -1 4.25 2.75; 1 2.75 3.5];
n=length(A(1,:));
L = eye(n);
D = zeros(1,n);
% *LDL^t Factorization*

for i=1:n
    v=zeros(i-1,1);
    for j=1:i-1
        v(j)=L(i,j)*D(j);
    end
    D(i)=A(i,i)-L(i,1:i-1)*v;
    for j=i+1:n
        L(j,i)=(A(j,i)-L(j,1:i-1)*v)/D(i);
    end

end
L
D