function [ ] = Fonte( num )
    
    % se existir o ficheiro faz overwrite senao cria um novo
    fid = fopen('test.txt','wt');
    
    % gera num sequecias decimais L=8
    for row=1 : num
        fprintf(fid,'%i',decimalSequence());
        fprintf(fid,'\n');
    end
    
    % gera num sequecias alfanumericas L=24
    for row=1 : num
        fprintf(fid,'%s\n',alfaNumericSequence());
    end

    fclose(fid);

end

