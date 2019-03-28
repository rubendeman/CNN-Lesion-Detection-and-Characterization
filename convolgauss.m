function img=convolgauss(img,sigma)
    
if sigma > 0
    kernel=gaussimg(max(6*sigma,1),sigma);
    kernel=kernel/sum(kernel(:));
    img=conv2(img,kernel,'same');
end
