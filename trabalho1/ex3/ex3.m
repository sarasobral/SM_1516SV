%--------------------------------------------------------------------------
% Nome do programa/fun��o: SM - Exerc�cio 3
% Objetivo: 
% Implemente uma fonte de s�mbolos com alfabeto e fun��o massa de 
% probabilidade (FMP) gen�ricos. As sequ�ncias produzidas pela fonte, com 
% dimens�o L, dever�o ser escritas num ficheiro de texto (uma sequ�ncia 
% por linha).
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
disp('Sistemas Multimedia - Exercicio 3')
disp('-----------------------------------------------------------------------');
disp('�NICIO');
disp(' ');

% validar quantas sequencias o utilizaor quer
num = question();

Fonte(num);

disp(' GEROU UM FICHEIRO test.txt --- FIM ---');