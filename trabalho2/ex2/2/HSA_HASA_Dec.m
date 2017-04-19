function [rcHSAd,prHSAd,bpbHSAd,rcHASAd,prHASAd,bpbHASAd] = HSA_HASA_Dec( filename )    
    
    if nargin==0
         filename = 'lena.bmp';
    end
    
    % Vector do histograma de input
    % histFile(filename);
    
    % Obter a descodificacao Huffman semi-adaptativo, 
    fileDec='HuffmanSemiAdaptativoDec.txt';
    [rcHSAd,prHSAd,bpbHSAd] = HuffmanSemiAdaptativoDec(fileDec);
    
    % Huffman Aritmético semi-adptativo
    fileDec='HuffmanAritemeticoSemiAdaptativoDec.txt';
    [rcHASAd,prHASAd,bpbHASAd] = HuffmanAritemeticoSemiAdaptativoDec(fileDec);

end

