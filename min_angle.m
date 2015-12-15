%% Finding angle theta for minimum MSE/maximum PSNR
clc;
clear all;
% reading an image
a = imread('lena.png');
[m,n] = size(a);
%a = double(a);
n = double(a) + 10.009*randn(m);
% the variance value is taken from the psnr value
figure;
subplot(1,3,1);
a = uint8(a);
imshow(a);
e = double(a)-double(n);
e = e.*e;
mse = mean(e(:))
psnr = 10*log10(65025/mse)
subplot(1,3,2);
n = uint8(n);
imshow(n)
% filter parameters
s1 = 11;
s2 =11;
sigma1 = .5;  
sigma2 = 1; 
theta1 = 0;
%psnr1 = zeros(100,1);
%for sigma1 =1:100 
    %sigma2 = sigma1;
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse1 = mean(e1(:))
    f1 = uint8(f1);
    subplot(1,3,3)
    imshow(f1);
    psnr1= 10*log10(65025/mse1)

%% checking for minimum angle

mse1 = double(zeros(360,1));
i=1;
for theta1=0:pi/180:2*pi
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse1(i) = mean(e1(:));
    i = i+1;
    
end
figure
plot(mse1)
grid on
title('Minimum Angle')
xlabel('Angle')
ylabel('MSE')

% finding that particular angle
index = min(mse1);
i=1;
while i<=180
    if mse1(i) == index;
     i 
     break
    else
        i=i+1;
end
end




