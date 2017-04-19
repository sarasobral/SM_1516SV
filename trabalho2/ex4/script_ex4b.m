%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 4.b)
% Objetivo: 
% Recorrendo a um codificador/descodificador áudio MP3 ou MPEG4, apresente 
% para cada ficheiro áudio, as curvas de distorção (medida pela SNR) em 
% função da taxa de compressão (medida em bit por amostra). Para cada 
% ficheiro, indique a gama de valores de taxa de compressão, para a qual é 
% percetível a diferença auditiva, em relação ao ficheiro original.
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
disp('Sistemas Multimedia - Exercicio 4.b)')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');
disp(' ');

jpeg_demo('1.wav');
jpeg_demo('2.wav');
jpeg_demo('3.wav');
jpeg_demo('4.wav');


