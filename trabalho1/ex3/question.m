function [ num ] = question( )
    
    question = 'Deseja gerar quantas sequencias?';
    num=input(question);
    while num<0
        disp('N�o escolheu uma op��o valida');
        num=input(question);
    end

end

