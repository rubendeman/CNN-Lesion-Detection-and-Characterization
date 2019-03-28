function randimg=rbnoise(imsize,desired_std,blursigma)
    
    %
    % create random img
    %
    randimg=randn(imsize,imsize);
    
    %
    % perform gaussian blur
    %
    if blursigma > 0
      
    kernel=gaussimg(max(round(6*blursigma)),blursigma);
    kernel=kernel/sum(kernel(:));
    randimg=conv2(randimg,kernel,'same');
    end
    
    %
    % adjust std
    %
    randimg=randimg*(desired_std/std(randimg(:)));
