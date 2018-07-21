#include <iostream>
#include <sstream> // strumienie lanuchowe
#include <iomanip>
#include <string>
#include <cstdlib>

using namespace std;

const int ROZMIAR_STOSU = 100;

int main() {
  double S[ROZMIAR_STOSU]; // stos
  int p = 0; // wskaznik S
  string element; // kolejny element ONP
  double v1, v2; // argumenty operacji
  stringstream strumien; // strumien lancuchowy

  while (true) {
    getline(cin,element); // pobierz nastepny element

    if(e == "=") break; // koniec wyrazenia

    strumien.str(""); // usuwamy wszelki tekst ze strumienia
    strumien.clear(); // czyscimy bledy konwersji z poprzednich wywolan
    strumien << element; // odczytany element umieszczamy w strumieniu

    if (strumien >> v1) // konwertujemy na liczbe i sprawdzamy, czy nie bylo bledu
      S[p++] = v1;
    else {  // operator
      v2 = S[--p]; // pobieramy ze stosu dwa argumenty
      v1 = S[--p];

      v1 += v2; // dodawanie

      switch(e[0]) { // operacje wg operatora
        case '+' : v1 += v2; break;
        case '-' : v1 -= v2; break;
        case '*' : v1 *= v2; break;
        case '/' : v1 /= v2; break;
        //case '^' : v1 = pow(v1, v2); break;
      }

      S[p++] = v1; // wynik na stos
    }
  }

  cout << fixed << S[--p] << endl; // wypisujemy wynik ze szczytu stosu

  return 0;
}
