function y=nps(img)
fourier=(abs(fftshift(fft2(img)))).^2;
topol=im2polar(fourier,400,.5);
y=mean(topol,1);
