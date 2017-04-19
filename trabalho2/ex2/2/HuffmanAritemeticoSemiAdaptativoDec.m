function [ rcHASAd,prHASAd,bpbHASAd ] = HuffmanAritemeticoSemiAdaptativoDec( fileDec )

    huffman = 'Arith64_Dec.e';
    fileCod='HuffmanAritemeticoSemiAdaptativoCod.txt';
    [rcHASAd,prHASAd,bpbHASAd] = huff_taxa_compressao(huffman, fileCod, fileDec);

end

