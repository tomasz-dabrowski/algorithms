% Generujemy rysunek z 3-ema wykresami (01.png)

% 1. Wykres funkcji f(x,y) = 2*x2 + 3*y3
% Krzywa na wykresie kolor czerwony, znaczniki w formie kwadratów

subplot(2,2,1)
x = 0:0.1:10; % [0-10] z przedzialami 0.1
y = -10:0.2:10; % [-10-10] zeby rozmiar sie zgadza³ z 0.2
z = 2 * x.^2 + 3 * y.^3; % z(x,y)
plot3(x,y,z,'rs') % red square bez wype³nienia
grid
title('Wykres 1')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')

% 2. Wykresy funkcji f(x,y) = sin(x) + cos(y) i f(x,y) = sin(4x) + cos(2y)
% Kolory krzywych: czerwony i niebieski, opisane

subplot(2,2,2)
x = 0:0.1:10;
y = -5:0.1:5;
z1 = sin(x) + cos(y);
plot3(x,y,z1,'r') % red

hold on % drugi wykres
z2 = sin(4*x) + cos(2*y);
plot3(x,y,z2,'b') % blue
grid
text(5,0,0,'sin(x)+cos(y)')
text(5,0,2,'sin(4x)+cos(2y)')
title('Wykres 2')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')

% 3. Wykresy funkcji jak w pkt. 2 ale krzywe zlozone z wypelnionych znacznikow

subplot(2,2,3)
x = 0:0.1:10;
y = -5:0.1:5;
z1 = sin(x) + cos(y);
plot3(x,y,z1,'cs','markerfacecolor','c') % cyan square bez linii, marker cyan
hold on
z2 = sin(4*x) + cos(2*y); 
plot3(x,y,z2,'bo','markerfacecolor','b') % j.w.  kolo blue
grid
grid minor % gestsza siatka
title('Wykres 3')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')
legend('sin(x) + cos(y)','sin(4*x) + cos(2*y)','Location','SouthEast')

% Generujemy rysunek, na którym znajduja sie 3 obrazy funkcji 
% f(x,y)=sin(3*sin(x2 + y2)) dla wartoœci x i y z zakresu od -1 do 1

clear
figure

% 1. w formie kolorowej powierzchni, dla osi x i y sformatowanych w zakresie od -2 do 2

subplot(2,2,1)
X = -1:0.1:1;
Y = -1:0.1:1;
[x,y] = meshgrid(X,Y); % tworzenie siatki
z1 = sin(3*sin(x.^2+y.^2));

surf(x,y,z1) % rysujemy kolorowa powierzchnie

xlim([-2 2]) % zakres x
ylim([-2 2]) % zakres y
title('sin(3*sin(x^2+y^2)) dla [-2; 2]')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')

% 2. kolorowa powierzchnia z uwzglednieniem odbicia swiatla i efektem cieniowania

subplot(2,2,2)
z2 = sin(3*sin(x.^2+y.^2));
surfl(x,y,z1) % kolorowa powierzchnia z uwzglednieniem odbicia swiatla
shading flat % cieniowanie
title('sin(3*sin(x^2+y^2)) odbicie i cieniowanie')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')

% 3. w formie siatki, ze slupkiem palety barw

subplot(2,2,3)
z3 = sin(3*sin(x.^2+y.^2));
mesh(x,y,z3) % rysujemy siatke powierzchni
colorbar % slupek palety barw
title('sin(3*sin(x^2+y^2)) siatka i slupek')
xlabel('Os X')
ylabel('Os Y')
zlabel('Os Z')
