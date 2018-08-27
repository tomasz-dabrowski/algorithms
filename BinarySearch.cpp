#include<iostream>

using namespace std;
const int maksimum = 1000000;

int wskaznik(int x, int *tab2, int ip, int ik) {
    
    while (ip != ik) {

        int isr = (ip + ik) / 2;

        if (tab2[isr] < x)
            ip  = isr + 1;
        else
            ik = isr;
    }

    if (tab2[ip] >= x) return ip;
    return ip + 1;
}

int main() {
    int n, m, ik;

    cin >> n;
    if (n > maksimum || n < 1) return 1;

    int *tab1;
    tab1 = new int [n];

    for (int i=0; i<n; i++) {
        cin >> tab1[i];
    }

    cin >> m;

    if (m > maksimum || n < 1) return 1;

    for (int j=0; j<m; j++) {
        cin >> ik;
        cout << n - wskaznik(ik, tab1, 0, n-1) << " ";
    }
    return 0;
}
