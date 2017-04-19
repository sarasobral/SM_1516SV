% ISEL
%
% LEIC
%
% SM – Sistemas Multimédia
%
% file_entropy.m
% Recebe:
%       filename.
% Retorna:
%       entropy.

function H = file_entropy( filename )
    
    if nargin==0
         filename = 'cp.htm';
    end
    
    % Vector do histograma
    h=histFile(filename);

    % Cálculo das probabilidades
    p = h./sum(h);

    % Cálculo da entropia da fonte.
    log2p = log2(p);
    log2p(isinf(log2p)) = 0;
    H = -sum(p.*log2p);
    length(h);

end

