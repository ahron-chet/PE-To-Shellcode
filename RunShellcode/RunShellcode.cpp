#include <Windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "../PE-To-Shellcode/utils.h"

int main(int argc, char* argv[])
{
    if (argc != 2)
    {
        printf("Usage: %s <path_to_shellcode>\n", argv[0]);
        return 1;
    }

    const char* filePath = argv[1];
    printf("[DEBUG] Shellcode file path: %s\n", filePath);

    size_t fileSize;
    char* shellcode = (char*)GetFileBytes(filePath, &fileSize);
    if (!shellcode)
    {
        printf("[ERROR] Failed to read shellcode\n");
        free(shellcode);
        return 1;
    }
    

 
    printf("[DEBUG] Shellcode file size: %ld bytes\n", fileSize);


    DWORD flOldProtect;
    if (!VirtualProtect(shellcode, fileSize, PAGE_EXECUTE_READWRITE, &flOldProtect))
    {
        printf("[ERROR] Failed to change memory protection\n");
        free(shellcode);
        return 1;
    }
    printf("[DEBUG] Memory protection changed to PAGE_EXECUTE_READWRITE\n");

    printf("[DEBUG] Executing shellcode...\n");
    ((void (*)())shellcode)();

    free(shellcode);
    printf("[DEBUG] Execution finished, memory freed\n");

    return 0;
}
