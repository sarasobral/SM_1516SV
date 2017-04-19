%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 2.c)
% Objetivo: 
% Repita a alínea anterior, considerando agora os formatos com perda JPEG 
% e JPEG2000, com três níveis de perda.
% Determine a taxa de compressão e a relação sinal-ruído, SNR-Signal to 
% Noise Ratio, entre a imagem original e a descodificada.
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
imagemOriginal = imread(strcat(resposta,'.bmp'));
d=dir(strcat(resposta,'.bmp'));
do=d.bytes;
% fid = fopen( strcat(resposta,'.bmp'), 'rb' );
% y = fread( fid, Inf, 'uint8' );

pergunta = 'Escolha um formato:';
formato=input(pergunta,'s');
while ~strcmp(formato,'jpg') && ~strcmp(formato,'jp2')
    fprintf('Não escolheu uma formato valido. Escolha jpg ou jp2');
    formato=input(pergunta,'s');
end

imagemDescodificada70 = strcat(resposta,'70.',formato);
imagemDescodificada60 = strcat(resposta,'60.',formato);
imagemDescodificada50 = strcat(resposta,'50.',formato);    
% quality: A number between 0 and 100; higher numbers mean higher quality 
% (less image degradation due to compression), but the resulting file size is larger.
% lossy(deafult)

if (strcmp(formato,'jpg'))
    imwrite(imagemOriginal,imagemDescodificada70,formato,'Quality',70);
    imwrite(imagemOriginal,imagemDescodificada60,formato,'Quality',60);
    imwrite(imagemOriginal,imagemDescodificada50,formato,'Quality',50);
else
    imwrite(imagemOriginal,imagemDescodificada70,formato,'CompressionRatio',7);
    imwrite(imagemOriginal,imagemDescodificada60,formato,'CompressionRatio',6);
    imwrite(imagemOriginal,imagemDescodificada50,formato,'CompressionRatio',5);
end

% TAXA DE COMPRESSAO
tx70 = taxa_de_compressao(do,imagemDescodificada70);
tx60 = taxa_de_compressao(do,imagemDescodificada60);
tx50 = taxa_de_compressao(do,imagemDescodificada50);

snr70 = compute_snr( imagemOriginal, imread(imagemDescodificada70));
snr60 = compute_snr( imagemOriginal, imread(imagemDescodificada60));
snr50 = compute_snr( imagemOriginal, imread(imagemDescodificada50));

taxa_de_compressao = {tx70;tx60;tx50};
snr = {snr70;snr60;snr50};
rowNames = {imagemDescodificada70;imagemDescodificada60;imagemDescodificada50};
T = table(taxa_de_compressao,snr,'RowNames',rowNames)
disp(' ');
disp('--- FIM ---');