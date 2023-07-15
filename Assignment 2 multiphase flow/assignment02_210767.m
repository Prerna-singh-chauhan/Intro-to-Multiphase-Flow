fileid=fopen("A1input.txt",'r');
format= '%f';
array = fscanf(fileid,format);
meu=array(1);
pg=array(2);
deltar= array(3);
R = array(4);
n=R/deltar;
n=n+1;
U=ones(n,1);
U(1)=1;

UR=ones(n,1);
UR(1)=1;

r=zeros(n,1);
r(1)=0;
for i=2:n
    r(i)=r(i-1)+deltar; 
    UR(i)=1-(r(i)/R)*(r(i)/R);
end

mm=pg*10/(2*meu); 
for i=2:n 
 U(i)=U(i-1)+deltar*mm*r(i-1); 
 r(i)=r(i-1)+deltar; 
end
fileid=fopen('MF_A1_O.txt','w');
fprintf(fileid,'r(m)              U(m/s)          U(num)(m/s)\n');
for i=1:n
fprintf(fileid,'%f          %f          %f\n',r(i,1),U(i,1),UR(i,1));
end

plot(r,UR,'r^','Markersize',2,'Linewidth', 2)
% line(r,U)
hold on
plot(r,U,'b^','Markersize',2,'Linewidth', 2)
% line(r,UR)
legend('Numerical Soln','Analytical Soln');
grid on
xlabel("Distance from centre(m)");
ylabel("Velocity(m/s)");
str = sprintf('For r= %0.3f', deltar);
title(str)
