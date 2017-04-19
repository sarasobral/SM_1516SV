function [ rc,pr,bpb ] = taxaDeCompressao_SNR( do,dc )
    
    % Compressao
    rc = dc/do;
    % Percentagem removida
    pr = (1-rc)*100;
    % Bits por byte
    bpb = 8*rc;

end

