function y=downsample(x)
    nrrows=size(x,1);
    nrcols=size(x,2);
    x=reshape(x,[2,nrrows*nrcols/2]);
    x=mean(x,1);
    x=reshape(reshape(x,[nrrows/2,nrcols])',[2,nrrows*nrcols/4]);
    x=mean(x,1);
    y=reshape(x,[nrcols/2,nrrows/2])';
end