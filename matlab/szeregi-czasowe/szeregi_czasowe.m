% 2. Liczymy srednie roczne wartosci notowan wraz z odchyleniami standardowymi

WIG = xlsread('szeregi_czasowe.xls','B2:K254');

x = 2008:1:2017; % wektor lat
y = mean(WIG(:,1)); % srednia arytmetyczna dla kolumny 1.

for i = 2:10
    srednia = mean(WIG(:,i)); % kolejne wartosci srednich arytm.
    y = horzcat(y, srednia); % dodanie kolumny do istniejacego wektora
end

a = polyfit(x, y, 1); % wspolczynnik wielomianu
b = polyval(a, x); % wartosæ f-cji przyblizajacej
blad = abs(y - b); % modul roznicy pomiarow i wartosci f-cji przyblizajacej
B = [x, blad]; % zwiekszamy czytelnosæ bledu wg rosnacej wartosci
C = sortrows(B,1); % sortujemy wzgl. 1 kolumny

figure; % rysujemy
plot(x,y,'ro', x,b,'b-');
title('Srednie roczne notowania WIG');
xlabel('Rok');
ylabel('srednia');
legend('Wartosci wg lat', 'Linia regresji', 'Location', 'northwest');

% 3. Generujemy wykresy pudelkowe dla danych z kolejnych lat (na jednym wykresie)

figure;
boxplot(WIG, 'Labels', {'2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'})

% 4. Przedstawiamy na wykresach wyniki notowan z dowolnych pieciu lat 

figure;

subplot(5,1,1);
plot(WIG(:,6));
title('2013');

subplot(5,1,2);
plot(WIG(:,7));
title('2014');

subplot(5,1,3);
plot(WIG(:,8));
title('2015');

subplot(5,1,4);
plot(WIG(:,9));
title('2016');

subplot(5,1,5);
plot(WIG(:,10));
title('2017');
