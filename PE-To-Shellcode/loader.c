#include <Windows.h>
#include "./loader.h"

// #include <stdio.h>
// #include <iostream>
// #include <string>

#pragma code_seg(".text")

FARPROC get_function_custom(const WCHAR module_name[], const char func_name[]) {
    HMODULE base_kernel32 = NULL;
    HMODULE(WINAPI * _LoadLibraryW)(LPCWSTR) = NULL;
    FARPROC(WINAPI * _GetProcAddress)(HMODULE, LPCSTR) = NULL;

    // std::cout << "[DEBUG] get_function_custom called with module_name: " << module_name << ", func_name: " << func_name << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char load_lib_name[] = { 'L', 'o', 'a', 'd', 'L', 'i', 'b', 'r', 'a', 'r', 'y', 'W', 0 };
    char get_proc_name[] = { 'G', 'e', 't', 'P', 'r', 'o', 'c', 'A', 'd', 'd', 'r', 'e', 's', 's', 0 };

    base_kernel32 = (HMODULE)get_module_by_name(kernel32_dll_name);
    if (!base_kernel32) {
        // std::cout << "[ERROR] Failed to get module base of kernel32.dll" << std::endl;
        return NULL;
    }
    else {
        // std::cout << "[DEBUG] kernel32.dll base address: " << base_kernel32 << std::endl;
    }

    LPVOID load_lib = get_func_by_name(base_kernel32, load_lib_name);
    LPVOID get_proc = get_func_by_name(base_kernel32, get_proc_name);

    if (!load_lib || !get_proc) {
        // std::cout << "[ERROR] Failed to get LoadLibraryW or GetProcAddress from kernel32.dll" << std::endl;
        return NULL;
    }
    else {
        // std::cout << "[DEBUG] LoadLibraryW address: " << load_lib << ", GetProcAddress address: " << get_proc << std::endl;
    }

    _LoadLibraryW = (HMODULE(WINAPI*)(LPCWSTR))load_lib;
    _GetProcAddress = (FARPROC(WINAPI*)(HMODULE, LPCSTR))get_proc;

    HMODULE module = _LoadLibraryW(module_name);
    if (!module) {
        // std::cout << "[ERROR] Failed to load module: " << module_name << std::endl;
        return NULL;
    }
    else {
        // std::cout << "[DEBUG] Module " << module_name << " loaded at address: " << module << std::endl;
    }

    FARPROC func_address = _GetProcAddress(module, func_name);
    if (!func_address) {
        // std::cout << "[ERROR] Failed to get function " << func_name << " from module " << module_name << std::endl;
    }
    else {
        // std::cout << "[DEBUG] Function " << func_name << " address: " << func_address << std::endl;
    }
    return func_address;
}

void* memcpycustom(void* dest, const void* src, size_t count) {
    // std::cout << "[DEBUG] memcpycustom called with dest: " << dest << ", src: " << src << ", count: " << count << std::endl;

    WCHAR msvcrt_dll_name[] = { L'm', L's', L'v', L'c', L'r', L't', L'.', L'd', L'l', L'l', 0 };
    char memcpy_name[] = { 'm', 'e', 'm', 'c', 'p', 'y', 0 };

    void* (*_memcpy)(void*, const void*, size_t) =
        (void* (*)(void*, const void*, size_t))get_function_custom(msvcrt_dll_name, memcpy_name);
    if (!_memcpy) {
        // std::cout << "[ERROR] Failed to get function memcpy from msvcrt.dll" << std::endl;
        return NULL;
    }

    void* result = _memcpy(dest, src, count);
    // std::cout << "[DEBUG] memcpy completed" << std::endl;
    return result;
}

BOOL CloseHandlecustom(HANDLE hObject) {
    // std::cout << "[DEBUG] CloseHandlecustom called with hObject: " << hObject << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char close_handle_name[] = { 'C', 'l', 'o', 's', 'e', 'H', 'a', 'n', 'd', 'l', 'e', 0 };

    BOOL(WINAPI * _CloseHandle)(HANDLE) =
        (BOOL(WINAPI*)(HANDLE))get_function_custom(kernel32_dll_name, close_handle_name);
    if (!_CloseHandle) {
        // std::cout << "[ERROR] Failed to get function CloseHandle from kernel32.dll" << std::endl;
        return FALSE;
    }

    BOOL result = _CloseHandle(hObject);
    // std::cout << "[DEBUG] CloseHandle returned: " << result << std::endl;
    return result;
}

DWORD GetLastErrorcustom() {
    // std::cout << "[DEBUG] GetLastErrorcustom called" << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char get_last_error_name[] = { 'G', 'e', 't', 'L', 'a', 's', 't', 'E', 'r', 'r', 'o', 'r', 0 };

    DWORD(WINAPI * _GetLastError)(void) =
        (DWORD(WINAPI*)(void))get_function_custom(kernel32_dll_name, get_last_error_name);
    if (!_GetLastError) {
        // std::cout << "[ERROR] Failed to get function GetLastError from kernel32.dll" << std::endl;
        return 0;
    }

    DWORD error = _GetLastError();
    // std::cout << "[DEBUG] GetLastError returned: " << error << std::endl;
    return error;
}

DWORD WaitForSingleObjectcustom(HANDLE hHandle, DWORD dwMilliseconds) {
    // std::cout << "[DEBUG] WaitForSingleObjectcustom called with hHandle: " << hHandle << ", dwMilliseconds: " << dwMilliseconds << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char wait_for_single_object_name[] =
    { 'W', 'a', 'i', 't', 'F', 'o', 'r', 'S', 'i', 'n', 'g', 'l', 'e', 'O', 'b', 'j', 'e', 'c', 't', 0 };

    DWORD(WINAPI * _WaitForSingleObject)(HANDLE, DWORD) =
        (DWORD(WINAPI*)(HANDLE, DWORD))get_function_custom(kernel32_dll_name, wait_for_single_object_name);
    if (!_WaitForSingleObject) {
        // std::cout << "[ERROR] Failed to get function WaitForSingleObject from kernel32.dll" << std::endl;
        return WAIT_FAILED;
    }

    DWORD result = _WaitForSingleObject(hHandle, dwMilliseconds);
    // std::cout << "[DEBUG] WaitForSingleObject returned: " << result << std::endl;
    return result;
}

HANDLE CreateThreadcustom(LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize,
    LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter,
    DWORD dwCreationFlags, LPDWORD lpThreadId) {
    // std::cout << "[DEBUG] CreateThreadcustom called" << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char create_thread_name[] = { 'C', 'r', 'e', 'a', 't', 'e', 'T', 'h', 'r', 'e', 'a', 'd', 0 };

    HANDLE(WINAPI * _CreateThread)(LPSECURITY_ATTRIBUTES, SIZE_T, LPTHREAD_START_ROUTINE,
        LPVOID, DWORD, LPDWORD) =
        (HANDLE(WINAPI*)(LPSECURITY_ATTRIBUTES, SIZE_T, LPTHREAD_START_ROUTINE,
            LPVOID, DWORD, LPDWORD))get_function_custom(kernel32_dll_name, create_thread_name);
    if (!_CreateThread) {
        // std::cout << "[ERROR] Failed to get function CreateThread from kernel32.dll" << std::endl;
        return NULL;
    }

    HANDLE hThread = _CreateThread(lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId);
    if (hThread == NULL) {
        // std::cout << "[ERROR] CreateThread failed" << std::endl;
    }
    else {
        // std::cout << "[DEBUG] CreateThread succeeded, thread handle: " << hThread << ", thread ID: " << *lpThreadId << std::endl;
    }
    return hThread;
}

LPVOID VirtualAlloccustom(LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect) {
    // std::cout << "[DEBUG] VirtualAlloccustom called with lpAddress: " << lpAddress << ", dwSize: " << dwSize << ", flAllocationType: " << flAllocationType << ", flProtect: " << flProtect << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char virtual_alloc_name[] = { 'V', 'i', 'r', 't', 'u', 'a', 'l', 'A', 'l', 'l', 'o', 'c', 0 };

    LPVOID(WINAPI * _VirtualAlloc)(LPVOID, SIZE_T, DWORD, DWORD) =
        (LPVOID(WINAPI*)(LPVOID, SIZE_T, DWORD, DWORD))get_function_custom(kernel32_dll_name, virtual_alloc_name);
    if (!_VirtualAlloc) {
        // std::cout << "[ERROR] Failed to get function VirtualAlloc from kernel32.dll" << std::endl;
        return NULL;
    }

    LPVOID pAllocated = _VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect);
    if (!pAllocated) {
        // std::cout << "[ERROR] VirtualAlloc failed" << std::endl;
    }
    else {
        // std::cout << "[DEBUG] VirtualAlloc succeeded, allocated address: " << pAllocated << std::endl;
    }
    return pAllocated;
}

BOOL VirtualFreecustom(LPVOID lpAddress, SIZE_T dwSize, DWORD dwFreeType) {
    // std::cout << "[DEBUG] VirtualFreecustom called with lpAddress: " << lpAddress << ", dwSize: " << dwSize << ", dwFreeType: " << dwFreeType << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char virtual_free_name[] = { 'V', 'i', 'r', 't', 'u', 'a', 'l', 'F', 'r', 'e', 'e', 0 };

    BOOL(WINAPI * _VirtualFree)(LPVOID, SIZE_T, DWORD) =
        (BOOL(WINAPI*)(LPVOID, SIZE_T, DWORD))get_function_custom(kernel32_dll_name, virtual_free_name);
    if (!_VirtualFree) {
        // std::cout << "[ERROR] Failed to get function VirtualFree from kernel32.dll" << std::endl;
        return FALSE;
    }

    BOOL result = _VirtualFree(lpAddress, dwSize, dwFreeType);
    if (!result) {
        // std::cout << "[ERROR] VirtualFree failed" << std::endl;
    }
    else {
        // std::cout << "[DEBUG] VirtualFree succeeded" << std::endl;
    }
    return result;
}

void freecustom(void* ptr) {
    // std::cout << "[DEBUG] freecustom called with ptr: " << ptr << std::endl;

    WCHAR msvcrt_dll_name[] = { L'm', L's', L'v', L'c', L'r', L't', L'.', L'd', L'l', L'l', 0 };
    char free_name[] = { 'f', 'r', 'e', 'e', 0 };

    void (*_free)(void*) =
        (void (*)(void*))get_function_custom(msvcrt_dll_name, free_name);
    if (!_free) {
        // std::cout << "[ERROR] Failed to get function free from msvcrt.dll" << std::endl;
        return;
    }

    _free(ptr);
    // std::cout << "[DEBUG] free completed" << std::endl;
}

BOOL VirtualProtectCustom(LPVOID lpAddress, SIZE_T dwSize, DWORD flNewProtect, PDWORD lpflOldProtect) {
    // std::cout << "[DEBUG] VirtualProtectCustom called with lpAddress: " << lpAddress << std::endl;

    WCHAR kernel32_dll_name[] = { L'k', L'e', L'r', L'n', L'e', L'l', L'3', L'2', L'.', L'd', L'l', L'l', 0 };
    char virtualprotect_name[] = { 'V', 'i', 'r', 't', 'u', 'a', 'l', 'P', 'r', 'o', 't', 'e', 'c', 't', 0 };

    BOOL(*_VirtualProtect)(LPVOID, SIZE_T, DWORD, PDWORD) =
        (BOOL(*)(LPVOID, SIZE_T, DWORD, PDWORD))get_function_custom(kernel32_dll_name, virtualprotect_name);

    if (!_VirtualProtect) {
        // std::cout << "[ERROR] Failed to get function VirtualProtect from kernel32.dll" << std::endl;
        return FALSE;
    }

    BOOL result = _VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect);
    // std::cout << "[DEBUG] VirtualProtect completed with result: " << result << std::endl;

    return result;
}


void* __cdecl malloc_custom(size_t _Size) {
    // Debug output (commented out)
    // std::cout << "[DEBUG] malloc_custom called with _Size: " << _Size << std::endl;

    WCHAR msvcrt_dll_name[] = { L'm', L's', L'v', L'c', L'r', L't', L'.', L'd', L'l', L'l', 0 };
    char malloc_name[] = { 'm', 'a', 'l', 'l', 'o', 'c', 0 };

    // Dynamically load malloc from msvcrt.dll
    void* (__cdecl * _malloc)(size_t) =
        (void* (__cdecl*)(size_t))get_function_custom(msvcrt_dll_name, malloc_name);
    if (!_malloc) {
        // std::cout << "[ERROR] Failed to get function malloc from msvcrt.dll" << std::endl;
        return NULL;
    }

    // Allocate memory using malloc
    void* pAllocated = _malloc(_Size);
    if (!pAllocated) {
        // std::cout << "[ERROR] malloc failed" << std::endl;
    }
    else {
        // std::cout << "[DEBUG] malloc succeeded, allocated address: " << pAllocated << std::endl;
    }
    return pAllocated;
}

void GetHeaders(PVOID raw_pe, PIMAGE_DOS_HEADER* pDOSHeader, PIMAGE_NT_HEADERS64* pNTHeaders) {
    // std::cout << "[DEBUG] GetHeaders called with raw_pe: " << raw_pe << std::endl;

    *pDOSHeader = (PIMAGE_DOS_HEADER)raw_pe;
    if ((*pDOSHeader)->e_magic != IMAGE_DOS_SIGNATURE) {
        // std::cout << "[ERROR] Invalid DOS signature: " << std::hex << (*pDOSHeader)->e_magic << std::endl;
        *pNTHeaders = NULL;
        return;
    }
    else {
        // std::cout << "[DEBUG] DOS header valid" << std::endl;
    }

    *pNTHeaders = (PIMAGE_NT_HEADERS64)((LPBYTE)raw_pe + (*pDOSHeader)->e_lfanew);
    if ((*pNTHeaders)->Signature != IMAGE_NT_SIGNATURE) {
        // std::cout << "[ERROR] Invalid NT signature: " << std::hex << (*pNTHeaders)->Signature << std::endl;
        *pNTHeaders = NULL;
        return;
    }
    else {
        // std::cout << "[DEBUG] NT header valid" << std::endl;
    }
}

PVOID GetFixedBaseAddress(PIMAGE_NT_HEADERS64 pNTHeaders) {
    // std::cout << "[DEBUG] GetFixedBaseAddress called" << std::endl;
    // std::cout << "[DEBUG] Size of image: " << std::dec << pNTHeaders->OptionalHeader.SizeOfImage << std::endl;

    PVOID baseAddress = VirtualAlloccustom(NULL, pNTHeaders->OptionalHeader.SizeOfImage, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (!baseAddress) {
        // std::cout << "[ERROR] Failed to allocate memory for image" << std::endl;
    }
    else {
        // std::cout << "[DEBUG] Memory allocated at address: " << baseAddress << std::endl;
    }
    return baseAddress;
}

void WriteHeaders(PVOID raw_pe, PVOID baseAddress, PIMAGE_NT_HEADERS64 pNTHeaders) {
    // std::cout << "[DEBUG] WriteHeaders called" << std::endl;
    // std::cout << "[DEBUG] Size of headers: " << std::dec << pNTHeaders->OptionalHeader.SizeOfHeaders << std::endl;

    memcpycustom(baseAddress, raw_pe, pNTHeaders->OptionalHeader.SizeOfHeaders);
    // std::cout << "[DEBUG] Headers copied to base address" << std::endl;
}

void WriteSections(PVOID baseAddress, PVOID raw_pe, PIMAGE_DOS_HEADER pDOSHeader, PIMAGE_NT_HEADERS64 pNTHeaders) {
    // std::cout << "[DEBUG] WriteSections called" << std::endl;

    PIMAGE_SECTION_HEADER pSectionHeader = (PIMAGE_SECTION_HEADER)((LPBYTE)pNTHeaders + sizeof(IMAGE_NT_HEADERS64));
    for (int i = 0; i < pNTHeaders->FileHeader.NumberOfSections; i++) {
        // std::cout << "[DEBUG] Processing section " << i << ": " << pSectionHeader->Name << std::endl;
        // std::cout << "  Virtual Address: " << std::dec << pSectionHeader->VirtualAddress << std::endl;
        // std::cout << "  Raw offset: " << std::dec << pSectionHeader->PointerToRawData << std::endl;
        // std::cout << "  Size of raw data: " << std::dec << pSectionHeader->SizeOfRawData << std::endl;
        // std::cout << "  Virtual Size: " << std::dec << pSectionHeader->Misc.VirtualSize << std::endl;
        DWORD protection = 0;
        if (pSectionHeader->SizeOfRawData > 0) {
            LPVOID dest = (LPBYTE)baseAddress + pSectionHeader->VirtualAddress;
            LPVOID src = (LPBYTE)raw_pe + pSectionHeader->PointerToRawData;
            // std::cout << "  Copying section data to: " << dest << std::endl;
            memcpycustom(dest, src, pSectionHeader->SizeOfRawData);
        }
        pSectionHeader++;
    }
    // std::cout << "[DEBUG] Sections written" << std::endl;
}


BOOL FixImports(PIMAGE_NT_HEADERS64 pNTHeaders, PVOID baseAddress) {
    // std::cout << "[DEBUG] FixImports called" << std::endl;
    wchar_t kernel32_dll_name[] = { 'k','e','r','n','e','l','3','2','.','d','l','l', 0 };
    char load_lib_name[] = { 'L','o','a','d','L','i','b','r','a','r','y','A', 0 };
    char get_proc_name[] = { 'G','e','t','P','r','o','c','A','d','d','r','e','s','s', 0 };

    LPVOID base_kernel32 = get_module_by_name(kernel32_dll_name);
    if (!base_kernel32) {
        // std::cout << "[ERROR] Failed to get module base of kernel32.dll" << std::endl;
        return FALSE;
    }

    LPVOID load_lib = get_func_by_name((HMODULE)base_kernel32, load_lib_name);
    LPVOID get_proc = get_func_by_name((HMODULE)base_kernel32, get_proc_name);
    if (!load_lib || !get_proc) {
        // std::cout << "[ERROR] Failed to get LoadLibraryA or GetProcAddress from kernel32.dll" << std::endl;
        return FALSE;
    }

    HMODULE(WINAPI * _LoadLibraryA)(LPCSTR) = (HMODULE(WINAPI*)(LPCSTR))load_lib;
    FARPROC(WINAPI * _GetProcAddress)(HMODULE, LPCSTR) = (FARPROC(WINAPI*)(HMODULE, LPCSTR))get_proc;

    if (pNTHeaders->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size == 0) {
        // std::cout << "[DEBUG] No imports to fix" << std::endl;
        return TRUE;
    }

    PIMAGE_IMPORT_DESCRIPTOR pImportDesc = (PIMAGE_IMPORT_DESCRIPTOR)((LPBYTE)baseAddress +
        pNTHeaders->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress);

    while (pImportDesc->Name != 0) {
        char* dllName = (char*)((LPBYTE)baseAddress + pImportDesc->Name);
        // std::cout << "[DEBUG] Loading DLL: " << dllName << std::endl;
        HMODULE hDll = _LoadLibraryA(dllName);
        if (!hDll) {
            DWORD error = GetLastErrorcustom();
            // std::cout << "[ERROR] Failed to load the DLL " << dllName << ". Error code: " << error << std::endl;
            return FALSE;
        }
        else {
            // std::cout << "[DEBUG] DLL " << dllName << " loaded at address: " << hDll << std::endl;
        }

        PIMAGE_THUNK_DATA64 pOriginalFirstThunk = (PIMAGE_THUNK_DATA64)((LPBYTE)baseAddress + pImportDesc->OriginalFirstThunk);
        PIMAGE_THUNK_DATA64 pFirstThunk = (PIMAGE_THUNK_DATA64)((LPBYTE)baseAddress + pImportDesc->FirstThunk);

        while (pOriginalFirstThunk->u1.AddressOfData != 0) {
            FARPROC functionAddress;
            if (pOriginalFirstThunk->u1.Ordinal & IMAGE_ORDINAL_FLAG64) {
                ULONGLONG ordinal = pOriginalFirstThunk->u1.Ordinal & 0xFFFF;
                // std::cout << "  Function Ordinal: " << ordinal << std::endl;
                functionAddress = _GetProcAddress(hDll, (LPCSTR)ordinal);
            }
            else {
                PIMAGE_IMPORT_BY_NAME pImportByName = (PIMAGE_IMPORT_BY_NAME)((LPBYTE)baseAddress +
                    pOriginalFirstThunk->u1.AddressOfData);
                char* funcName = (char*)pImportByName->Name;
                // std::cout << "  Function name: " << funcName << std::endl;
                functionAddress = _GetProcAddress(hDll, funcName);
            }

            if (!functionAddress) {
                // std::cout << "[ERROR] Failed to get function address" << std::endl;
                return FALSE;
            }
            else {
                // std::cout << "  Function address: " << functionAddress << std::endl;
            }
            pFirstThunk->u1.Function = (ULONGLONG)functionAddress;
            pOriginalFirstThunk++;
            pFirstThunk++;
        }
        pImportDesc++;
    }
    // std::cout << "[DEBUG] Imports fixed" << std::endl;
    return TRUE;
}

void BaseRelocation(PVOID baseAddress, PIMAGE_NT_HEADERS64 pNTHeaders) {
    // std::cout << "[DEBUG] BaseRelocation called" << std::endl;

    LONG64 delta = (LONG64)baseAddress - (LONG64)pNTHeaders->OptionalHeader.ImageBase;
    // std::cout << "[DEBUG] Expected ImageBase: " << (PVOID)pNTHeaders->OptionalHeader.ImageBase << std::endl;
    // std::cout << "[DEBUG] Loaded ImageBase: " << baseAddress << std::endl;
    // std::cout << "[DEBUG] Delta: " << delta << std::endl;

    if (delta == 0) {
        // std::cout << "[DEBUG] No relocation needed" << std::endl;
        return;
    }

    PIMAGE_DATA_DIRECTORY relocDir = &pNTHeaders->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC];
    if (relocDir->Size == 0) {
        // std::cout << "[DEBUG] No relocation info" << std::endl;
        return;
    }

    PIMAGE_BASE_RELOCATION pReloc = (PIMAGE_BASE_RELOCATION)((LPBYTE)baseAddress + relocDir->VirtualAddress);
    DWORD parsedSize = 0;

    while (parsedSize < relocDir->Size && pReloc->SizeOfBlock != 0) {
        DWORD entries = (pReloc->SizeOfBlock - sizeof(IMAGE_BASE_RELOCATION)) / sizeof(WORD);
        WORD* pRelocData = (WORD*)((LPBYTE)pReloc + sizeof(IMAGE_BASE_RELOCATION));

        // std::cout << "[DEBUG] Processing relocation block at RVA: " << (LPVOID)pReloc->VirtualAddress << ", Size: " << pReloc->SizeOfBlock << std::endl;

        for (DWORD i = 0; i < entries; i++) {
            WORD type = pRelocData[i] >> 12;
            WORD offset = pRelocData[i] & 0x0FFF;

            if (type == IMAGE_REL_BASED_DIR64) {
                ULONGLONG* pAddressToPatch = (ULONGLONG*)((LPBYTE)baseAddress + pReloc->VirtualAddress + offset);
                *pAddressToPatch += delta;
                // std::cout << "  Patched address: " << pAddressToPatch << ", New value: " << (PVOID)*pAddressToPatch << std::endl;
            }
        }

        parsedSize += pReloc->SizeOfBlock;
        pReloc = (PIMAGE_BASE_RELOCATION)((LPBYTE)pReloc + pReloc->SizeOfBlock);
    }
    // std::cout << "[DEBUG] Base relocation completed" << std::endl;
}

BOOL runTlsCallback(PVOID baseAddress, PIMAGE_NT_HEADERS64 pNtHeaders) {
    const DWORD TlsEntryVirtualAddress = pNtHeaders->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_TLS].VirtualAddress;
    if (TlsEntryVirtualAddress == 0) {
        return TRUE;
    }
    const PIMAGE_TLS_DIRECTORY lpImageTLSDirectory = (PIMAGE_TLS_DIRECTORY)((LPBYTE)baseAddress + TlsEntryVirtualAddress);
    PIMAGE_TLS_CALLBACK* lpCallbackArray = (PIMAGE_TLS_CALLBACK*)lpImageTLSDirectory->AddressOfCallBacks;

    while (*lpCallbackArray != NULL) {
        const PIMAGE_TLS_CALLBACK lpImageCallback = *lpCallbackArray;
        lpImageCallback(baseAddress, DLL_PROCESS_ATTACH, NULL);
        lpCallbackArray++;
    }
    return TRUE;
}


BOOL fixPermissions(PVOID baseAddress, PIMAGE_DOS_HEADER pDOSHeader, PIMAGE_NT_HEADERS64 pNTHeaders) {
    // std::cout << "[DEBUG] WriteSections called" << std::endl;

    PIMAGE_SECTION_HEADER pSectionHeader = (PIMAGE_SECTION_HEADER)((LPBYTE)pNTHeaders + sizeof(IMAGE_NT_HEADERS64));
    for (int i = 0; i < pNTHeaders->FileHeader.NumberOfSections; i++) {
        if (pSectionHeader->SizeOfRawData > 0) {
            DWORD protection = 0;
            DWORD old;
            LPVOID dest = (LPBYTE)baseAddress + pSectionHeader->VirtualAddress;

            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_WRITE) {
                protection = PAGE_WRITECOPY;
            }
            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_READ) {
                protection = PAGE_READONLY;
            }
            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_WRITE && pSectionHeader->Characteristics & IMAGE_SCN_MEM_READ) {
                protection = PAGE_READWRITE;
            }
            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_EXECUTE) {
                protection = PAGE_READONLY;
            }
            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_EXECUTE && pSectionHeader->Characteristics & IMAGE_SCN_MEM_WRITE) {
                protection = PAGE_EXECUTE_WRITECOPY;
            }
            if (pSectionHeader->Characteristics & IMAGE_SCN_MEM_EXECUTE && pSectionHeader->Characteristics & IMAGE_SCN_MEM_READ) {
                protection = PAGE_EXECUTE_READ;
            }
            if ((pSectionHeader->Characteristics & IMAGE_SCN_MEM_EXECUTE) && (pSectionHeader->Characteristics & IMAGE_SCN_MEM_WRITE) && (pSectionHeader->Characteristics & IMAGE_SCN_MEM_READ)) {
                protection = PAGE_EXECUTE_READWRITE;
            }
            if (!VirtualProtectCustom(dest, pSectionHeader->SizeOfRawData, protection, &old)) {
                return FALSE;
            }
        }
        pSectionHeader++;
    }
    return TRUE;
}

BOOL LoadAndExecute(char* raw_pe) {
    // std::cout << "[DEBUG] LoadAndExecute called" << std::endl;

    if (!raw_pe) {
        // std::cout << "[ERROR] Invalid raw PE data" << std::endl;
        return FALSE;
    }

    PIMAGE_DOS_HEADER pDOSHeader;
    PIMAGE_NT_HEADERS64 pNTHeaders;
    GetHeaders(raw_pe, &pDOSHeader, &pNTHeaders);

    if (!pNTHeaders) {
        // std::cout << "[ERROR] Invalid PE headers" << std::endl;
        return FALSE;
    }

    PVOID baseAddress = GetFixedBaseAddress(pNTHeaders);
    if (!baseAddress) {
        // std::cout << "[ERROR] Unable to allocate base address" << std::endl;
        return FALSE;
    }

    WriteHeaders(raw_pe, baseAddress, pNTHeaders);
    WriteSections(baseAddress, raw_pe, pDOSHeader, pNTHeaders);

    if (!FixImports(pNTHeaders, baseAddress)) {
        // std::cout << "[ERROR] Failed to fix imports" << std::endl;
        VirtualFreecustom(baseAddress, 0, MEM_RELEASE);
        return FALSE;
    }

    BaseRelocation(baseAddress, pNTHeaders);
    if (!fixPermissions(baseAddress, pDOSHeader, pNTHeaders)) {
        // std::cout << "[ERROR] Failed to fix Permissions" << GetLastError() << std::endl;
        VirtualFreecustom(baseAddress, 0, MEM_RELEASE);
        return FALSE;
    }


    if (!runTlsCallback(baseAddress, pNTHeaders)) {
        // std::cout << "[ERROR] Failed to runTlsCallback" << GetLastError() << std::endl;
        VirtualFreecustom(baseAddress, 0, MEM_RELEASE);
        return FALSE;
    }

    LPTHREAD_START_ROUTINE entryPoint = (LPTHREAD_START_ROUTINE)((LPBYTE)baseAddress + pNTHeaders->OptionalHeader.AddressOfEntryPoint);
    // std::cout << "[DEBUG] Creating thread at entry point: " << entryPoint << std::endl;

    DWORD threadID;
    HANDLE threadHandle = CreateThreadcustom(
        NULL,
        0,
        entryPoint,
        NULL,
        0,
        &threadID
    );

    if (!threadHandle) {
        // std::cout << "[ERROR] Error occurred during thread creation" << std::endl;
        VirtualFreecustom(baseAddress, 0, MEM_RELEASE);
        return FALSE;
    }

    // std::cout << "[DEBUG] Thread Created with ID: " << threadID << std::endl;

    WaitForSingleObjectcustom(threadHandle, INFINITE);
    CloseHandlecustom(threadHandle);

    VirtualFreecustom(baseAddress, 0, MEM_RELEASE);

    // std::cout << "[DEBUG] LoadAndExecute completed successfully" << std::endl;
    return TRUE;
}


inline WCHAR* utf8_to_wchar(const char* s, size_t* size) {
    if (s == NULL) return NULL;

    // Estimate the maximum length needed for the wide string
    size_t maxlen = 0;
    for (const char* p = s; *p; ++p) {
        maxlen++;
    }

    // Allocate memory for the wide string
    *size = (maxlen + 1) * sizeof(WCHAR);
    WCHAR* wstr = (WCHAR*)malloc_custom((maxlen + 1) * sizeof(WCHAR));
    if (!wstr) return NULL;

    const unsigned char* src = (const unsigned char*)s;
    WCHAR* dst = wstr;

    while (*src) {
        WCHAR wc;
        size_t bytes = 0;

        if (*src < 0x80) {
            // 1-byte sequence (ASCII)
            wc = *src++;
        }
        else if ((*src & 0xE0) == 0xC0) {
            // 2-byte sequence
            if ((src[1] & 0xC0) != 0x80) { freecustom(wstr); return NULL; }
            wc = ((*src & 0x1F) << 6) | (src[1] & 0x3F);
            src += 2;
        }
        else if ((*src & 0xF0) == 0xE0) {
            // 3-byte sequence
            if ((src[1] & 0xC0) != 0x80 || (src[2] & 0xC0) != 0x80) { freecustom(wstr); return NULL; }
            wc = ((*src & 0x0F) << 12) |
                ((src[1] & 0x3F) << 6) |
                (src[2] & 0x3F);
            src += 3;
        }
        else if ((*src & 0xF8) == 0xF0) {
            // 4-byte sequence
            if ((src[1] & 0xC0) != 0x80 ||
                (src[2] & 0xC0) != 0x80 ||
                (src[3] & 0xC0) != 0x80) {
                freecustom(wstr);
                return NULL;
            }
            wc = ((*src & 0x07) << 18) |
                ((src[1] & 0x3F) << 12) |
                ((src[2] & 0x3F) << 6) |
                (src[3] & 0x3F);
            src += 4;
        }
        else {
            // Invalid UTF-8 sequence
            freecustom(wstr);
            return NULL;
        }

        *dst++ = wc;
    }

    *dst = L'\0'; // Null-terminate the wide string
    return wstr;
}


inline void set_command_line(char* args) {
    PPEB pPeb = NULL;
#if defined(_WIN64)
    pPeb = (PPEB)__readgsqword(0x60);
#else
    pPeb = (PPEB)__readfsdword(0x30);
#endif
    size_t len;

    wchar_t* buf = utf8_to_wchar(args, &len);
    memcpycustom(pPeb->ProcessParameters->CommandLine.Buffer, buf, len);
    pPeb->ProcessParameters->CommandLine.Length = (USHORT)len;
    pPeb->ProcessParameters->CommandLine.MaximumLength = (USHORT)(len);
}
