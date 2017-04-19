%
% ISEL - Instituto Superior de Engenharia de Lisboa.
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
% SM - Sistemas Multim�dia.
%
%
% file2Vector.m
% Fun�ao que l� o conte�do de um ficheiro e o coloca num vector.
%
% Recebe:		filename    - nome do ficheiro.
% Retorna:      y           - vector com o conteudo do ficheiro.             

function y = file2Vector(filename)
    if nargin==0
         filename = 'cp.htm';
    end
    % Open file.
    fid = fopen( filename, 'rb' );

    % Check descriptor.
    if -1==fid
        error( sprintf('Error opening file %s for reading',filename) );
    end

    % Read entire file to a vector.
    y = fread( fid, Inf, 'uchar' );

    % Close file.
    fclose( fid );

    return;
