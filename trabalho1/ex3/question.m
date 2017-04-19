function [ num ] = question( )
    
    question = 'Deseja gerar quantas sequencias?';
    num=input(question);
    while num<0
        disp('Não escolheu uma opção valida');
        num=input(question);
    end

end

