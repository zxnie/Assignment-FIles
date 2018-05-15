% make sure your workspace have following variables:
% lossSD2D
% lossSDteNB
% lossSDreNB
% lossTD2D
% lossTDteNB
% lossTDreNB

% thresholds (in dB)
% thSD2D   =  ;

% counter of five modes
d2d      =  0;
cellular =  0;
waiting  =  0;
relay    =  0;
drop     =  0;

datasize =  size(dmatrix,1);

% 1
value = 100;
thSDteNB =  value;
thSDreNB =  value;
thTDreNB =  value;
results1 = zeros(1,451);

for thSD2D   =  50:500
    thTD2D = thSD2D;
    for k = 1:datasize
        if (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            d2d = d2d + 1;
        elseif (lossSD2D(k) > thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            cellular = cellular + 1;
        elseif (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) > thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            waiting = waiting + 1;
        elseif (lossSDteNB(k) > thSDteNB) && (lossTDteNB(k) > thSDteNB) && (lossTDreNB(k) <= thTDreNB) && (lossTD2D(k) <= thTD2D)
            relay = relay + 1;
        else
            drop = drop + 1;
        end
    end
    d2d = d2d / datasize;
    results1(thSD2D-49) = d2d;
end

% 1
value = 150;
thSDteNB =  value;
thSDreNB =  value;
thTDreNB =  value;
results2 = zeros(1,451);

for thSD2D   =  50:500
    thTD2D = thSD2D;
    for k = 1:datasize
        if (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            d2d = d2d + 1;
        elseif (lossSD2D(k) > thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            cellular = cellular + 1;
        elseif (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) > thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            waiting = waiting + 1;
        elseif (lossSDteNB(k) > thSDteNB) && (lossTDteNB(k) > thSDteNB) && (lossTDreNB(k) <= thTDreNB) && (lossTD2D(k) <= thTD2D)
            relay = relay + 1;
        else
            drop = drop + 1;
        end
    end
    d2d = d2d / datasize;
    results2(thSD2D-49) = d2d;
end

% 3
value = 200;
thSDteNB =  value;
thSDreNB =  value;
thTDreNB =  value;
results3 = zeros(1,451);

for thSD2D   =  50:500
    thTD2D = thSD2D;
    for k = 1:datasize
        if (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            d2d = d2d + 1;
        elseif (lossSD2D(k) > thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            cellular = cellular + 1;
        elseif (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) > thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            waiting = waiting + 1;
        elseif (lossSDteNB(k) > thSDteNB) && (lossTDteNB(k) > thSDteNB) && (lossTDreNB(k) <= thTDreNB) && (lossTD2D(k) <= thTD2D)
            relay = relay + 1;
        else
            drop = drop + 1;
        end
    end
    d2d = d2d / datasize;
    results3(thSD2D-49) = d2d;
end

% 4
value = 250;
thSDteNB =  value;
thSDreNB =  value;
thTDreNB =  value;
results4 = zeros(1,451);

for thSD2D   =  50:500
    thTD2D = thSD2D;
    for k = 1:datasize
        if (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            d2d = d2d + 1;
        elseif (lossSD2D(k) > thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            cellular = cellular + 1;
        elseif (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) > thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            waiting = waiting + 1;
        elseif (lossSDteNB(k) > thSDteNB) && (lossTDteNB(k) > thSDteNB) && (lossTDreNB(k) <= thTDreNB) && (lossTD2D(k) <= thTD2D)
            relay = relay + 1;
        else
            drop = drop + 1;
        end
    end
    d2d = d2d / datasize;
    results4(thSD2D-49) = d2d;
end

% 5
value = 300;
thSDteNB =  value;
thSDreNB =  value;
thTDreNB =  value;
results5 = zeros(1,451);

for thSD2D   =  50:500
    thTD2D = thSD2D;
    for k = 1:datasize
        if (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            d2d = d2d + 1;
        elseif (lossSD2D(k) > thSD2D) && (lossSDteNB(k) <= thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            cellular = cellular + 1;
        elseif (lossSD2D(k) <= thSD2D) && (lossSDteNB(k) > thSDteNB) && (lossSDreNB(k) <= thSDreNB)
            waiting = waiting + 1;
        elseif (lossSDteNB(k) > thSDteNB) && (lossTDteNB(k) > thSDteNB) && (lossTDreNB(k) <= thTDreNB) && (lossTD2D(k) <= thTD2D)
            relay = relay + 1;
        else
            drop = drop + 1;
        end
    end
    d2d = d2d / datasize;
    results5(thSD2D-49) = d2d;
end

x   =  50:500;
figure
plot(x,results1,'green',x,results2,'blue',x,results3,'red',x,results4,'magenta',x,results5,'black')
title('The selection situation of Threshold')
xlabel('D2D pair Threshold')
ylabel('Percentage of D2D mode')
legend('100',  '150',  '200',  '250',  '300')
