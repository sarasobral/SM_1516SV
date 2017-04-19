%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 2.d)
% Objetivo: 
% dimensões dos ficheiros em formato vetorial e as dimensões do ficheiro 
% original
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
disp('Sistemas Multimedia - Exercicio 2.c)')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');
disp(' ');

pergunta = 'Escolha um ficheiro:';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'squares') && ~strcmp(resposta,'safe') && ~strcmp(resposta,'lena') && ~strcmp(resposta,'finger') && ~strcmp(resposta,'face') && ~strcmp(resposta,'circles') && ~strcmp(resposta,'camera') && ~strcmp(resposta,'bird') 
    fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t safe \n \t lena\n \t finger \n \t face \n \t circles\n \t camera \n \t bird \n');
    resposta=input(pergunta,'s');
end
ficheiroOriginal1 = strcat(resposta,'.bmp');
ficheiroPDF1 = strcat(resposta,'.pdf');

pergunta = 'Escolha um ficheiro:';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'squares') && ~strcmp(resposta,'safe') && ~strcmp(resposta,'lena') && ~strcmp(resposta,'finger') && ~strcmp(resposta,'face') && ~strcmp(resposta,'circles') && ~strcmp(resposta,'camera') && ~strcmp(resposta,'bird') 
    fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t safe \n \t lena\n \t finger \n \t face \n \t circles\n \t camera \n \t bird \n');
    resposta=input(pergunta,'s');
end
ficheiroOriginal2 = strcat(resposta,'.bmp');
ficheiroPDF2 = strcat(resposta,'.pdf');

% pergunta = 'Escolha um ficheiro:';
% ficheiroPDF1=input(pergunta,'s');
% while ~strcmp(ficheiroPDF1,'squares.pdf') && ~strcmp(ficheiroPDF1,'safe.pdf') && ~strcmp(ficheiroPDF1,'lena.pdf') && ~strcmp(ficheiroPDF1,'finger.pdf') && ~strcmp(ficheiroPDF1,'face.pdf') && ~strcmp(ficheiroPDF1,'circles.pdf') && ~strcmp(ficheiroPDF1,'camera.pdf') && ~strcmp(ficheiroPDF1,'bird.pdf') 
%     fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t safe.pdf \n \t lena.pdf\n \t finger.pdf \n \t face.pdf \n \t circles.pdf\n \t camera.pdf \n \t bird.pdf \n');
%     ficheiroPDF1=input(pergunta,'s');
% end
% ficheiroOriginal1 = imread(strcat(resposta,'.bmp'));
% ficheiroPDF1 = strcat(resposta,'.pdf');

% pergunta = 'Escolha um ficheiro:';
% ficheiroPDF2=input(pergunta,'s');
% while ~strcmp(ficheiroPDF2,'squares.pdf') && ~strcmp(ficheiroPDF2,'safe.pdf') && ~strcmp(ficheiroPDF2,'lena.pdf') && ~strcmp(ficheiroPDF2,'finger.pdf') && ~strcmp(ficheiroPDF2,'face.pdf') && ~strcmp(ficheiroPDF2,'circles.pdf') && ~strcmp(ficheiroPDF2,'camera.pdf') && ~strcmp(ficheiroPDF2,'bird.pdf') 
%     fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t safe.pdf \n \t lena.pdf\n \t finger.pdf \n \t face.pdf \n \t circles.pdf\n \t camera.pdf \n \t bird.pdf \n');
%     ficheiroPDF2=input(pergunta,'s');
% end
% ficheiroOriginal2 = imread(strcat(resposta,'.bmp'));
% ficheiroPDF2 = strcat(resposta,'.pdf');
% 
% imwrite(ficheiroOriginal1,ficheiroPDF1,'pdf');
% imwrite(ficheiroOriginal2,ficheiroPDF2,'pdf');

% ficheiro original1
d = dir(ficheiroOriginal1);
do1 = d.bytes;
% ficheiro original2
d = dir(ficheiroOriginal2);
do2 = d.bytes;

% ficheiro PDF1
d = dir(ficheiroPDF2);
dPDF1 = d.bytes;
% ficheiro PDF2
d = dir(ficheiroPDF2);
dPDF2 = d.bytes;

disp('--- FIM ---');