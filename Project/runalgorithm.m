% make sure your workspace have following variables:
% lossSD2D
% lossSDteNB
% lossSDreNB
% lossTD2D
% lossTDteNB
% lossTDreNB

% thresholds (in dB)
value = 300;
thSD2D   =  80;
thSDteNB =  value;
thSDreNB =  value;
thTD2D   =  80;
thTDteNB =  value;
thTDreNB =  value;

% counter of five modes
d2d      =  0;
cellular =  0;
waiting  =  0;
relay    =  0;
drop     =  0;

datasize =  size(dmatrix,1);

% start
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

cellular = cellular / datasize;
d2d = d2d / datasize;
relay = relay / datasize;
waiting = waiting / datasize;
drop = drop / datasize;

figure;
c = categorical({'Cellular Mode','D2D Mode','Relay Mode','Call Waiting','Call Drop'});
c = reordercats(c,{'Cellular Mode' 'D2D Mode' 'Relay Mode' 'Call Waiting' 'Call Drop'});
values = [cellular d2d relay waiting drop];
bar(c,values)
title('Percentage of different modes');
