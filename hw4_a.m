%% Algorithm for Modified Gaussian Elimination
% Shun Iwata
% 
% ID:28699490

A=[1 -1 2 -1;2 -2 3 -3;1 1 1 0;1 -1 4 3];
n=length(A(:,1));
I=eye(n);
M=[A I];
%%
for i=1:n
    p=min(find(M(i:n,i)~=0));
    p=p+(i-1);
    if p~=i
        M([i p],:)=M([p i],:);
    elseif p==i
        M;
    else 
    disp('Not invertible');
        break;
    end
    for j=1:n
        if j~=i
        m=M(j,i)/M(i,i);
        M(j,:)=M(j,:)-m*M(i,:);
        end
        if M(n,n)==0
            disp('no unique solution');
            break;
        end
    end
end
%%
for k=1:n
    M(k,:)=M(k,:)/M(k,k);
end
M
A_inv=M(:,n+1:end)
M(:,1:n)
A_inv*A