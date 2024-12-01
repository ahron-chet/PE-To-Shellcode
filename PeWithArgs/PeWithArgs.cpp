#include <iostream>
#include <windows.h>


int main(int argc, char* argv[]) {

    wchar_t* command = GetCommandLineW();
    int iArgc = 0;
    wchar_t** wArgs = CommandLineToArgvW(command, &iArgc);

    printf("Args Output: \n");
    if (wArgs) {
        for (int i = 0; i < iArgc; i++) {
            printf("[%d] %ws \n", i, wArgs[i]);
        }
        LocalFree(wArgs);
    }

    return 0;
}
