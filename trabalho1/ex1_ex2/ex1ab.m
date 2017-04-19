%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 1.a) e 1.b)
% Objetivo: 
% Obter os histogramas para cada ficheiro do conjunto testFilesSM.zip
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
disp('Sistemas Multimedia - Exercicio 1.a) e 1.b)')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');
disp(' ');

% histograma para world192.txt 
h = file_entropy('world192.txt');
fprintf('H de world192.txt = %f bit/simb\n',h);

% histograma para watermark.cs 
h = file_entropy('watermark.cs');
fprintf('H de watermark.cs = %f bit/simb\n',h);

% histograma para random.txt
h = file_entropy('random.txt');
fprintf('H de random.txt = %f bit/simb\n',h);

% histograma para progc.c
h = file_entropy('progc.c');
fprintf('H de progc.c = %f bit/simb\n',h);

% histograma para Person.java
h = file_entropy('Person.java');
fprintf('H de Person.java = %f bit/simb\n',h);

% histograma para musica.mp3
h = file_entropy('musica.mp3');
fprintf('H de musica.mp3 = %f bit/simb\n',h);

% histograma para lena.zip
h = file_entropy('lena.zip');
fprintf('H de lena.zip = %f bit/simb\n',h);

% histograma para lena.JPG
h = file_entropy('lena.JPG');
fprintf('H de lena.JPG = %f bit/simb\n',h);

% histograma para lena.jp2
h = file_entropy('lena.jp2');
fprintf('H de lena.jp2 = %f bit/simb\n',h);

% histograma para lena.gif
h = file_entropy('lena.gif');
fprintf('H de lena.gif = %f bit/simb\n',h);

% histograma para lena.bmp
h = file_entropy('lena.bmp');
fprintf('H de lena.bmp = %f bit/simb\n',h);

% histograma para legendas1.txt
h = file_entropy('legendas1.txt');
fprintf('H de legendas1.txt = %f bit/simb\n',h);

% histograma para cp.htm
h = file_entropy('cp.htm');
fprintf('H de cp.htm = %f bit/simb\n',h);

% histograma para arj241a.exe
h = file_entropy('arj241a.exe');
fprintf('H de arj241a.exe = %f bit/simb \n',h);

% histograma para alice29.txt
h = file_entropy('alice29.txt');
fprintf('H de alice29.txt = %f bit/simb\n',h);

disp('--- FIM ---');