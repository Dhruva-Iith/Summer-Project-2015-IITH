function h1 = gauss2(n1,std1,n2,std2,theta)
r=[cos(theta) -sin(theta);
   sin(theta)  cos(theta)];

h = zeros(10,10);
for i = 1 : n2 
    for j = 1 : n1
        u = r * [j-(n1+1)/2 i-(n2+1)/2]';
        h(i,j) = gauss(u(1),std1)*gauss(u(2),std2);
    end
end
den = sum(h(:));

h1 = h/den;

        

































h = h / sqrt(sum(sum(h.*h)));