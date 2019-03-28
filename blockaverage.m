function newimg = blockaverage(oldimg)

nrrows=size(oldimg,1);
nrcols=size(oldimg,2);

if 0
    newimg=oldimg;
    
    for row=2:nrrows-1
        for col=2:nrcols-1
            newimg(row,col)=mean(mean(oldimg(row-1:row+1,col-1:col+1)));
        end
    end
end

size(oldimg);
nrrows;
nrcols;

newimg=0;
newimg=newimg+oldimg(1:nrrows-2,1:nrcols-2);
newimg=newimg+oldimg(2:nrrows-1,1:nrcols-2);
newimg=newimg+oldimg(3:nrrows-0,1:nrcols-2);
newimg=newimg+oldimg(1:nrrows-2,2:nrcols-1);
newimg=newimg+oldimg(2:nrrows-1,2:nrcols-1);
newimg=newimg+oldimg(3:nrrows-0,2:nrcols-1);
newimg=newimg+oldimg(1:nrrows-2,3:nrcols-0);
newimg=newimg+oldimg(2:nrrows-1,3:nrcols-0);
newimg=newimg+oldimg(3:nrrows-0,3:nrcols-0);
newimg=newimg/9.0;