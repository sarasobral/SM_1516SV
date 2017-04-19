%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% jpeg_demo.m
% Avaliar o efeito do fator de qualidade sobre imagens JPEG.
%

function jpeg_demo(filename)

%close all;

% Ler o audio para memoria
%I = imread('cameraman.tif');
[I,fs] = audioread(filename);
d = dir(filename);
do = d.bytes;
%I = imread('saturn.tiff');
nomes={'quality96','quality128','quality160','quality192'};
Quality = [96,128,160,192];
snr = zeros(1, length(Quality));
for i=1 : length(Quality)
    
%     figure(1);
    q = Quality(i);
    fprintf('\n Bit Rate %d  -> ', q ); 
    nome = strcat(filename, nomes{1,i},'.mp4');
    audiowrite(nome,I,fs,'BitRate',q);
    [Id,fs] = audioread(nome) 
    d = dir(strcat(nome));
    dc = d.bytes;
    rc=dc/do;
    Quality(i)=rc*16;
    Id=Id(1:size(I,1),:);
    snr(i) = compute_snr( I, Id );
%     subplot(121); imshow(I);
%     subplot(122); imshow(Id); title( ['taxa de compressao= ' num2str(q),...
%         '; SNR= ' sprintf(' %.2f dB',snr(i))]);
    
    pause(5)
end
 
figure;
plot( Quality, snr ); grid on;
xlabel(' taxa de compressao ');
ylabel(' SNR [dB] ');


return

%
% compute_snr 
%
function snr = compute_snr( I1, I2 )
    
% Get dimensions.
[ NRows1, NCols1 ] = size( I1 );
[ NRows2, NCols2 ] = size( I2 );

% See if dimensions agree.
if (NRows1~=NRows2) | (NCols1~=NCols2)
   error(' Images have diferent sizes ');
end

% Compute MSE
mse = sum(sum((double(I1)-double(I2)).^2)) / (NRows1*NCols1);

% Compute the AC power.
m = mean(mean(double(I1)));
Iaux = double(I1)- m*ones( size(I1,1), size(I1,2) );
Iaux = Iaux.^2;
p_ac = sum(sum(Iaux)) / (NRows1*NCols1);

% Compute the SNR.
snr  = 10*log10( p_ac / mse );
fprintf(' SNR = %.2f [dB]', snr );

return

