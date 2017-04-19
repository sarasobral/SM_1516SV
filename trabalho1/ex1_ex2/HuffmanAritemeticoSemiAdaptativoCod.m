function [ rcHASAc,prHASAc,bpbHASAc ] = HuffmanAritemeticoSemiAdaptativoCod( filename )

    huffman = 'Arith64_Enc.e';
    fileCod='HuffmanAritemeticoSemiAdaptativoCod.txt';
    [rcHASAc,prHASAc,bpbHASAc] = huff_taxa_compressao(huffman, filename, fileCod);

end

