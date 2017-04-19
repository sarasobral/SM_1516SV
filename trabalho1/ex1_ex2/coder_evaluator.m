% ISEL
%
% LEIC
%
% SM - Sistemas Multimédia
%
% coder_evaluator.m
% aplica os codificadores Huffman semi-adaptativo, Huffman adaptativo e aritmético semi-adptativo
% Recebe:
%       filename.
% Retorna:
%       taxa de compressÃ£o de cada codificador expressa em
%		-compressÃ£o, 
%		-percentagem removida e 
%		-bit por byte.

function [taxa_de_compressao] = coder_evaluator( filename )    
    
    if nargin==0
         filename = 'cp.htm';
    end
    
    % Vector do histograma de input
    % histFile(filename);

    % Huffman adaptativo 
    [rcHA,prHA,bpbHA] = HuffmanAdaptativoCod(filename);
    
    % Huffman semi-adaptativo, 
    [rcHASA,prHASA,bpbHASA] = HuffmanSemiAdaptativoCod(filename);
    
    % Aritmético semi-adptativo
    [rcHSA,prHSA,bpbHSA] = HuffmanAritemeticoSemiAdaptativoCod(filename);

    %Cada linha corresponde a um codigo huffman
    taxa_de_compressao = [rcHA,prHA,bpbHA ; rcHASA,prHASA,bpbHASA ; rcHSA,prHSA,bpbHSA];    

end

