function [doHSA,dcHSA,doHASA,dcHASA] = HSA_HASA_Cod( filename )    
    
    if nargin==0
         filename = 'lena.bmp';
    end
    
    % Vector do histograma de input
    % histFile(filename);
    
    % Huffman semi-adaptativo, 
    [doHSA,dcHSA] = HuffmanSemiAdaptativoCod(filename);
    
    % Huffman Aritmético semi-adptativo
    [doHASA,dcHASA] = HuffmanAritemeticoSemiAdaptativoCod(filename);

end

