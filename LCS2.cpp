#include <iostream>
#include <string>

using namespace std;

int main() {
    string a, b, LCS2;
    const int maxchar = 1000;
    int ** r;

    cin >> a >> b;

    if (a.size() > maxchar || b.size() > maxchar) return 1;

    int m  = a.length(); int n  = b.length();

    r = new int * [n + 1]; // dynamic array for rows
    for(int i = 0; i <= n; i++) {
        r[i] = new int[m + 1]; // dyn. array for columns
    }

    //int r[n+1][m+1];

    // reset first row / column
    for (int i=0; i<= n; i++) r[i][0] = 0;
    for (int j=0; j<=m; j++) r[0][j] = 0;

    // fill the array
    for (int i=1; i<= n; i++) {
        for (int j=1; j<=m; j++) {
            if (a[i-1] == b[j-1]) r[i][j] = r[i-1][j-1]+1;
            else r[i][j] = max(r[i][j-1], r[i-1][j]);
        }
    }

    /*
    // show array
    cout << endl;
        for (int i=0; i <= n; i++) {
            for (int j=0; j <= m; j++) {
                cout << r[i][j] << " ";
                    }
                    cout << endl;
                }
    cout << endl;
    */

    // generating a string from the end
    LCS2 = ""; int i = m - 1; int j = n - 1;
    while((i >= 0) && (j >= 0))
        if(a[i] == b[j]) {
            LCS2 = a[i] + LCS2;
            i--; j--; // if equal - diagonally
        }
    else if(r[i + 1][j] > r[i][j + 1]) j--; // we're going horizontally
    else i--; // vertical

    cout << LCS2;

    return 0;
}
