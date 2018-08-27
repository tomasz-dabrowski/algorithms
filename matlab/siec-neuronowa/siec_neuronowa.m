% 1. Wczytujemy plik analiza_skupien.xls

Dane = xlsread('analiza_skupien.xls'); 
A = Dane(:,1:8)'; % wczytujemy kolumny i transponujemy macierz 
B = A; % wektor testujacy

% deklaracja sieci o 8. wejsciach, parametry z przedzialu [0 1]
%net = newc([0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1], 4); % dla 4 klas
net = newc([0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1; 0 1], 8); % dla 8 klas

% ustawiamy liczbe epok uczenia
net.trainParam.epochs = 500;

% inicjalizacja wag
net = init(net);
% trenowanie wektorem A
net = train(net, A);

% testowanie wektorem B:
netwyn = sim(net, B);

% w netwyn1 s¹ numery grup dla kolejnych punktow z netwyn
netwyn1 = vec2ind(netwyn);
netwyn1 = netwyn1'; % zeby wkleic w pionie do tabeli