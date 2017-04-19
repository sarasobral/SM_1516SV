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

function [ do,dc ] = huff_dim(huffman, fileInput, fileOutput)
    system(sprintf('%s %s %s', huffman, fileInput, fileOutput));
    
    d = dir(fileInput);
    do = d.bytes;
    
    % Vector do histograma de output
    %h=histFile(fileOutput);
    
    d = dir(fileOutput);
    % Dimensao do ficheiro codificado
    dc = d.bytes;
   
end