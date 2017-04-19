function [ rcHAd,prHAd,bpbHAd ] = HuffmanAdaptativoDec( fileDec )

    huffman = 'AHuff64_Dec.e';
    fileCod = 'HuffmanAdaptativoCod.txt';
    [rcHAd,prHAd,bpbHAd] = huff_taxa_compressao(huffman, fileCod, fileDec);

end

