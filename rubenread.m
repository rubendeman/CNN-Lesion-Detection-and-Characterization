function img= rubenread(filename)
fid=fopen(filename,'r');
img=fread(fid,[128,128],'double');
fclose(fid);