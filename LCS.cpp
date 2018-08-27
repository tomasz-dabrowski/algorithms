#include <iostream>

using namespace std;

int main()
{
    string a, b;
    cin >> a >> b;

    int n = a.length(); int m = b.length();
    int r[n+1][m+1];

    for (int i=0; i<= n; i++) r[i][0] = 0;
    for (int j=0; j<=m; j++) r[0][j] = 0;

    for (int i=1; i<= n; i++) {
        for (int j=1; j<=m; j++) {
            if (a[i-1] == b[j-1]) r[i][j] = r[i-1][j-1]+1;
            else r[i][j] = max(r[i][j-1], r[i-1][j]);
        }
    }
    cout << r[n][m];
    
return 0;
}