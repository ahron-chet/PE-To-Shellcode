#pragma once
#include "Windows.h"


PVOID GetFileBytes(char* fileName, DWORD* byteRead) {
    HANDLE hFile = CreateFileA(fileName, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile == INVALID_HANDLE_VALUE) {
        return nullptr;
    }
    DWORD fileSize = GetFileSize(hFile, NULL);
    if (fileSize == INVALID_FILE_SIZE) {
        CloseHandle(hFile);
        return nullptr;
    }

    PVOID outBuffer = VirtualAlloc(NULL, fileSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

    if (!ReadFile(hFile, outBuffer, fileSize, byteRead, NULL)) {
        CloseHandle(hFile);
        delete[] outBuffer;
        return nullptr;
    }
    CloseHandle(hFile);
    return outBuffer;
}


BOOL WriteFileBytes(char* fileName, char* data, size_t size) {
    HANDLE hFile = CreateFileA(fileName, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);

    if (hFile == INVALID_HANDLE_VALUE) {
        return FALSE;
    }
    DWORD dBytesWritten;
    return WriteFile(hFile, data, size, &dBytesWritten, NULL);
}
