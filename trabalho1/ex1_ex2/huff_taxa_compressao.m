% ISEL
%
% LEIC
%
% SM - Sistemas Multimédia
%
% coder_evaluator.m
% Recebe:
%      
% Retorna:
%       

function [rc, pr, bpb] = huff_taxa_compressao( huffman, fileInput, fileOutput)
    system(sprintf('%s %s %s', huffman, fileInput, fileOutput));
    
    d = dir(fileInput);
    do = d.bytes;
    
    % Vector do histograma de output
    %h=histFile(fileOutput);
    d = dir(fileOutput);
    % Dimensao do ficheiro codificado
    dc = d.bytes;
    
    % Compressao
    rc = (dc/do)*100;
    % Percentagem removida
    pr = (1-(dc/do))*100;
    % Bits por byte
    bpb = 8*rc;
end