// jest to klasyczny algorytm wyszukiwania maksymalnego palindromu w stringu
// najszybszy jest algorytm Manachera O(n)

#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

const int maxchar = 2000;

int main() {
    string s;
    cin >> s;
    int wynik = 0;
    int N =  s.size(); // dl. slowa
    if (N > maxchar) return 1;
    if (N == 0) wynik = 0;
    if (N == 1) wynik = 1;

    char znak; // spr. male litery
    for(int i=0; i<N; i++) {
    znak = s[i];
        if ((znak <= 96) || (znak >= 123)) return 1;
    }
    //cout << s << endl;

    int **tablica = new int *[2];
    for(int i = 0; i <= N; i++) tablica[i] = new int [N+1];
    // tablica[0..] rodzaj palindromu {parzysty, nieparzysty}
    // tablica[1..] zawiera indeksy

    int i; // indeksy srodkow palindromow
    int j; // {0,1} 0-parzyste, 1-nieparzyste
    int rp; // promien max. palindromu na pozycji i-tej
    int k; // k- zm do indeksowania srodkow promieni poprzedzajacych pozycje i-ta

    s = "!" + s + "!!"; // na poczatku i na koncu slowa ustawiamy wartowniki

    for(j = 0; j <= 1; j++) { // promienie dla parzystych i nieparzystych
        tablica[j][0] = rp = 0; i = 1; // pierwszy promien zerowy, i na pierwszym znaku slowa
        while(i <= N) { // przechodzimy przez kolejne srodki palindromow
            while(s[i - rp - 1] == s[i + j + rp]) rp++; // promien max. palindromu o srodku na i-tej pozycji
            tablica[j][i] = rp; // zapamietujemy promien

            // przegladamy promienie palindromow wewnetrznych
            k = 1;
            while((tablica[j][i - k] != rp - k) && (k < rp)) { // dopoki jestesmy wewnatrz
                tablica[j][i + k] = min(tablica[j][i - k],rp - k); // wyznaczamy promien lustrzanego palindromu wewnetrznego
                //cout << tablica[j][i + k];
                k++; // idziemy do nastepnego palindromu wewnetrznego
            }
            rp = max(rp - k,0); // promien poczatkowy palindromu
            i += k; // pomijamy palindromy lustrzane
        }
    }

    s = s.substr(1,N); // usuwamy w1 i w2 z lancucha

    // szukamy max

    for(i = 1; i <= N; i++) { // przechodzimy tablice
        for(j = 0; j <= 1; j++) { // dla parzystych i nieparzystych
            for(rp = tablica[j][i]; rp > 0; rp--) { // i po kolejnych promieniach
                for(k = 1; k < i - rp; k++) cout << " ";
                cout << s.substr(i - rp - 1,2 * rp + j) << endl;
                    if (wynik < 2 * rp + j) wynik = 2 * rp + j; // zapisujemy max
            }
        }
    }
  cout << wynik;
  return 0;
}
