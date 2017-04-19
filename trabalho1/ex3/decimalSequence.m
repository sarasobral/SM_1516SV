function [ sequence ] = decimalSequence( )
        
        if(nargin==0)
            L=8;
        end

        % matrix aleatoria com length=L 
        sequence = randi([0,9],1,L);
        
        first= rand;
        
        % hipoteses do primeiro valor, segundo a Lei de Benford
        if(first>= 0 && first<= 0.3)
            sequence(1)=1;
        elseif(first>= 0.301 && first<= 0.476)
            sequence(1)=2;        
        elseif(first>= 0.477 && first<= 0.601)
            sequence(1)=3;
        elseif(first>= 0.602 && first<= 0.698)
            sequence(1)=4;
        elseif(first>= 0.699 && first<= 0.777)
            sequence(1)=5;
        elseif(first>= 0.778 && first<= 0.844)
            sequence(1)=6;
        elseif(first>= 0.845 && first<= 0.902)
            sequence(1)=7;
        elseif(first>= 0.903 && first<= 0.953)
            sequence(1)=8;
        else
            sequence(1)=9;
        end

end

