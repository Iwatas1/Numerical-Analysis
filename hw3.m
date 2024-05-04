%% Computer Assignment 3
% Shun Iwata
% 
% ID:28699490

x=[1 2 3];
Y=[1.105170918 1.491824698 2.459603111];
YP=[0.2210341836 0.5967298792 1.475761867];
%%
H_5=Hermite(x,Y,YP,1.25)
H_3=Hermite(x(1:2),Y(1:2),YP(1:2),1.25)
exp(0.1*(1.25)^2)
%%
function y=Hermite(X,Y,YP,x)
n=length(X)-1;
    for i=0:n
        z(2*i+1)=X(i+1);
        z(2*i+2)=X(i+1);
        Q(2*i+1,1)=Y(i+1);
        Q(2*i+2,1)=Y(i+1);
        Q(2*i+2,2)=YP(i+1);
        if i ~= 0
            Q(2*i+1,2)=(Q(2*i+1,1)-Q(2*i,1))/(z(2*i+1)-z(2*i));
        end
    end
    sum=Q(1,1);
    for i=2:(2*n+1)
        for j=2:i
            Q(i+1,j+1)=(Q(i+1,j)-Q(i,j))/(z(i+1)-z(i-j+1));
        end
    end
    for i=1:(2*n+1)
         poly=1;
         for j=1:i
             poly=poly*(x-z(j));
         end
         sum=sum+Q(i+1,i+1)*poly;
     end
     y=sum;
end