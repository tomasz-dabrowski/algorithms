#include <iostream>
#include <iomanip> // setprecision
#include <cmath> // pow
#include <chrono> // time

using namespace std;

// try to test for x = 1+1/n  (for ex. x=1.00000000001, n= 100000000000000)

long double fastPower(long double a, unsigned int n);
long double normalPower (long double a, unsigned int n);

int main() {
    using namespace std::chrono;

    long double exponent;
    unsigned int power;

    cout << "Enter exponent: ";
    cin >> exponent;
    cout << "Enter power: ";
    cin >> power;

    cout << setprecision(15);

    // time measuring
    high_resolution_clock::time_point start1 = high_resolution_clock::now();
    cout << endl << exponent << "^" << power << " = " << fastPower(exponent, power) << " (fast power)" << endl;
    high_resolution_clock::time_point end1 = high_resolution_clock::now();
    cout << "Time: " << chrono::duration_cast<chrono::microseconds>(end1-start1).count() << " microseconds" << endl;

    high_resolution_clock::time_point start2 = high_resolution_clock::now();
    cout << endl << exponent << "^" << power << " = " << pow(exponent, power) << " (cmath library power)" << endl;
    high_resolution_clock::time_point end2 = high_resolution_clock::now();
    cout << "Time: " << chrono::duration_cast<chrono::microseconds>(end2-start2).count() << " microseconds" << endl;

    high_resolution_clock::time_point start3 = high_resolution_clock::now();
    cout << endl << exponent << "^" << power << " = " << normalPower(exponent, power) << " (normal power)" << endl;
    high_resolution_clock::time_point end3 = high_resolution_clock::now();
    cout << "Time: " << chrono::duration_cast<chrono::microseconds>(end3-start3).count() << " microseconds" << endl;

    return 0;
}

long double fastPower(long double a1, unsigned int n1) {
    if (n1 == 0) return 1;
    if(n1%2 == 1) { // unpaired
        return a1 * fastPower(a1, n1-1);
    } else { // even
        long double w1 = fastPower(a1, n1/2);
        return w1 * w1;
    }
}

long double normalPower (long double a2, unsigned int n2) {
    long double w2=a2;
    for (int i = 0; i < n2 - 1; i++) {
        w2 *= a2;
    }
    return w2;
}
