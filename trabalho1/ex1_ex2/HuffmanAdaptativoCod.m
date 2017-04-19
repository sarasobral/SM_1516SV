function [ rcHAc,prHAc,bpbHAc ] = HuffmanAdaptativoCod( filename )

    huffman = 'AHuff64_Enc.e';
    fileCod = 'HuffmanAdaptativoCod.txt';
    [rcHAc,prHAc,bpbHAc] = huff_taxa_compressao(huffman, filename, fileCod);

end

