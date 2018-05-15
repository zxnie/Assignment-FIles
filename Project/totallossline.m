k1 = 34.0;
k2 = 22.0;
k3 = 30.5;
k4 = 36.7;
dr = 0.01;
d = 1:0.1:100;
PLLdB = k1 + k2 * log10(d);
PLNdB = k3 + k4 * log10(d);
PLdB = 0.8*PLLdB + 0.2*PLNdB;
PL = 10.^(0.1*PLdB);
X = randn(1,991);
R = exp((-0.01/50)*log(2));
i = round(d / dr);
Llast = 0;
for j = 1:i
    SFdB = R*Llast + (1-R.^2).^0.5*3*X;
    Llast = SFdB;
end
SF = 10.^(0.1*SFdB);
Y = rand(1,991);
ML = -log(Y);
MLdB = 10*log10(ML);
TPL = PL+SF+ML;
TPLdB = 10*log10(TPL);
TPLdBm = 10*log10(TPL * 1000);
figure;
plot(d,TPLdB);
title('Total path loss');
xlabel('Distance between D2D Tx. and eNB(m)')
ylabel('Total path loss(dB)')