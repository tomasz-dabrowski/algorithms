#include <iostream>

using namespace std;
const int maksimum = 1000;

int main() {

    unsigned int c;
    cin >> c;
    if (c == 0) return 1;

    int *result;
    result = new int [c];

    for (int k = 0; k < c; k++) {
        int n, m, getValue;
        cin >> n >> m;
        if (n > maksimum || m > maksimum) return 1;

        int **myArray = new int *[n];
        for(int i = 0; i < n; i++) {
            myArray[i] = new int [m];
        }

        for (int i=0; i<n; i++) {
            for (int j=0; j<m; j++) {
                cin >> getValue;
                myArray[i][j] = getValue;
            }
        }

        if (n==1) {
            int result_temp = 0;
            for (int i=0; i < m; i++) {
                result_temp += myArray[0][i];
            }
            result[k] = result_temp;
        }

        else if (m==1) {
            int minimum = myArray[0][0];
            for (int i=0; i < n; i++) {
                if (myArray[i][0] < minimum)
                minimum = myArray[i][0];
            }
            result[k] = minimum;
        }

        else {

        // temp array
        int **myArrayTemp = new int *[n];
        for(int i = 0; i < n; i++) {
            myArrayTemp[i] = new int [m];
        }

        for (int i=0; i < n; i++) {
            for (int j=0; j < m; j++) {
                myArrayTemp[i][j] = myArray[i][j];
            }
        }

        for (int i=0; i < n; i++) {
            for (int j=1; j <= m; j++) {
                myArrayTemp[i][j] = myArrayTemp[i][j-1] + myArrayTemp[i][j];
            }
        }

        // show myArray
        // cout << endl;
        // for (int i=0; i < n; i++) {
        //     for (int j=0; j < m; j++) {
        //         cout << myArray[i][j] << " ";
        //     }
        //     cout << endl;
        // }

        // show myArrayTemp
        // cout << endl;
        // for (int i=0; i < n; i++) {
        //     for (int j=0; j < m; j++) {
        //         cout << myArrayTemp[i][j] << " ";
        //     }
        //     cout << endl;
        // }

        for (int j=0; j < m-1; j++) {
            for (int i=0; i < n; i++) {

                int row = i;

                if (row == 0) {
                    int currentCell =  myArrayTemp[i][j];

                    int nextCell = myArray[i][j+1];
                    int currentSum = currentCell + nextCell;
                    if (currentSum < myArrayTemp[i][j+1]) myArrayTemp[i][j+1] = currentSum;

                    int nextCell2 = myArray[i+1][j+1];
                    int currentSum2 = currentCell + nextCell2;
                    if (currentSum2 < myArrayTemp[i+1][j+1]) myArrayTemp[i+1][j+1] = currentSum2;
                }
                else if ((row != 0) && (row != n-1)) {
                    int currentCell =  myArrayTemp[i][j];

                    int nextCell = myArray[i-1][j+1];
                    int currentSum = currentCell + nextCell;
                    if (currentSum < myArrayTemp[i-1][j+1]) myArrayTemp[i-1][j+1] = currentSum;

                    int nextCell2 = myArray[i][j+1];
                    int currentSum2 = currentCell + nextCell2;
                    if (currentSum2 < myArrayTemp[i][j+1]) myArrayTemp[i][j+1] = currentSum2;

                    int nextCell3 = myArray[i+1][j+1];
                    int currentSum3 = currentCell + nextCell3;
                    if (currentSum3 < myArrayTemp[i+1][j+1]) myArrayTemp[i+1][j+1] = currentSum3;
                }
                else if (row == n-1) {
                    int currentCell =  myArrayTemp[i][j];

                    int nextCell = myArray[i-1][j+1];
                    int currentSum = currentCell + nextCell;
                    if (currentSum < myArrayTemp[i-1][j+1]) myArrayTemp[i-1][j+1] = currentSum;

                    int nextCell2 = myArray[i][j+1];
                    int currentSum2 = currentCell + nextCell2;
                    if (currentSum2 < myArrayTemp[i][j+1]) myArrayTemp[i][j+1] = currentSum2;

                }
            }
        }

        // find minimum in last column
        int minimum = myArrayTemp[0][m-1];

        for (int i=0; i < n; i++) {
            if (myArrayTemp[i][m-1] < minimum)
                minimum = myArrayTemp[i][m-1];
        }

        // cout << minimum;
        result[k] = minimum;

        // releasing memory
        // for(int i = 0; i < n; i++) delete [] myArray[i];
        // delete [] myArray; myArray = NULL;
        // for(int i = 0; i < n; i++) delete [] myArrayTemp[i];
        // delete [] myArrayTemp; myArray = NULL;
        }
    }

    for (int k=0; k<c; k++) {
        cout << result[k] << endl;
    }

    return 0;
}
