%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 1.c) e 1.d)
% Objetivo: 
% Aplicar os codificadores Huffman semi-adaptativo, Huffman adaptativo e 
% aritmético semi-adptativo. Avaliar as taxas de compressão de cada 
% codificador em cada ficheiro; Relacionar a taxa de compressão, expressa
% em bit por byte, com os valores da entropia do ficheiro, H(X).
%
% Autores: 
% Sara Sobral, 40602
% Renato Junior, 40682
% Eduardo Antonio, 40686
%          
% Data: 9-05-2016
%--------------------------------------------------------------------------

%Limpar dados anteriores e linha de comandos
clear
clc

disp('-----------------------------------------------------------------------');
disp('Sistemas Multimedia - Exercicio 1.c) e 1.d)')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');

pergunta = 'Deseja correr a função coder_evaluator.m, para todos ficheiro do conjunto testFilesSM.zip ou apenas para 1?';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'um') && ~strcmp(resposta,'todos')
    disp('Não escolheu uma opção valida. Tente "um" ou "todos"');
    resposta=input(pergunta,'s');
end

if(strcmp(resposta,'um'))
    
    pergunta = 'Escolha um ficheiro:';
    resposta=input(pergunta,'s');
    while ~strcmp(resposta,'world192.txt') && ~strcmp(resposta,'watermark.cs') && ~strcmp(resposta,'random.txt') && ~strcmp(resposta,'progc.c') && ~strcmp(resposta,'Person.java') && ~strcmp(resposta,'musica.mp3') && ~strcmp(resposta,'lena.zip') && ~strcmp(resposta,'lena.JPG') && ~strcmp(resposta,'lena.jp2') && ~strcmp(resposta,'lena.gif') && ~strcmp(resposta,'lena.bmp') && ~strcmp(resposta,'legendas1.txt') && ~strcmp(resposta,'cp.htm') && ~strcmp(resposta,'arj241a.exe') && ~strcmp(resposta,'alice29.txt') 
        fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t world192.txt \n \t watermark.cs \n \t random.txt \n \t progc.c \n \t Person.java \n \t musica.mp3 \n \t lena.zip \n \t lena.JPG \n \t lena.jp2 \n \t lena.gif \n \t lena.bmp \n \t legendas1.txt \n \t cp.htm \n \t arj241a.exe \n \t alice29.txt \n');
        resposta=input(pergunta,'s');
    end
    taxa_de_compressao = coder_evaluator(resposta);

else
    
    % taxa_de_compressao para world192.txt 
    taxa_de_compressao = coder_evaluator('world192.txt');
    fprintf('taxa de compressao de world192.txt =  \n');
    disp(taxa_de_compressao );

    % taxa_de_compressao para watermark.cs 
    taxa_de_compressao = coder_evaluator('watermark.cs');
    fprintf('taxa de compressao de watermark.cs=  \n');
    disp(taxa_de_compressao);

    % histograma para random.txt
    taxa_de_compressao = coder_evaluator('random.txt');
    fprintf('taxa de compressao de random.txt=  \n');
    disp(taxa_de_compressao);

    % histograma para progc.c
    taxa_de_compressao = coder_evaluator('progc.c');
    fprintf('taxa de compressao de progc.c=  \n');
    disp(taxa_de_compressao);

    % histograma para Person.java
    taxa_de_compressao = coder_evaluator('Person.java');
    fprintf('taxa de compressao de Person.java=  \n');
    disp(taxa_de_compressao);

    % histograma para musica.mp3
    taxa_de_compressao = coder_evaluator('musica.mp3');
    fprintf('taxa de compressao de musica.mp3=  \n');
    disp(taxa_de_compressao);

    % histograma para lena.zip
    taxa_de_compressao = coder_evaluator('lena.zip ');
    fprintf('taxa de compressao de lena.zip =  \n');
    disp(taxa_de_compressao);

    % histograma para lena.JPG
    taxa_de_compressao = coder_evaluator('lena.JPG');
    fprintf('taxa de compressao de lena.JPG=  \n');
    disp(taxa_de_compressao);
    
    % histograma para lena.jp2
    taxa_de_compressao = coder_evaluator('lena.jp2');
    fprintf('taxa de compressao de lena.jp2=  \n');
    disp(taxa_de_compressao);

    % histograma para lena.gif
    taxa_de_compressao = coder_evaluator('lena.gif');
    fprintf('taxa de compressao de lena.gif=  \n');
    disp(taxa_de_compressao);

    % histograma para lena.bmp
    taxa_de_compressao = coder_evaluator('lena.bmp');
    fprintf('taxa de compressao de lena.bmp=  \n');
    disp(taxa_de_compressao);

    % histograma para legendas1.txt
    taxa_de_compressao = coder_evaluator('legendas1.txt');
    fprintf('taxa de compressao de legendas1.txt=  \n');
    disp(taxa_de_compressao);

    % histograma para cp.htm
    taxa_de_compressao = coder_evaluator('cp.htm');
    fprintf('taxa de compressao de cp.htm=  \n');
    disp(taxa_de_compressao);

    % histograma para arj241a.exe
    taxa_de_compressao = coder_evaluator('arj241a.exe');
    fprintf('taxa de compressao de arj241a.exe=  \n');
    disp(taxa_de_compressao);

    % histograma para alice29.txt
    taxa_de_compressao = coder_evaluator('alice29.txt');
    fprintf('taxa de compressao de alice29.txt= \n');
    disp(taxa_de_compressao);

end

disp('--- FIM ---');