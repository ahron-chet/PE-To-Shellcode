 
# PE to Shellcode Generator

## Overview

The **PE to Shellcode Generator** is a robust tool designed to convert Portable Executable (PE) files into shellcode that supports embedded arguments and ensures compatibility with all types of PE files. It implements a custom PE loader in assembly (optimized for shellcode use) that handles critical aspects like imports, TLS callbacks, relocations, and permissions to create a seamless execution environment for the embedded PE,T he project currently supports only x64. Support for 32-bit will be added soon.

## Features

- **Support for All PE Types**: Compatible with executables, include DotNet pyinstaller etc.
- **Embedded Arguments**: Allows inclusion of custom arguments directly into the shellcode.
- **Custom PE Loader**:
  - Handles imports dynamically.
  - Executes TLS callbacks.
  - Manages base relocations.
  - Configures appropriate section permissions.
- **Standalone Execution**: Generates a single shellcode buffer that includes the PE and optional arguments.
- **Shellcode Output**: Shellcode that can be directly injected to other processes using `CreateRemoteThread`.


### Building

1. Clone the repository:

   `git clone https://github.com/ahron-chet/PE-To-Shellcode.git`

   `cd PE-To-Shellcode`

2. Build the executable:

   `make`

   Alternatively, you can compile using a suitable compiler like Visual Studio.

### Running

1. Prepare your PE file and (optional) arguments.
2. Run the generator:

   `PE-To-Shellcode.exe --pe <path_to_pe_file> [--param "<arguments>"]`

   Example:

   `PE-To-Shellcode.exe --pe sample.exe --param "arg1 arg2"`

3. The generated shellcode will be saved as `output.bin`.

### Embedding Shellcode in Projects

The generated shellcode (`output.bin`) can be executed directly in memory.

### Files After Building

This project also contains two additional utilities to facilitate testing and demonstration:

- **Shellcode Runner**: A utility to test the generated shellcode.
  - **Executable**: `RunShellcode.exe`
  - **Usage**: `RunShellcode.exe <path_to_shellcode>`
  - **Example**:
    ```
    RunShellcode.exe output.bin
    ```

- **Example PE with Arguments**: A sample PE executable that accepts and print arguments, used for testing.
  - **Executable**: `PeWithArgs.exe`
  - **Usage**: `PeWithArgs.exe <arguments>`
  - **Example**:
    ```
    PeWithArgs.exe arg1 arg2
    ```


