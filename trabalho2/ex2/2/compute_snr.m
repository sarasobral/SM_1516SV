function snr = compute_snr( I1, I2 )
    
    % Get dimensions.
    [ NRows1, NCols1 ] = size( I1 );
    [ NRows2, NCols2 ] = size( I2 );

    % See if dimensions agree.
    if (NRows1~=NRows2) | (NCols1~=NCols2)
       error(' Images have diferent sizes ');
    end

    % Compute MSE (mean square error)
    mse = sum(sum((double(I1)-double(I2)).^2)) / (NRows1*NCols1);

    % Compute the AC power.
    m = mean(mean(double(I1)));
    Iaux = double(I1)- m*ones( size(I1,1), size(I1,2) );
    Iaux = Iaux.^2;
    p_ac = sum(sum(Iaux)) / (NRows1*NCols1);

    % Compute the SNR.
    snr  = 10*log10( p_ac / mse );
    fprintf(' SNR = %.2f [dB]\n', snr );
end

