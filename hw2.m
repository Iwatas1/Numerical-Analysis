%% Computer Assignment 2
% Shun Iwata
% 
% ID: 28699490

X=[0.0 0.1 0.3 0.6 1.0];
Y=[-6.0;-5.89483;-5.65014;-5.17788;-4.28172];
x=0.05;
%%
L_i_poly=Newton(X,Y,x);
L_i_poly
%%
function y=Newton(X,Y,x)
n=length(X)-1;
 sum=Y(1,1);
 for i=1:n
     for j=1:i
         Y(i+1,j+1)=(Y(i+1,j)-Y(i,j))/(X(i+1)-X(i-j+1));
     end
 end
 for i=1:n
     poly=1;
     for j=1:i
         poly=poly*(x-X(j));
     end
     sum=sum+Y(i+1,i+1)*poly;
 end
 y=sum;
end