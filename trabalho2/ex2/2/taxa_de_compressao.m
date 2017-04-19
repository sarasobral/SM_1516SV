function [ rc ] = taxa_de_compressao( do, fileOutput )
    
%     dim = size(fileInput);
%     do=dim(1);

    d = dir(fileOutput);
    dc = d.bytes;
    
    rc = (dc/do)*100;

end

