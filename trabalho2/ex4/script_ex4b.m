%--------------------------------------------------------------------------
% Nome do programa/fun��o: SM - Exerc�cio 4.b)
% Objetivo: 
% Recorrendo a um codificador/descodificador �udio MP3 ou MPEG4, apresente 
% para cada ficheiro �udio, as curvas de distor��o (medida pela SNR) em 
% fun��o da taxa de compress�o (medida em bit por amostra). Para cada 
% ficheiro, indique a gama de valores de taxa de compress�o, para a qual � 
% percet�vel a diferen�a auditiva, em rela��o ao ficheiro original.
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
disp('�NICIO');
disp(' ');

jpeg_demo('1.wav');
jpeg_demo('2.wav');
jpeg_demo('3.wav');
jpeg_demo('4.wav');


