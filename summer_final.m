% plug all the parameters obtained and apply the filter
clc;
a = imread('lena.png');
[m,n] = size(a);
n = double(a) + 10.0009*randn(m);
figure;
subplot(1,3,1);
a = uint8(a);
imshow(a);
e = double(a)-double(n);
e = e.*e;
mse_initial = mean(e(:))
psnr = 10*log10(65025/mse_initial)
subplot(1,3,2);
n = uint8(n);
imshow(n)
s1 = 11;
s2 = 11;
sigma1 = 0.5;  
sigma2 = 1; 
theta1 = 164*(pi/180);
%psnr1 = zeros(100,1);
%for sigma1 =1:100 
    %sigma2 = sigma1;
    h = gauss2(s1,sigma1,s2,sigma2,theta1);
    f1=conv2(double(n),double(h),'same');
    e1 = double(a)-double(f1);
    e1 = e1.*e1;
    mse_after = mean(e1(:))
    f1 = uint8(f1);
    subplot(1,3,3)
    imshow(f1);
    psnr1= 10*log10(65025/mse_after)
