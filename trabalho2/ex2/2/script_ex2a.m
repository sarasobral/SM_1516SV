%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 2.a)
% Objetivo: 
% Para cada ficheiro/imagem, apresente uma tabela com a dimensão do 
% ficheiro gráfico e a entropia da imagem. Apresente o histograma de 
% cada imagem.
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
disp('ÍNICIO');
disp(' ');

pergunta = 'Deseja correr a função dim_H_hist.m, para todos ficheiro do conjunto grayscaleBMPImages.zip ou apenas para 1?';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'um') && ~strcmp(resposta,'todos')
    disp('Não escolheu uma opção valida. Tente "um" ou "todos"');
    resposta=input(pergunta,'s');
end

if(strcmp(resposta,'um'))
    
    pergunta = 'Escolha um ficheiro:';
    resposta=input(pergunta,'s');
    while ~strcmp(resposta,'squares.bmp') && ~strcmp(resposta,'safe.bmp') && ~strcmp(resposta,'lena.bmp') && ~strcmp(resposta,'finger.bmp') && ~strcmp(resposta,'face.bmp') && ~strcmp(resposta,'circles.bmp') && ~strcmp(resposta,'camera.bmp') && ~strcmp(resposta,'bird.bmp') 
        fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t world192.txt \n \t squares.bmp \n \t safe.bmp \n \t lena.bmp \n \t finger.bmp \n \t face.bmp \n \t circles.bmp \n \t camera.bmp \n \t bird.bmp \n');
        resposta=input(pergunta,'s');
    end
    
    [H,dim] = dim_H_hist(resposta);
    T = table(H,dim,'RowNames',{resposta})

else
    rowNames = {'squares.bmp';'safe.bmp';'lena.bmp';'finger.bmp';'face.bmp';'circles.bmp';'camera.bmp';'bird.bmp'};
    
    % entropia e dimensao do ficheiro squares.bmp
    [squaresH,dimSquares] = dim_H_hist('squares.bmp'); 

    % entropia e dimensao do ficheiro safe.bmp
    [safeH,dimSafe] = dim_H_hist('safe.bmp');

    % entropia e dimensao do ficheiro lena.bmp
    [lenaH,dimLena] = dim_H_hist('lena.bmp');

    % entropia e dimensao do ficheiro finger.bmp
    [fingerH,dimFinger] = dim_H_hist('finger.bmp');

    % entropia e dimensao do ficheiro face.bmp
    [faceH,dimFace] = dim_H_hist('face.bmp');

    % entropia e dimensao do ficheiro circles.bmp
    [circlesH,dimCircles] = dim_H_hist('circles.bmp');

    % entropia e dimensao do ficheiro camera.bmp
    [cameraH,dimCamera] = dim_H_hist('camera.bmp');

    % entropia e dimensao do ficheiro bird.bmp
    [birdH,dimBird] = dim_H_hist('bird.bmp');

    
    H={squaresH;safeH;lenaH;fingerH;faceH;circlesH;cameraH;birdH};
    dim={dimSquares;dimSafe;dimLena;dimFinger;dimFace;dimCircles;dimCamera;dimBird};
    T = table(H,dim,'RowNames',rowNames)

end

disp('--- FIM ---');
