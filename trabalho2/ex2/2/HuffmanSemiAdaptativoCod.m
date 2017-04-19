function [ do,dc ] = HuffmanSemiAdaptativoCod( filename )

    huffman = 'Huff64_Enc.e';
    fileCod='HuffmanSemiAdaptativoCod.txt';
    [do,dc] = huff_dim(huffman, filename, fileCod);

end

