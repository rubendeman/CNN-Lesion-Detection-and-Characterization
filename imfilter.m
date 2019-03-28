function y=imfilter(img, npsfactor, psize, step)

%Upsample NPS factor to complete polar image
npspolar=repmat(sqrt(npsfactor),2*psize/step+1,1);

%Polar to cartesian
npsimg=polar2im(npspolar,length(img)/2,step);

%Fourier transform
fourier=fftshift(fft2(img));

%Image filter
fourier=fourier.*npsimg;

%Inverse fourier transform
y=real(ifft2(ifftshift(fourier)));
