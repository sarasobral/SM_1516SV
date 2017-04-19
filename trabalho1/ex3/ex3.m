%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 3
% Objetivo: 
% Implemente uma fonte de símbolos com alfabeto e função massa de 
% probabilidade (FMP) genéricos. As sequências produzidas pela fonte, com 
% dimensão L, deverão ser escritas num ficheiro de texto (uma sequência 
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
disp('ÍNICIO');
disp(' ');

% validar quantas sequencias o utilizaor quer
num = question();

Fonte(num);

disp(' GEROU UM FICHEIRO test.txt --- FIM ---');