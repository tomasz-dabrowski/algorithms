% Pobieramy dane zapisane w kolumnach A,D,E,F z pliku dane.xls

A(:, 1) = xlsread('dane.xls','A1:A30');
A(:, 2) = xlsread('dane.xls','D1:D30');
A(:, 3) = xlsread('dane.xls','E1:E30');
A(:, 4) = xlsread('dane.xls','F1:F30');

% Wykresy kolumn D, E i F w zale�no�ci od kolumny A (01.png)

a = A(:, 1);
d = A(:, 2);
e = A(:, 3);
f = A(:, 4);

plot(a,d,'bo-', a,e,'gd-', a,f,'r^-')
title('Wykres 2D')
xlabel('O� X')
ylabel('O� Y')
legend('Kolumna D','Kolumna E', 'Kolumna F', 'Location', 'SouthWest')
grid
axis([0 31 -380 300])

% Wykres schodkowy kolumn D, F w zale�no�ci od kolumny A (02.png)

figure
stairs(a,d,'r')
hold on
stairs(a,f,'g')
title('Wykres schodkowy')
xlabel('O� X')
ylabel('O� Y')
text(8,-30,'Wykres D(A)')
text(25,50,'Wykres F(A)')
grid
axis([0 31 -250 150])

% Wykres s�upkowy kolumn D, E, F w zale�no�ci od kolumny A (03.png)

figure
x = [d,e,f]; % przygotowanie macierzy
y = bar(a,x); % wykres s�upkowy x od a
set(y(1), 'FaceColor', 'm') % ustawienie koloru dla 1 slupka
set(y(2), 'FaceColor', 'b') % niebieski
set(y(3), 'FaceColor', 'g') % zielony

title('Wykres s�upkowy')
xlabel('Tytu� osi X')
ylabel('Tytu� osi Y')
legend('Kolumna D','Kolumna E', 'Kolumna F', 'Location','NorthWest') 
grid
axis([0 31 -250 300])

% Generujemy nast�puj�ce wykresy na jednym rysunku (04.png)

figure

% 1. Wykres w formie pr�bek kolumn D, F w zale�no�ci od kolumny A

subplot(2,2,1) % pierwsza �wiartka
stem(a,d,'b') % wykres D od A
hold on % na�� drugi wykres
stem(a,f,'r') % F od A
title('Wykres pr�bkowy')
xlabel('O� X')
ylabel('O� Y')
grid
axis([-1 32 -260 170])

% 2. Wykres s�upkowy kolumn D, E, F w zale�no�ci od kolumny A 

subplot(2,2,2) % druga �wiartka

bar(a,d,'b') % D od A
hold on % drugi wykres
bar(a,e,'g') % E od A
hold on % trzeci wykres
bar(a,f,'r') % F od A

% lub tak:
% b = bar(a,x); % x macierz [a d e f] przygotoana wcze�niej
% set(b(1), 'FaceColor', 'g')
% set(b(2), 'FaceColor', 'y')
% set(b(3), 'FaceColor', 'r')

title('Wykres s�upkowy')
xlabel('O� X')
ylabel('O� Y')
legend('Kolumna D','Kolumna E', 'Kolumna F', 'Location', 'NorthEast')
grid
ylim([-300 850]) % przesuni�cie wzgl�dem osi y

% 3. Wykres liniowy (znaczniki nie po��czone lini�) kolumny D od kolumny A

subplot(2,2,3) % trzecia �wiartka
plot(a,d,'bo','markerfacecolor','y')
title('Wykres liniowy znacznik�w')
xlabel('O� X')
ylabel('O� Y')
grid
axis([0 31 -250 50])

% Wykres liniowy kolumny F od A z pogrubion� lini�, bez znacznik�w (04.png)

subplot(2,2,4) % czwarta �wiartka
plot(a,f,'b-','linewidth',2)
title('Wykres liniowy 2')
xlabel('O� X')
ylabel('O� Y')
grid
axis([0 31 0 150])