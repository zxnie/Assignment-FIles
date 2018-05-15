% Read file and show the path
data = csvread('matrix100');
datasize = size(data,1);
% increase Zs
z = rand(datasize,1);
z = z * 20; %
data(:,3) = data(:,3) * 10 + z;
% plot the path and important positions
comet3(data(:,1),data(:,2),data(:,3));
plot3(data(:,1),data(:,2),data(:,3));
title('The model of Random Waypoint')
axis ([0 100 0 100 0 100]);
grid on;
text(15, 35, 25, 'o', 'color' ,'red');      % cellular user
text(40, 50, 60, 'o', 'color' ,'blue');     % D2D user
text(80, 15, 10, 'o', 'color' ,'green');    % source eNB
text(20, 80, 20, 'o', 'color' ,'black');	% target eNB

% calculate distances
Cu   =  [15 35 25];
Dr   =  [40 50 60];
SeNB =  [80 15 10];
TeNB =  [20 80 20];
dmatrix = zeros(datasize,6);
% Calculate distance between D2D pairs
for i = 1: datasize
    dmatrix(i,1) = ((data(i,1) - Dr(1)).^2 + (data(i,2) - Dr(2)).^2 + (data(i,3) - Dr(3)).^2).^0.5;
end
% Distance between D2D transmitter and Source eNB
for i = 1: datasize
    dmatrix(i,2) = ((data(i,1) - SeNB(1)).^2 + (data(i,2) - SeNB(2)).^2 + (data(i,3) - SeNB(3)).^2).^0.5;
end
% Distance between D2D receiver and Source eNB
for i = 1: datasize
    dmatrix(i,3) = ((Dr(1) - SeNB(1)).^2 + (Dr(2) - SeNB(2)).^2 + (Dr(3) - SeNB(3)).^2).^0.5;
end
% Distance between D2D pairs
for i = 1: datasize
    dmatrix(i,4) = ((data(i,1) - Dr(1)).^2 + (data(i,2) - Dr(2)).^2 + (data(i,3) - Dr(3)).^2).^0.5;
end
% Distance between D2D transmitter and Target eNB
for i = 1: datasize
    dmatrix(i,5) = ((data(i,1) - TeNB(1)).^2 + (data(i,2) - TeNB(2)).^2 + (data(i,3) - TeNB(3)).^2).^0.5;
end
% Distance between D2D receiver and Source eNB
for i = 1: datasize
    dmatrix(i,6) = ((Dr(1) - TeNB(1)).^2 + (Dr(2) - TeNB(2)).^2 + (Dr(3) - TeNB(3)).^2).^0.5;
end