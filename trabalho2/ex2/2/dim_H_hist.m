function [ H, do ] = dim_H_hist( fileInput )

    % file size
    d = dir(fileInput);
    do = d.bytes;
    
    % entropy
    H = file_entropy(fileInput);
    
end

