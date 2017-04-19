%--------------------------------------------------------------------------
% Nome do programa/fun��o: SM - Exerc�cio 2.b)
% Objetivo: 
% Representa��o, para cada ficheiro/imagem, nos formatos GIF e PNG; 
% codificada com Huffman semiadaptativo e Aritm�tico semi-adaptativo;
%
% Autores: 
% Sara Sobral, 40602
% Renato Junior, 40682
% Eduardo Antonio, 40686
%          
% Data: 6-07-2016
%--------------------------------------------------------------------------

%Limpar dados anteriores e linha de comandos
clear
clc

disp('-----------------------------------------------------------------------');
disp('Sistemas Multimedia - Exercicio 2.b)')
disp('-----------------------------------------------------------------------');
disp('�NICIO');
disp(' ');

pergunta = 'Deseja correr a fun��o HSA_HASA_Cod.m, para todos ficheiro do conjunto grayscaleBMPImages.zip ou apenas para 1?';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'um') && ~strcmp(resposta,'todos')
    disp('N�o escolheu uma op��o valida. Tente "um" ou "todos"');
    resposta=input(pergunta,'s');
end

if(strcmp(resposta,'um'))
    
    pergunta = 'Escolha um ficheiro:';
    resposta=input(pergunta,'s');
    while ~strcmp(resposta,'squares.bmp') && ~strcmp(resposta,'safe.bmp') && ~strcmp(resposta,'lena.bmp') && ~strcmp(resposta,'finger.bmp') && ~strcmp(resposta,'face.bmp') && ~strcmp(resposta,'circles.bmp') && ~strcmp(resposta,'camera.bmp') && ~strcmp(resposta,'bird.bmp') 
        fprintf('N�o escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t world192.txt \n \t squares.bmp \n \t safe.bmp \n \t lena.bmp \n \t finger.bmp \n \t face.bmp \n \t circles.bmp \n \t camera.bmp \n \t bird.bmp \n');
        resposta=input(pergunta,'s');
    end
    [doHSA,dcHSA,doHASA,dcHASA] = HSA_HASA_Cod(resposta);
    T = table(doHSA,dcHSA,doHASA,dcHASA,'RowNames',{resposta})
else
    
    rowNames = {'squares.bmp';'safe.bmp';'lena.bmp';'finger.bmp';'face.bmp';'circles.bmp';'camera.bmp';'bird.bmp'};

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo squares.bmp
    [doHSAsquares,dcHSAsquares,doHASAsquares,dcHASAsquares] = HSA_HASA_Cod('squares.bmp'); 

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo safe.bmp
    [doHSAsafe,dcHSAsafe,doHASAsafe,dcHASAsafe] = HSA_HASA_Cod('safe.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo lena.bmp
    [doHSAlena,dcHSAlena,doHASAlena,dcHASAlena] = HSA_HASA_Cod('lena.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo finger.bmp
    [doHSAfinger,dcHSAfinger,doHASAfinger,dcHASAfinger] = HSA_HASA_Cod('finger.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo face.bmp
    [doHSAface,dcHSAface,doHASAface,dcHASAface] = HSA_HASA_Cod('face.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo circles.bmp
    [doHSAcircles,dcHSAcircles,doHASAcircles,dcHASAcircles] = HSA_HASA_Cod('circles.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo camera.bmp
    [doHSAcamera,dcHSAcamera,doHASAcamera,dcHASAcamera] = HSA_HASA_Cod('camera.bmp');

    % Codifica��o com Huffman semiadaptativo e Aritm�tico semi-adaptativo bird.bmp
    [doHSAbird,dcHSAbird,doHASAbird,dcHASAbird] = HSA_HASA_Cod('bird.bmp');
    
    doHSA={doHSAsquares;doHSAsafe;doHSAlena;doHSAfinger;doHSAface;doHSAcircles;doHSAcamera;doHSAbird};
    dcHSA={dcHSAsquares;dcHSAsafe;dcHSAlena;dcHSAfinger;dcHSAface;dcHSAcircles;dcHSAcamera;dcHSAbird};
    doHASA={doHASAsquares;doHASAsafe;doHASAlena;doHASAfinger;doHASAface;doHASAcircles;doHASAcamera;doHASAbird};
    dcHASA={dcHASAsquares;dcHASAsafe;dcHASAlena;dcHASAfinger;dcHASAface;dcHASAcircles;dcHASAcamera;dcHASAbird};

    T = table(doHSA,dcHSA,doHASA,dcHASA,'RowNames',rowNames)
end

disp('--- FIM ---');