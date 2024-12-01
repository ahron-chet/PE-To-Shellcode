#pragma once
#include "Windows.h"



PVOID GetFileBytes(const char* fileName, size_t* size) {
    HANDLE hFile = CreateFileA(fileName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile == INVALID_HANDLE_VALUE) {
        return NULL;
    }

    DWORD fileSize = GetFileSize(hFile, NULL);
    if (fileSize == INVALID_FILE_SIZE) {
        CloseHandle(hFile);
        return NULL;
    }

    PVOID outBuffer = malloc(fileSize); 
    if (!outBuffer) {
        CloseHandle(hFile);
        return NULL;
    }

    DWORD bytesRead = 0;
    if (!ReadFile(hFile, outBuffer, fileSize, &bytesRead, NULL)) {
        CloseHandle(hFile);
        free(outBuffer);
        return NULL;
    }

    CloseHandle(hFile);

    if (size) {
        *size = bytesRead;
    }

    return outBuffer;
}



BOOL WriteFileBytes(const char* fileName, char* data, size_t size) {
    HANDLE hFile = CreateFileA(fileName, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);

    if (hFile == INVALID_HANDLE_VALUE) {
        return FALSE;
    }
    DWORD dBytesWritten;
    return WriteFile(hFile, data, size, &dBytesWritten, NULL);
}
