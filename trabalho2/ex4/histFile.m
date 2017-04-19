%
% ISEL - Instituto Superior de Engenharia de Lisboa.
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% SM - Sistemas Multimédia.
%
%
% histFile.m
% Funcao que mostra o histograma 1D de determinado ficheiro.
%
% Recebe:		filename    - nome do ficheiro de entrada.
%               nBins       - numero de pontos centrais do histograma.

function h = histFile( filename, nBins )
    if nargin==0
         filename = 'lena.bmp';
         nBins = 256;
    end
    % Read file to a vector.
    x = file2Vector(filename);
    % Check for the number of bins.
    if nargin==1
        % Use default (ASCII).
        nBins = [-128:1:127];
    end
    % Display histogram.
    figure;
    hist( x, nBins );
    h = hist( x, nBins );
    grid on; title(filename);
    return;




