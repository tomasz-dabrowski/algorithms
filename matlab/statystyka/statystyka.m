% 1. Pobieramy dane zapisane w pliku dane.xls i zapisujemy do macierzy A

A = xlsread('dane.xls','A1:C25');

% 2. Liczymy dla kazdej kolumny macierzy A nastepujace parametry:

% a) srednia arytmetyczna

% srArytmKol1 = mean(A(:,1));
% srArytmKol2 = mean(A(:,2));
% srArytmKol3 = mean(A(:,3));

mean(A) % pokaz wszystkie w 1 wierszu

% ----------------------------
% b) mediane

% medianaKol1 = quantile(A(:,1),.50)
% medianaKol2 = quantile(A(:,2),.50) 
% medianaKol3 = quantile(A(:,3),.50) 

quantile(A,.50) % pokaz wszystkie w 1 wierszu

% ----------------------------
% c) kwantyl pierwszy i trzeci

quantile(A,[.25 .75]) % 1. wiersz = kwadryl I;  2 wiersz = kwadryl III

% ----------------------------
% d) wariancje

var(A)

% ----------------------------
% e) odchylenie standardowe

std(A)

% ----------------------------
% f) skosnosc

skewness(A)

% KOMENTARZ
% Skosnosc okresla asymetrie rozkladu zmiennej wokol sredniej.
% Dla I kolumny jej wartosc = 0 czyli wystepuje brak asymetrii rozkladu,
% rozklad jest "normalny" => wsp. rozkladu jest idealnie symetryczny wzgl. punktu 2.4

% Dla II kolumny wartosc jest < 0
% co swiadczy, ze rozklad jest lewoskosny (ujemnoskosny)
% lewe ramie rozkladu jest dluzsze od prawego, jednak w nieznaczny sposob
% (wartosc bezwzgledna skosnosci jest mala ~0,02)

% Dla III kolumny wartosc jest > 0,
% co swiadczy, ze rozklad jest prawoskosny (dodatnioskosny)
% prawe ramie rozkladu jest dluzsze od lewego w sposob znaczny
% (wartosc bezwzgledna skosnosci jest wzglednie duza ~1,23)

% ----------------------------
% g) kurtoze

kurtosis(A)

% KOMENTARZ
% Kurtoza to miara zageszczenia (koncentracji) wynikow wokol wartosci centralnej. 
% Podobnie jak skosnosci jest miara ksztaltu rozkladu. 
% Kurtoza w rozkladzie normalnym przyjmuje wartosc "0"
% We wszystkich trzech kolumnach wartosc kurtozy jest wieksza od zera,
% zatem mamy do czynienia z rozkladem leptokurtycznym (wysmuklym), przy
% czym w kolumnie III wartosc / wychylenie jest najwieksze

% ------------------------------------------------------------------------
% 3. Zaleznosc drugiej i trzeciej kolumny macierzy A od kolumny pierwszej na odrebnych wykresach punktowych

a = A(:, 1);
b = A(:, 2);
c = A(:, 3);

figure 
plot(a,b,'bo')
title('Zaleznosc kolumny B od A')
xlabel('Kolumna A')
ylabel('Kolumna B')
grid

figure
plot(a,c,'ro')
title('Zaleznosc kolumny C od A')
xlabel('Kolumna A')
ylabel('Kolumna C')
grid

% ------------------------------------------------------------------------
% 4 - Wspolczynniki korelacji liniowej Pearsona dla danych 
% z poszczegolnych kolumn macierzy A

corr(A)

%  [ 1.0000    0.9995    0.8837 ]
%  [ 0.9995    1.0000    0.8805 ]
%  [ 0.8837    0.8805    1.0000 ]

% KOMENTARZ: 
% Wspolczynnik korelacji macierzy to liczba, okreslajaca w jakim stopniu zmienne sa wspolzalezne.
% Glowna przekatna macierzy ma wartosc 1 => ta sama liczba jest od siebie calkowicie zalezna
% Maciez jest symetryczna => korelacja jest przemienna
% W naszej macierzy korelacji liniowej widzimy, ze dane z poszczegolnych
% kolumn sa od siebie silnie zalezne dodatnio, tj. gdy rosnie wartosc kolumny X 
% to rosnie tez wartosc kolumny Y. 
% Zauwazamy ponadto b. silna zaleznosc kolumny I od kolumny II (0,9995)

% ------------------------------------------------------------------------
% 5 - Regresja liniowa dla danych z kolumny pierwszej i drugiej macierzy A. 
% Przedstawiamy na jednym rysunku:
% - dane oryginalne w formie wykresu punktowego i linie regresji
% - wykres bledu przyblizenia

a = polyfit(A(:,1),A(:,2), 1); % a = 5.0035  12.1111
% tzn. dane mozna przyblizyc f-cja: y = 5.0035 x + 12.1111

p = polyval(a,A(:,1)); % wyznaczenie wartosci f-cji przyblizajacej dla 1. kolumny

figure
% rysujemy dane doswiadczalne i f-cje aproksymujaca
subplot(1,2,1) % pierwsza polowka planszy
plot(A(:,1),A(:,2),'bo', A(:,1),p,'r-')
title('Aproksymacja liniowa')
xlabel('Kolumna A')
ylabel('Kolumna B')
grid

% rysujemy blad aproksymacji liniowej
blad = abs(A(:,2) - p); % modul roznicy pomiarow i wartosci f-cji przyblizajacej
B = [A(:,1),blad]; % zwiekszamy czytelnosc bledu wg rosnacej wartosci
C = sortrows(B,1); % sortujemy wzgl. I kolumny

% przedstawiamy dane na wykresie
subplot(1,2,2) % druga polowka planszy
plot(C(:,1),C(:,2),'b-')
title('Blad aproksymacji liniowej')
xlabel('Kolumna A')
ylabel('Blad')
grid

% ------------------------------------------------------------------------
% 6 - Aproksymacja wielomianem 2 i 3 rzedu dla danych 
% z kolumny pierwszej i trzeciej macierzy A. Przedstawiamy na jednym rysunku:
% - dane oryginalne w formie wykresu punktowego i krzywe przyblizajace
% - wykres bledu przyblizenia wielomianem 2 i 3 rzedu

figure
a2 = polyfit(A(:,1),A(:,3), 2); % wyznaczamy f-cje 2-go stopnia
p2  = polyval(a2, A(:,1)); % wartosci f-cji przyblizajacej dla 1. kolumny

a3 = polyfit(A(:,1),A(:,3), 3); % wyznaczamy f-cje 3-go stopnia
p3 = polyval(a3, A(:,1)); % wartosci f-cji przyblizajacej dla 1. kolumny

% rysujemy aproksymacje
subplot(1,2,1) % pierwsza polowka planszy
plot(A(:,1),A(:,3),'bo', A(:,1), p2,'r-',A(:,1), p3,'g-')
title('Aproksymacja wielomianem wyzszego stopnia')
xlabel('Kolumna A')
ylabel('Kolumna C')
legend('Funkcja oryginalna', 'Wielomian 2 stopnia', 'Wielomian 3 stopnia', 'Location', 'northwest')
grid

% obliczamy blad aproksymacji liniowej dla wielomianu 2-go stopnia
blad2 = abs(A(:,3) - p2); % j.w. dla p2
B2 = [A(:,1),blad2]; % j.w. zwiekszamy czytelnosc
C2 = sortrows(B2,1); % sortujemy wzgl. I kolumny

% obliczamy blad aproksymacji liniowej dla wielomianu 3-go stopnia
blad3 = abs(A(:,3) - p3); % j.w. dla p3
B3 = [A(:,1),blad3]; % j.w. zwiekszamy czytelnosc
C3 = sortrows(B3,1); % sortujemy wzgl. I kolumny

% rysujemy bledy
subplot(1,2,2) % druga polowka planszy
plot(C2(:,1),C2(:,2),'b-', C3(:,1),C3(:,2),'r-') % j.w. dla 2-go i 3-go stopnia
title('Blad aproksymacji liniowej')
xlabel('Kolumna A')
ylabel('Blad')
legend('Wielomian 2 stopnia', 'Wielomian 3 stopnia', 'Location', 'northwest')
grid