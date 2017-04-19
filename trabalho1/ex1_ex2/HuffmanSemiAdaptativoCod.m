function [ rcHSAc,prHSAc,bpbHSAc ] = HuffmanSemiAdaptativoCod( filename )

    huffman = 'Huff64_Enc.e';
    fileCod='HuffmanSemiAdaptativoCod.txt';
    [rcHSAc,prHSAc,bpbHSAc] = huff_taxa_compressao(huffman, filename, fileCod);

end

