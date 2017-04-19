function [ do,dc ] = HuffmanAritemeticoSemiAdaptativoCod( filename )

    huffman = 'Arith64_Enc.e';
    fileCod='HuffmanAritemeticoSemiAdaptativoCod.txt';
    [do,dc] = huff_dim(huffman, filename, fileCod);

end

