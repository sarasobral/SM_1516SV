function [ sequence ] = alfaNumericSequence( )

    if(nargin==0)
        L=24;
    end
    
    AZ09=['A':'Z' '0':'9'];
    
    % cria uma matrix com L zeros (evitamos erros de dimensoes)
    sequence=zeros(1,L);
    % a sequencia tera valores aleatorios referentes aos indices de AZ09
    for c=1:length(sequence)
        sequence(:,c) = randi([1,36]);
    end
    % idx = sequence[i]; AZ09[idx]
    sequence = AZ09(sequence);    
    
end

