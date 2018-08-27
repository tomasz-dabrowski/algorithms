% Rysujemy histogramy dla wszystkich czterech parametrow (dane nieznormalizowane)

Wejsciowe = xlsread('normalizacja.xls','B3:E47'); % komorki danych wejsciowych

figure;
subplot(2,2,1);
histogram(Wejsciowe(:,1));
title('parametr1');
grid

subplot(2,2,2);
histogram(Wejsciowe(:,2));
title('parametr2');
grid

subplot(2,2,3);
histogram(Wejsciowe(:,3));
title('parametr3');
grid

subplot(2,2,4);
histogram(Wejsciowe(:,4));
title('parametr4');
grid

% 5. Wykresy przedstawiajace histogramy dla danych przed i po standaryzacji 

Standaryzowane = xlsread('normalizacja.xls','Q3:T47'); % komorki danych Standaryzowane

figure;
subplot(2,2,1);
histogram(Wejsciowe(:,1),6); % 6 przedzia³ow
hold on
histogram(Standaryzowane(:,1),6);
title('parametr1');
grid;

subplot(2,2,2);
histogram(Wejsciowe(:,2),6);
hold on
histogram(Standaryzowane(:,2),6);
title('parametr2');
grid;

subplot(2,2,3);
histogram(Wejsciowe(:,3),6);
hold on
histogram(Standaryzowane(:,3),6);
title('parametr3');
grid;

subplot(2,2,4);
histogram(Wejsciowe(:,4),6);
hold on
histogram(Standaryzowane(:,4),6);
title('parametr4');
grid;

% 8. Wykresy przedstawiajace histogramy dla danych surowych, 
% po standaryzacji i po przekszta³ceniu logarytmicznym

Zlogarytmowane = xlsread('normalizacja.xls','AK3:AN47'); % komorki danych zlogarytmowanych

figure;
subplot(2,2,1);
histogram(Wejsciowe(:,1),6);
hold on
histogram(Standaryzowane(:,1),6);
hold on
histogram(Zlogarytmowane(:,1),6);
title('parametr1');
grid;

subplot(2,2,2);
histogram(Wejsciowe(:,2),6);
hold on
histogram(Standaryzowane(:,2),6);
hold on
histogram(Zlogarytmowane(:,2),6);
title('parametr2');
grid;

subplot(2,2,3);
histogram(Wejsciowe(:,3),6);
hold on
histogram(Standaryzowane(:,3),6);
hold on
histogram(Zlogarytmowane(:,3),6);
title('parametr3');
grid;

subplot(2,2,4);
histogram(Wejsciowe(:,4),6);
hold on
histogram(Standaryzowane(:,4),6);
hold on
histogram(Zlogarytmowane(:,4),6);
title('parametr4');
grid;
