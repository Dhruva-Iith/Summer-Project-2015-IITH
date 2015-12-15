function [mse,var] = psnr_2_mse(psnr)
mse = (255^2)/(10^(psnr/10));
var = mse^.5;
end

