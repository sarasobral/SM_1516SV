%--------------------------------------------------------------------------
% Nome do programa/função: SM - Exercício 4.a)
% Objetivo: 
% Para cada ficheiro, apresente a respetiva dimensão, a frequência de 
% amostragem, o número de bits por amostra e a entropia do sinal áudio.
% Apresente o histograma de cada sinal áudio.
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
disp('Sistemas Multimedia - Exercicio 4.a)')
disp('-----------------------------------------------------------------------');
disp('ÍNICIO');
disp(' ');

pergunta = 'Deseja correr a função dim_H_hist.m, para todos ficheiro do conjunto audioFiles.zip ou apenas para 1?';
resposta=input(pergunta,'s');
while ~strcmp(resposta,'um') && ~strcmp(resposta,'todos')
    disp('Não escolheu uma opção valida. Tente "um" ou "todos"');
    resposta=input(pergunta,'s');
end

if(strcmp(resposta,'um'))
    
    pergunta = 'Escolha um ficheiro:';
    resposta=input(pergunta,'s');
    while ~strcmp(resposta,'1.wav') && ~strcmp(resposta,'2.wav') && ~strcmp(resposta,'3.wav') && ~strcmp(resposta,'4.wav')
        fprintf('Não escolheu uma ficheiro valido. Escolha um dos seguintes:\n \t 1.wav \n \t 2.wav \n \t 3.wav \n \t 4.wav \n');
        resposta=input(pergunta,'s');
    end
    
    [x,fs] = audioread(resposta);
    d = dir(resposta);
    do=d.bytes;
    info = audioinfo(resposta);
    bitsPerSample = info.BitsPerSample;
    H = bitsPerSample;
    
    % Vector do histograma
    hist(x,[min(x):0.01:max(x)]);
    
    T = table(do,fs,bitsPerSample,H,'RowNames',{resposta})

else
    rowNames = {'1.wav';'2.wav';'3.wav';'4.wav'};
    
    % 1.wav
    [x,fs1] = audioread('1.wav');
    d = dir('1.wav');
    do1=d.bytes;
    info = audioinfo('1.wav');
    bitsPerSample1 = info.BitsPerSample;
    H1 = bitsPerSample1;
    hist(x,[min(x):0.01:max(x)]);


    % 2.wav
    [x,fs2] = audioread('2.wav');
    d = dir('2.wav');
    do2=d.bytes;
    info = audioinfo('2.wav');
    bitsPerSample2 = info.BitsPerSample;
    H2 = bitsPerSample2;
    hist(x,[min(x):0.01:max(x)]);
    
    % 3.wav
    [x,fs3] = audioread('3.wav');
    d = dir('3.wav');
    do3=d.bytes;
    info = audioinfo('3.wav');
    bitsPerSample3 = info.BitsPerSample;
    H3 = bitsPerSample3;
    hist(x,[min(x):0.01:max(x)]);
    
    % 4.wav
    [x,fs4] = audioread('4.wav');
    d = dir('4.wav');
    do4=d.bytes;
    info = audioinfo('4.wav');
    bitsPerSample4 = info.BitsPerSample;
    H4 = bitsPerSample4;
    hist(x,[min(x):0.01:max(x)]);
    
    do={do1;do2;do3;do4};
    fs={fs1;fs2;fs3;fs4};
    bitsPerSample={bitsPerSample1;bitsPerSample2;bitsPerSample3;bitsPerSample4};
    H={H1;H2;H3;H4};

    T = table(do,fs,bitsPerSample,H,'RowNames',{'1.wav','2.wav','3.wav','4.wav'})

end

disp('--- FIM ---');
