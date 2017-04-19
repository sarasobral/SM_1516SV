% ISEL
%
% LEIC
%
% SM - Sistemas Multimedia
%
% coder_decoder_evaluator.m
% complementa a função coder_evaluator.m, com: 
% Recebe:
%       filename.
% Retorna:
%       taxa de compressÃ£o de cada codificador expressa em
%		-compressÃ£o, 
%		-percentagem removida e 
%		-bit por byte.

% - a respetiva descodificação, 
% - verificação de igualdade entre ficheiro original e descodificado, 
% - medição do tempo de codificação e de descodificação. 

function [taxa_de_compressao] = coder_decoder_evaluator(filename)
    
    if nargin==0
         filename = 'cp.htm';
    end
    
    d=dir(filename);    
    do = d.bytes;
    
    % Obter a codificacao Huffman adaptativo
    clockHuffmanACod = clock;
    [rcHAc,prHAc,bpbHAc] = HuffmanAdaptativoCod(filename);
    clockHuffmanACod = clock -clockHuffmanACod;
    % Obter a decodificacao Huffman adaptativo
    clockHuffmanADec = clock;
    fileDec = 'HuffmanAdaptativoDec.txt';
    [rcHAd,prHAd,bpbHAd] = HuffmanAdaptativoDec(fileDec);
    clockHuffmanADec = clock - clockHuffmanADec;
    % Dimensao do ficheiro de descodificadp
    dd = dir(fileDec);
    ddA = dd.bytes;
    
    % Obter a codificacao Huffman semi-adaptativo 
    clockHuffmanSACod = clock;  
    [rcHSAc,prHSAc,bpbHSAc] = HuffmanSemiAdaptativoCod(filename);
    clockHuffmanSACod = clock - clockHuffmanSACod;
    % Obter a descodificacao Huffman semi-adaptativo, 
    clockHuffmanSADec = clock;  
    fileDec='HuffmanSemiAdaptativoDec.txt';
    [rcHSAd,prHSAd,bpbHSAd] = HuffmanSemiAdaptativoDec(fileDec);
    clockHuffmanSADec = clock - clockHuffmanSADec;
    % Dimensao do ficheiro de descodificadp
    dd = dir(fileDec);
    ddSA = dd.bytes;
    
     % Obter a codificacao Huffman aritmético semi-adptativo 
    clockHuffmanASACod = clock;  
    [rcHASAc,prHASAc,bpbHASAc] = HuffmanAritemeticoSemiAdaptativoCod(filename);
    clockHuffmanASACod = clock - clockHuffmanASACod;
    % Obter a descodificacao Huffman aritmético semi-adaptativo, 
    clockHuffmanASADec = clock;  
    fileDec='HuffmanAritemeticoSemiAdaptativoDec.txt';
    [rcHASAd,prHASAd,bpbHASAd] = HuffmanAritemeticoSemiAdaptativoDec(fileDec);
    clockHuffmanASADec = clock - clockHuffmanASADec;
    % Dimensao do ficheiro de descodificadp
    dd = dir(fileDec);
    ddASA = dd.bytes;
    
    %Cada linha corresponde a um codigo huffman
    taxa_de_compressao = [rcHAc,prHAc,bpbHAc,clockHuffmanACod(6);
                          rcHSAc,prHSAc,bpbHSAc,clockHuffmanSACod(6);
                          rcHASAc,prHASAc,bpbHASAc,clockHuffmanASACod(6);
                          rcHAd,prHAd,bpbHAd,clockHuffmanADec(6);
                          rcHSAd,prHSAd,bpbHSAd,clockHuffmanSADec(6);
                          rcHASAd,prHASAd,bpbHASAd,clockHuffmanASADec(6);];          
   
    if (do>ddA) 
        sprintf('original maior que o adaptativo descodificado')
    elseif (do<ddA)
        sprintf('original menor que o adaptativo descodificado')
    elseif (do==ddA)
        sprintf('original igual ao adaptativo descodificado')
    end
    
    if (do>ddSA) 
        sprintf('original maior que o semi-adaptativo descodificado')
    elseif (do<ddSA)
        sprintf('original menor que o semi-adaptativo descodificado')
    elseif (do==ddSA)
        sprintf('original igual ao semi-adaptativo descodificado')
    end
    
    if (do>ddASA) 
        sprintf('original maior que o aritemetico semi-adaptativo descodificado')
    elseif (do<ddASA)
        sprintf('original menor que o aritemetico semi-adaptativo descodificado')
    elseif (do==ddASA)
        sprintf('original igual ao aritemetico semi-adaptativo descodificado')
    end
    
end
