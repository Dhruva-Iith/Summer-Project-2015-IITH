%% Finding angle theta for minimum MSE/maximum PSNR
clc;
clear all;
% reading an image
a = imread('lena.png');
[m,n1] = size(a);
%a = double(a);
n = double(a) + 10*randn(m);
figure;
subplot(1,3,1);
a = uint8(a);
imshow(a);
e = double(a)-double(n);
e = e.*e;
mse_n = mean(e(:))
psnr_n = 10*log10(65025/mse_n)
subplot(1,3,2);
n = uint8(n);
imshow(n)
s1 = 15;
s2 = 15;
sigma1 = 0.8;
sigma2 = 0.5;
theta1 = 34*(pi/180);

h = gauss2(s1,sigma1,s2,sigma2,theta1);
f1=conv2(double(n),double(h),'same');
e1 = double(a)-double(f1);
e1 = e1.^2;
mse1 = mean(e1(:))
f1 = uint8(f1);
subplot(1,3,3)
imshow(f1);
psnr1= 10*log10(65025/mse1)
%end
%plot(psnr1)
%% checking for minimum sigma

l = 20;
%mse1 = double(zeros(20,1));
psnr1 = double(zeros(l,1));
%i=1;
s=1;
for sigma1=0.1:0.05:1.05
    %sigma2 = 1.1*sigma1;
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse1(s) = mean(e1(:));
    psnr1(s) = 10*log10(65025/mse1(s));
    s = s+1;
end
figure
ar = 0.1:0.05:1.05;
subplot(1,2,1)
plot(ar,psnr1)
grid on
title('Minimum Variance in x')
xlabel('Variance')
ylabel('PSNR')

s=1;
sigma1 = 0.75;
for sigma2=0.1:0.05:1.05
    %sigma2 = 1.1*sigma1;
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse1(s) = mean(e1(:));
    psnr1(s) = 10*log10(65025/mse1(s));
    s = s+1;
end
% plotting PSNR vs variance value
ar = 0.1:0.05:1.05;
subplot(1,2,2)
plot(ar,psnr1)
grid on
title('Minimum Variance in y')
xlabel('Variance')
ylabel('PSNR')