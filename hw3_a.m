%% Gauss elimination 
% Shun Iwata
% 
% ID: 28699490
% Initialization

A=[pi -sqrt(2) 1 -1 ; exp(1) -1 1 2 ; 1 1 -sqrt(3) 1 ; -1 -1 1 -sqrt(5)];
b=[0;1;2;3];
M=[A b]
n=length(M(:,1));
x=zeros(n,1);
% Row swaping and elimination process

for i=1:n-1
    p=min(find(M(i:n,i)~=0));
    p=p+(i-1);
    if p~=i
        M([i p],:)=M([p i],:);
    elseif p==i
        M;
    else 
    disp('no unique solution');
        break;
    end
    for j=i+1:n
        m=M(j,i)/M(i,i);
        M(j,:)=M(j,:)-m*M(i,:);
        if M(n,n)==0
            disp('no unique solution');
            break;
        end
    end
end
x(n)=M(n,n+1)/M(n,n);
 for k=n-1:-1:1
    x(k)=(M(k,n+1)-M(k,k+1:n)*x(k+1:n))/M(k,k);
 end
x
A*x