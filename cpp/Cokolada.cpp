#include <iostream>

using namespace std;

const int maksimum = 1000000000;

int main() {

    long k;
    cin >> k;

    if (k > maksimum || k < 1) return 1;

    // int potega = ceil(log(k)/log(2));
    // int kostki = pow(2,potega);

    int kostki = 1;
    while (kostki < k){
        kostki <<= 1;
    }

    cout << kostki;

    // int suma_kostek = 0;
    int przelamania = 0;

    while (k > 0) {
        if (kostki <= k) {
            k -= kostki;
        }
        kostki /= 2;
        przelamania++;
    }

    /*
    while(suma_kostek < k){
        if(suma_kostek + kostki <= k){
            suma_kostek += kostki;
        } else {
            przelamania++;
            kostki /= 2;
        }
    }
    */

    cout << " " << przelamania - 1;
    return 0;
}
