for i=1:length(FTest)
    NFTest(i)=extractBetween(FTest(i),"t_",".raw");
end
A=[NFTest;TTest;YTest];
B=cellstr(A);
fileID = fopen('file/location','wt');
fprintf(fileID, '%s - %s\n%s\n', B{:});
fclose(fileID);