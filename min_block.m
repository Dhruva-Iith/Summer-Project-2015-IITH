%% Finding block size for minimum MSE/maximum PSNR
clc;
clear all;
% reading an image
a = imread('lena.png');
[m,n1] = size(a);
% addition of noise
n = double(a) + 10*randn(m);
%n = awgn(a,8.13);
% plotting actual and noisy images
figure;
subplot(1,3,1);
a = uint8(a);
imshow(a);
% MSE calculation
e = double(a)-double(n);
e = e.*e;
mse_n = mean(e(:))
psnr_n = 10*log10(65025/mse_n)
subplot(1,3,2);
n = uint8(n);
imshow(n)

% Filter parameters
s1 = 11;
s2 =11;
sigma1 = .5;
sigma2 = 1;
theta1 = 34*(pi/180);
%psnr1 = zeros(100,1);
%for sigma1 =1:100
%sigma2 = sigma1;
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
%% checking for minimum block size

l = 50
%mse1 = double(zeros(20,1));
psnr1 = double(zeros(l,1));
%i=1;
% finding block size for minimum MSE/maximum PSNR
for s1=1:1:l % note: it is 0 to 'L' with increment of 1
    s2 = s1;
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse1(s1) = mean(e1(:));
    psnr1(s1) = 10*log10(65025/mse1(s1));
end

% plotting PSNR vs block size
figure
ar = 1:1:l;

plot(ar,psnr1)
grid on
xlabel('block size')
ylabel('PSNR')
title('Minimum Angle')