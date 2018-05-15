% Calculate total loss
% dmatrix    =  csvread('dmatrix');
datasize   =  size(dmatrix,1);
lossSD2D   =  zeros(1, datasize);
lossSDteNB =  zeros(1, datasize);
lossSDreNB =  zeros(1, datasize);
lossTD2D   =  zeros(1, datasize);
lossTDteNB =  zeros(1, datasize);
lossTDreNB =  zeros(1, datasize);
d = zeros(1, 6);

%Start
for j = 1: datasize
    % read a line
    for i = 1:6
        d(i) = dmatrix(j,i);
    end
    lossSD2D(j)   =  calTPL(d(1), 1);
    lossSDteNB(j) =  calTPL(d(2), 0);
    lossSDreNB(j) =  calTPL(d(3), 0);
    lossTD2D(j)   =  calTPL(d(4), 1);
    lossTDteNB(j) =  calTPL(d(5), 0);
    lossTDreNB(j) =  calTPL(d(6), 0);
end

% claim a function here, to calculate six total losses
function [TPLdB] = calTPL(distance, flag)
    if flag == 0  % UE-eNB
        k1 = 34.0;
        k2 = 22.0;
        k3 = 30.5;
        k4 = 36.7;
    elseif flag == 1 %UE-UE
        k1 = 38.8;
        k2 = 16.9;
        k3 = 17.5;
        k4 = 43.3;
    end
    alpha = 0.8;
    dr = 0.01;
    dcorr = 50;
    sigma = 3;
    PLLdB = k1 + k2 * log10(distance);
    PLNdB = k3 + k4 * log10(distance);
    PLdB = alpha*PLLdB + (1-alpha)*PLNdB;
    PL = 10.^(0.1*PLdB);
    X = randn(1,1);
    R = exp((-0.01/dcorr)*log(2));
    k = round(distance / dr);
    Llast = 0;
    for l = 1:k
    SFdB = R*Llast + (1-R.^2).^0.5*sigma*X;
    Llast = SFdB;
    end
    SF = 10.^(0.1*SFdB);
    Y = rand(1,1);
    ML = -log(Y);
    % MLdB = 10*log10(ML);
    TPL = PL+SF+ML;
    TPLdB = 10*log10(TPL);
    % TPLdBm = 10*log10(TPL * 1000);
end