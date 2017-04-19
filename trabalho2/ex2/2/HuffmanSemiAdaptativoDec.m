function [ rcHSAd,prHSAd,bpbHSAd ] = HuffmanSemiAdaptativoDec( fileDec )

    huffman = 'Huff64_Dec.e';
    fileCod='HuffmanSemiAdaptativoCod.txt';
    [rcHSAd,prHSAd,bpbHSAd] = huff_taxa_compressao(huffman, fileCod, fileDec);

end

