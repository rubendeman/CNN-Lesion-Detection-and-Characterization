function y= rubenwrite(filename,img)
fid=fopen(filename,'w');
fwrite(fid,img,'double');
fclose(fid);