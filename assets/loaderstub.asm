
push   rsi
mov    rsi, rsp
and    rsp, 0xfffffffffffffff0
sub    rsp, 0x20
call   0x16
mov    rsp, rsi
pop    rsi
ret
sub    rsp, 0x38
mov    ecx, 0x5b2
call   0x7e91
mov    QWORD PTR [rsp + 0x20], rax
mov    rcx, QWORD PTR [rsp + 0x20]
mov    BYTE PTR [rcx + 0x5b1], 0x4d
mov    rcx, QWORD PTR [rsp + 0x20]
call   0x26a8
test   eax, eax
jne    0x26a1
mov    eax, 0x1
jmp    0x26a3
xor    eax, eax
add    rsp, 0x38
ret
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x68
cmp    QWORD PTR [rsp + 0x70], 0x0
jne    0x26c0
xor    eax, eax
jmp    0x2821
lea    r8, [rsp + 0x40]
lea    rdx, [rsp + 0x50]
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2e62
nop
cmp    QWORD PTR [rsp + 0x40], 0x0
jne    0x26e4
xor    eax, eax
jmp    0x2821
mov    rcx, QWORD PTR [rsp + 0x40]
call   0x2e2d
mov    QWORD PTR [rsp + 0x38], rax
cmp    QWORD PTR [rsp + 0x38], 0x0
jne    0x270c
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2fa9
xor    eax, eax
jmp    0x2821
mov    r8, QWORD PTR [rsp + 0x40]
mov    rdx, QWORD PTR [rsp + 0x38]
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2dfa
mov    r9, QWORD PTR [rsp + 0x40]
mov    r8, QWORD PTR [rsp + 0x50]
mov    rdx, QWORD PTR [rsp + 0x70]
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x2d44
nop
mov    rdx, QWORD PTR [rsp + 0x38]
mov    rcx, QWORD PTR [rsp + 0x40]
call   0x29a7
test   eax, eax
jne    0x2770
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2fa9
mov    r8d, 0x8000
xor    edx, edx
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x3063
xor    eax, eax
jmp    0x2821
mov    rdx, QWORD PTR [rsp + 0x40]
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x2826
mov    rax, QWORD PTR [rsp + 0x40]
mov    eax, DWORD PTR [rax + 0x28]
mov    rcx, QWORD PTR [rsp + 0x38]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x58], rax
lea    rax, [rsp + 0x30]
mov    QWORD PTR [rsp + 0x28], rax
mov    DWORD PTR [rsp + 0x20], 0x0
xor    r9d, r9d
mov    r8, QWORD PTR [rsp + 0x58]
xor    edx, edx
xor    ecx, ecx
call   0x3299
mov    QWORD PTR [rsp + 0x48], rax
cmp    QWORD PTR [rsp + 0x48], 0x0
jne    0x27e7
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2fa9
mov    r8d, 0x8000
xor    edx, edx
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x3063
xor    eax, eax
jmp    0x2821
mov    edx, 0xffffffff
mov    rcx, QWORD PTR [rsp + 0x48]
call   0x33dc
mov    rcx, QWORD PTR [rsp + 0x48]
call   0x3604
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x2fa9
mov    r8d, 0x8000
xor    edx, edx
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x3063
mov    eax, 0x1
add    rsp, 0x68
ret
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x48
mov    rax, QWORD PTR [rsp + 0x58]
mov    rax, QWORD PTR [rax + 0x30]
mov    rcx, QWORD PTR [rsp + 0x50]
sub    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x30], rax
cmp    QWORD PTR [rsp + 0x30], 0x0
jne    0x285a
jmp    0x29a2
mov    eax, 0x8
imul   rax, rax, 0x5
mov    rcx, QWORD PTR [rsp + 0x58]
lea    rax, [rcx + rax * 1 + 0x88]
mov    QWORD PTR [rsp + 0x20], rax
mov    rax, QWORD PTR [rsp + 0x20]
cmp    DWORD PTR [rax + 0x4], 0x0
jne    0x2885
jmp    0x29a2
mov    rax, QWORD PTR [rsp + 0x20]
mov    eax, DWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0x50]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x8], rax
mov    DWORD PTR [rsp + 0x18], 0x0
mov    rax, QWORD PTR [rsp + 0x20]
mov    eax, DWORD PTR [rax + 0x4]
cmp    DWORD PTR [rsp + 0x18], eax
jae    0x29a2
mov    rax, QWORD PTR [rsp + 0x8]
cmp    DWORD PTR [rax + 0x4], 0x0
je     0x29a2
mov    rax, QWORD PTR [rsp + 0x8]
mov    eax, DWORD PTR [rax + 0x4]
sub    rax, 0x8
xor    edx, edx
mov    ecx, 0x2
div    rcx
mov    DWORD PTR [rsp + 0x1c], eax
mov    rax, QWORD PTR [rsp + 0x8]
add    rax, 0x8
mov    QWORD PTR [rsp + 0x28], rax
mov    DWORD PTR [rsp], 0x0
jmp    0x28fe
mov    eax, DWORD PTR [rsp]
inc    eax
mov    DWORD PTR [rsp], eax
mov    eax, DWORD PTR [rsp + 0x1c]
cmp    DWORD PTR [rsp], eax
jae    0x2971
mov    eax, DWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x28]
movzx  eax, WORD PTR [rcx + rax * 2]
sar    eax, 0xc
mov    WORD PTR [rsp + 0x10], ax
mov    eax, DWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x28]
movzx  eax, WORD PTR [rcx + rax * 2]
and    eax, 0xfff
mov    WORD PTR [rsp + 0x14], ax
movzx  eax, WORD PTR [rsp + 0x10]
cmp    eax, 0xa
jne    0x296f
mov    rax, QWORD PTR [rsp + 0x8]
mov    eax, DWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0x50]
add    rcx, rax
mov    rax, rcx
movzx  ecx, WORD PTR [rsp + 0x14]
add    rax, rcx
mov    QWORD PTR [rsp + 0x38], rax
mov    rax, QWORD PTR [rsp + 0x38]
mov    rax, QWORD PTR [rax]
add    rax, QWORD PTR [rsp + 0x30]
mov    rcx, QWORD PTR [rsp + 0x38]
mov    QWORD PTR [rcx], rax
jmp    0x28f6
mov    rax, QWORD PTR [rsp + 0x8]
mov    eax, DWORD PTR [rax + 0x4]
mov    ecx, DWORD PTR [rsp + 0x18]
add    ecx, eax
mov    eax, ecx
mov    DWORD PTR [rsp + 0x18], eax
mov    rax, QWORD PTR [rsp + 0x8]
mov    eax, DWORD PTR [rax + 0x4]
mov    rcx, QWORD PTR [rsp + 0x8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x8], rax
jmp    0x28a4
add    rsp, 0x48
ret
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0xe8
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x56], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x58], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x5c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x5e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x60], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x62], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x64], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x66], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x68], ax
mov    BYTE PTR [rsp + 0x20], 0x4c
mov    BYTE PTR [rsp + 0x21], 0x6f
mov    BYTE PTR [rsp + 0x22], 0x61
mov    BYTE PTR [rsp + 0x23], 0x64
mov    BYTE PTR [rsp + 0x24], 0x4c
mov    BYTE PTR [rsp + 0x25], 0x69
mov    BYTE PTR [rsp + 0x26], 0x62
mov    BYTE PTR [rsp + 0x27], 0x72
mov    BYTE PTR [rsp + 0x28], 0x61
mov    BYTE PTR [rsp + 0x29], 0x72
mov    BYTE PTR [rsp + 0x2a], 0x79
mov    BYTE PTR [rsp + 0x2b], 0x41
mov    BYTE PTR [rsp + 0x2c], 0x0
mov    BYTE PTR [rsp + 0x30], 0x47
mov    BYTE PTR [rsp + 0x31], 0x65
mov    BYTE PTR [rsp + 0x32], 0x74
mov    BYTE PTR [rsp + 0x33], 0x50
mov    BYTE PTR [rsp + 0x34], 0x72
mov    BYTE PTR [rsp + 0x35], 0x6f
mov    BYTE PTR [rsp + 0x36], 0x63
mov    BYTE PTR [rsp + 0x37], 0x41
mov    BYTE PTR [rsp + 0x38], 0x64
mov    BYTE PTR [rsp + 0x39], 0x64
mov    BYTE PTR [rsp + 0x3a], 0x72
mov    BYTE PTR [rsp + 0x3b], 0x65
mov    BYTE PTR [rsp + 0x3c], 0x73
mov    BYTE PTR [rsp + 0x3d], 0x73
mov    BYTE PTR [rsp + 0x3e], 0x0
lea    rcx, [rsp + 0x50]
call   0x3c16
mov    QWORD PTR [rsp + 0x70], rax
cmp    QWORD PTR [rsp + 0x70], 0x0
jne    0x2ae1
xor    eax, eax
jmp    0x2d3c
lea    rdx, [rsp + 0x20]
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x39de
mov    QWORD PTR [rsp + 0x90], rax
lea    rdx, [rsp + 0x30]
mov    rcx, QWORD PTR [rsp + 0x70]
call   0x39de
mov    QWORD PTR [rsp + 0x98], rax
cmp    QWORD PTR [rsp + 0x90], 0x0
je     0x2b25
cmp    QWORD PTR [rsp + 0x98], 0x0
jne    0x2b2c
xor    eax, eax
jmp    0x2d3c
mov    rax, QWORD PTR [rsp + 0x90]
mov    QWORD PTR [rsp + 0xb8], rax
mov    rax, QWORD PTR [rsp + 0x98]
mov    QWORD PTR [rsp + 0xa0], rax
mov    eax, 0x8
imul   rax, rax, 0x1
mov    rcx, QWORD PTR [rsp + 0xf0]
cmp    DWORD PTR [rcx + rax * 1 + 0x8c], 0x0
jne    0x2b71
mov    eax, 0x1
jmp    0x2d3c
mov    eax, 0x8
imul   rax, rax, 0x1
mov    rcx, QWORD PTR [rsp + 0xf0]
mov    eax, DWORD PTR [rcx + rax * 1 + 0x88]
mov    rcx, QWORD PTR [rsp + 0xf8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x48], rax
mov    rax, QWORD PTR [rsp + 0x48]
cmp    DWORD PTR [rax + 0xc], 0x0
je     0x2d37
mov    rax, QWORD PTR [rsp + 0x48]
mov    eax, DWORD PTR [rax + 0xc]
mov    rcx, QWORD PTR [rsp + 0xf8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0xb0], rax
mov    rcx, QWORD PTR [rsp + 0xb0]
call   QWORD PTR [rsp + 0xb8]
mov    QWORD PTR [rsp + 0x78], rax
cmp    QWORD PTR [rsp + 0x78], 0x0
jne    0x2bf8
call   0x350f
mov    DWORD PTR [rsp + 0xa8], eax
xor    eax, eax
jmp    0x2d3c
mov    rax, QWORD PTR [rsp + 0x48]
mov    eax, DWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0xf8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x40], rax
mov    rax, QWORD PTR [rsp + 0x48]
mov    eax, DWORD PTR [rax + 0x10]
mov    rcx, QWORD PTR [rsp + 0xf8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x88], rax
mov    rax, QWORD PTR [rsp + 0x40]
cmp    QWORD PTR [rax], 0x0
je     0x2d24
mov    rax, QWORD PTR [rsp + 0x40]
movabs rcx, 0x8000000000000000
mov    rax, QWORD PTR [rax]
and    rax, rcx
test   rax, rax
je     0x2c8d
mov    rax, QWORD PTR [rsp + 0x40]
mov    rax, QWORD PTR [rax]
and    rax, 0xffff
mov    QWORD PTR [rsp + 0xc0], rax
mov    rdx, QWORD PTR [rsp + 0xc0]
mov    rcx, QWORD PTR [rsp + 0x78]
call   QWORD PTR [rsp + 0xa0]
mov    QWORD PTR [rsp + 0x80], rax
jmp    0x2cdb
mov    rax, QWORD PTR [rsp + 0x40]
mov    rax, QWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0xf8]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0xc8], rax
mov    rax, QWORD PTR [rsp + 0xc8]
add    rax, 0x2
mov    QWORD PTR [rsp + 0xd0], rax
mov    rdx, QWORD PTR [rsp + 0xd0]
mov    rcx, QWORD PTR [rsp + 0x78]
call   QWORD PTR [rsp + 0xa0]
mov    QWORD PTR [rsp + 0x80], rax
cmp    QWORD PTR [rsp + 0x80], 0x0
jne    0x2cea
xor    eax, eax
jmp    0x2d3c
mov    rax, QWORD PTR [rsp + 0x88]
mov    rcx, QWORD PTR [rsp + 0x80]
mov    QWORD PTR [rax], rcx
mov    rax, QWORD PTR [rsp + 0x40]
add    rax, 0x8
mov    QWORD PTR [rsp + 0x40], rax
mov    rax, QWORD PTR [rsp + 0x88]
add    rax, 0x8
mov    QWORD PTR [rsp + 0x88], rax
jmp    0x2c30
mov    rax, QWORD PTR [rsp + 0x48]
add    rax, 0x14
mov    QWORD PTR [rsp + 0x48], rax
jmp    0x2b9c
mov    eax, 0x1
add    rsp, 0xe8
ret
mov    QWORD PTR [rsp + 0x20], r9
mov    QWORD PTR [rsp + 0x18], r8
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x48
mov    rax, QWORD PTR [rsp + 0x68]
add    rax, 0x108
mov    QWORD PTR [rsp + 0x28], rax
mov    DWORD PTR [rsp + 0x20], 0x0
jmp    0x2d80
mov    eax, DWORD PTR [rsp + 0x20]
inc    eax
mov    DWORD PTR [rsp + 0x20], eax
mov    rax, QWORD PTR [rsp + 0x68]
movzx  eax, WORD PTR [rax + 0x6]
cmp    DWORD PTR [rsp + 0x20], eax
jge    0x2df5
mov    rax, QWORD PTR [rsp + 0x28]
cmp    DWORD PTR [rax + 0x10], 0x0
jbe    0x2de5
mov    rax, QWORD PTR [rsp + 0x28]
mov    eax, DWORD PTR [rax + 0xc]
mov    rcx, QWORD PTR [rsp + 0x50]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x38], rax
mov    rax, QWORD PTR [rsp + 0x28]
mov    eax, DWORD PTR [rax + 0x14]
mov    rcx, QWORD PTR [rsp + 0x58]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x30], rax
mov    rax, QWORD PTR [rsp + 0x28]
mov    eax, DWORD PTR [rax + 0x10]
mov    r8d, eax
mov    rdx, QWORD PTR [rsp + 0x30]
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x36fe
nop
mov    rax, QWORD PTR [rsp + 0x28]
add    rax, 0x28
mov    QWORD PTR [rsp + 0x28], rax
jmp    0x2d76
add    rsp, 0x48
ret
mov    QWORD PTR [rsp + 0x18], r8
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x28
mov    rax, QWORD PTR [rsp + 0x40]
mov    eax, DWORD PTR [rax + 0x54]
mov    r8d, eax
mov    rdx, QWORD PTR [rsp + 0x30]
mov    rcx, QWORD PTR [rsp + 0x38]
call   0x36fe
nop
add    rsp, 0x28
ret
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x38
mov    rax, QWORD PTR [rsp + 0x40]
mov    eax, DWORD PTR [rax + 0x50]
mov    r9d, 0x40
mov    r8d, 0x3000
mov    edx, eax
xor    ecx, ecx
call   0x3174
mov    QWORD PTR [rsp + 0x20], rax
mov    rax, QWORD PTR [rsp + 0x20]
add    rsp, 0x38
ret
mov    QWORD PTR [rsp + 0x18], r8
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
mov    rax, QWORD PTR [rsp + 0x10]
mov    rcx, QWORD PTR [rsp + 0x8]
mov    QWORD PTR [rax], rcx
mov    rax, QWORD PTR [rsp + 0x10]
mov    rax, QWORD PTR [rax]
movzx  eax, WORD PTR [rax]
cmp    eax, 0x5a4d
je     0x2e9e
mov    rax, QWORD PTR [rsp + 0x18]
mov    QWORD PTR [rax], 0x0
jmp    0x2ed9
mov    rax, QWORD PTR [rsp + 0x10]
mov    rax, QWORD PTR [rax]
movsxd rax, DWORD PTR [rax + 0x3c]
mov    rcx, QWORD PTR [rsp + 0x8]
add    rcx, rax
mov    rax, rcx
mov    rcx, QWORD PTR [rsp + 0x18]
mov    QWORD PTR [rcx], rax
mov    rax, QWORD PTR [rsp + 0x18]
mov    rax, QWORD PTR [rax]
cmp    DWORD PTR [rax], 0x4550
je     0x2ed9
mov    rax, QWORD PTR [rsp + 0x18]
mov    QWORD PTR [rax], 0x0
ret
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x58
mov    eax, 0x6d
mov    WORD PTR [rsp + 0x38], ax
mov    eax, 0x73
mov    WORD PTR [rsp + 0x3a], ax
mov    eax, 0x76
mov    WORD PTR [rsp + 0x3c], ax
mov    eax, 0x63
mov    WORD PTR [rsp + 0x3e], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x74
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x4c], ax
mov    BYTE PTR [rsp + 0x20], 0x6d
mov    BYTE PTR [rsp + 0x21], 0x61
mov    BYTE PTR [rsp + 0x22], 0x6c
mov    BYTE PTR [rsp + 0x23], 0x6c
mov    BYTE PTR [rsp + 0x24], 0x6f
mov    BYTE PTR [rsp + 0x25], 0x63
mov    BYTE PTR [rsp + 0x26], 0x0
lea    rdx, [rsp + 0x20]
lea    rcx, [rsp + 0x38]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x2f91
xor    eax, eax
jmp    0x2fa4
mov    rcx, QWORD PTR [rsp + 0x60]
call   QWORD PTR [rsp + 0x28]
mov    QWORD PTR [rsp + 0x30], rax
mov    rax, QWORD PTR [rsp + 0x30]
add    rsp, 0x58
ret
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x58
mov    eax, 0x6d
mov    WORD PTR [rsp + 0x30], ax
mov    eax, 0x73
mov    WORD PTR [rsp + 0x32], ax
mov    eax, 0x76
mov    WORD PTR [rsp + 0x34], ax
mov    eax, 0x63
mov    WORD PTR [rsp + 0x36], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x38], ax
mov    eax, 0x74
mov    WORD PTR [rsp + 0x3a], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x3c], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x3e], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x42], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x44], ax
mov    BYTE PTR [rsp + 0x20], 0x66
mov    BYTE PTR [rsp + 0x21], 0x72
mov    BYTE PTR [rsp + 0x22], 0x65
mov    BYTE PTR [rsp + 0x23], 0x65
mov    BYTE PTR [rsp + 0x24], 0x0
lea    rdx, [rsp + 0x20]
lea    rcx, [rsp + 0x30]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x3054
jmp    0x305e
mov    rcx, QWORD PTR [rsp + 0x60]
call   QWORD PTR [rsp + 0x28]
nop
add    rsp, 0x58
ret
mov    DWORD PTR [rsp + 0x18], r8d
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x68
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x56], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x58], ax
mov    BYTE PTR [rsp + 0x30], 0x56
mov    BYTE PTR [rsp + 0x31], 0x69
mov    BYTE PTR [rsp + 0x32], 0x72
mov    BYTE PTR [rsp + 0x33], 0x74
mov    BYTE PTR [rsp + 0x34], 0x75
mov    BYTE PTR [rsp + 0x35], 0x61
mov    BYTE PTR [rsp + 0x36], 0x6c
mov    BYTE PTR [rsp + 0x37], 0x46
mov    BYTE PTR [rsp + 0x38], 0x72
mov    BYTE PTR [rsp + 0x39], 0x65
mov    BYTE PTR [rsp + 0x3a], 0x65
mov    BYTE PTR [rsp + 0x3b], 0x0
lea    rdx, [rsp + 0x30]
lea    rcx, [rsp + 0x40]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x3151
xor    eax, eax
jmp    0x316f
mov    r8d, DWORD PTR [rsp + 0x80]
mov    rdx, QWORD PTR [rsp + 0x78]
mov    rcx, QWORD PTR [rsp + 0x70]
call   QWORD PTR [rsp + 0x28]
mov    DWORD PTR [rsp + 0x20], eax
mov    eax, DWORD PTR [rsp + 0x20]
add    rsp, 0x68
ret
mov    DWORD PTR [rsp + 0x20], r9d
mov    DWORD PTR [rsp + 0x18], r8d
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x68
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x56], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x58], ax
mov    BYTE PTR [rsp + 0x30], 0x56
mov    BYTE PTR [rsp + 0x31], 0x69
mov    BYTE PTR [rsp + 0x32], 0x72
mov    BYTE PTR [rsp + 0x33], 0x74
mov    BYTE PTR [rsp + 0x34], 0x75
mov    BYTE PTR [rsp + 0x35], 0x61
mov    BYTE PTR [rsp + 0x36], 0x6c
mov    BYTE PTR [rsp + 0x37], 0x41
mov    BYTE PTR [rsp + 0x38], 0x6c
mov    BYTE PTR [rsp + 0x39], 0x6c
mov    BYTE PTR [rsp + 0x3a], 0x6f
mov    BYTE PTR [rsp + 0x3b], 0x63
mov    BYTE PTR [rsp + 0x3c], 0x0
lea    rdx, [rsp + 0x30]
lea    rcx, [rsp + 0x40]
call   0x37e1
mov    QWORD PTR [rsp + 0x20], rax
cmp    QWORD PTR [rsp + 0x20], 0x0
jne    0x326c
xor    eax, eax
jmp    0x3294
mov    r9d, DWORD PTR [rsp + 0x88]
mov    r8d, DWORD PTR [rsp + 0x80]
mov    rdx, QWORD PTR [rsp + 0x78]
mov    rcx, QWORD PTR [rsp + 0x70]
call   QWORD PTR [rsp + 0x20]
mov    QWORD PTR [rsp + 0x28], rax
mov    rax, QWORD PTR [rsp + 0x28]
add    rsp, 0x68
ret
mov    QWORD PTR [rsp + 0x20], r9
mov    QWORD PTR [rsp + 0x18], r8
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x78
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x56], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x58], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x5c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x5e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x60], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x62], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x64], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x66], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x68], ax
mov    BYTE PTR [rsp + 0x40], 0x43
mov    BYTE PTR [rsp + 0x41], 0x72
mov    BYTE PTR [rsp + 0x42], 0x65
mov    BYTE PTR [rsp + 0x43], 0x61
mov    BYTE PTR [rsp + 0x44], 0x74
mov    BYTE PTR [rsp + 0x45], 0x65
mov    BYTE PTR [rsp + 0x46], 0x54
mov    BYTE PTR [rsp + 0x47], 0x68
mov    BYTE PTR [rsp + 0x48], 0x72
mov    BYTE PTR [rsp + 0x49], 0x65
mov    BYTE PTR [rsp + 0x4a], 0x61
mov    BYTE PTR [rsp + 0x4b], 0x64
mov    BYTE PTR [rsp + 0x4c], 0x0
lea    rdx, [rsp + 0x40]
lea    rcx, [rsp + 0x50]
call   0x37e1
mov    QWORD PTR [rsp + 0x30], rax
cmp    QWORD PTR [rsp + 0x30], 0x0
jne    0x3391
xor    eax, eax
jmp    0x33d7
mov    rax, QWORD PTR [rsp + 0xa8]
mov    QWORD PTR [rsp + 0x28], rax
mov    eax, DWORD PTR [rsp + 0xa0]
mov    DWORD PTR [rsp + 0x20], eax
mov    r9, QWORD PTR [rsp + 0x98]
mov    r8, QWORD PTR [rsp + 0x90]
mov    rdx, QWORD PTR [rsp + 0x88]
mov    rcx, QWORD PTR [rsp + 0x80]
call   QWORD PTR [rsp + 0x30]
mov    QWORD PTR [rsp + 0x38], rax
mov    rax, QWORD PTR [rsp + 0x38]
add    rsp, 0x78
ret
mov    DWORD PTR [rsp + 0x10], edx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x78
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x56], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x58], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x5a], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5c], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5e], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x60], ax
mov    BYTE PTR [rsp + 0x30], 0x57
mov    BYTE PTR [rsp + 0x31], 0x61
mov    BYTE PTR [rsp + 0x32], 0x69
mov    BYTE PTR [rsp + 0x33], 0x74
mov    BYTE PTR [rsp + 0x34], 0x46
mov    BYTE PTR [rsp + 0x35], 0x6f
mov    BYTE PTR [rsp + 0x36], 0x72
mov    BYTE PTR [rsp + 0x37], 0x53
mov    BYTE PTR [rsp + 0x38], 0x69
mov    BYTE PTR [rsp + 0x39], 0x6e
mov    BYTE PTR [rsp + 0x3a], 0x67
mov    BYTE PTR [rsp + 0x3b], 0x6c
mov    BYTE PTR [rsp + 0x3c], 0x65
mov    BYTE PTR [rsp + 0x3d], 0x4f
mov    BYTE PTR [rsp + 0x3e], 0x62
mov    BYTE PTR [rsp + 0x3f], 0x6a
mov    BYTE PTR [rsp + 0x40], 0x65
mov    BYTE PTR [rsp + 0x41], 0x63
mov    BYTE PTR [rsp + 0x42], 0x74
mov    BYTE PTR [rsp + 0x43], 0x0
lea    rdx, [rsp + 0x30]
lea    rcx, [rsp + 0x48]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x34ef
mov    eax, 0xffffffff
jmp    0x350a
mov    edx, DWORD PTR [rsp + 0x88]
mov    rcx, QWORD PTR [rsp + 0x80]
call   QWORD PTR [rsp + 0x28]
mov    DWORD PTR [rsp + 0x20], eax
mov    eax, DWORD PTR [rsp + 0x20]
add    rsp, 0x78
ret
sub    rsp, 0x68
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x56], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x58], ax
mov    BYTE PTR [rsp + 0x30], 0x47
mov    BYTE PTR [rsp + 0x31], 0x65
mov    BYTE PTR [rsp + 0x32], 0x74
mov    BYTE PTR [rsp + 0x33], 0x4c
mov    BYTE PTR [rsp + 0x34], 0x61
mov    BYTE PTR [rsp + 0x35], 0x73
mov    BYTE PTR [rsp + 0x36], 0x74
mov    BYTE PTR [rsp + 0x37], 0x45
mov    BYTE PTR [rsp + 0x38], 0x72
mov    BYTE PTR [rsp + 0x39], 0x72
mov    BYTE PTR [rsp + 0x3a], 0x6f
mov    BYTE PTR [rsp + 0x3b], 0x72
mov    BYTE PTR [rsp + 0x3c], 0x0
lea    rdx, [rsp + 0x30]
lea    rcx, [rsp + 0x40]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x35f3
xor    eax, eax
jmp    0x35ff
call   QWORD PTR [rsp + 0x28]
mov    DWORD PTR [rsp + 0x20], eax
mov    eax, DWORD PTR [rsp + 0x20]
add    rsp, 0x68
ret
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x68
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x56], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x58], ax
mov    BYTE PTR [rsp + 0x30], 0x43
mov    BYTE PTR [rsp + 0x31], 0x6c
mov    BYTE PTR [rsp + 0x32], 0x6f
mov    BYTE PTR [rsp + 0x33], 0x73
mov    BYTE PTR [rsp + 0x34], 0x65
mov    BYTE PTR [rsp + 0x35], 0x48
mov    BYTE PTR [rsp + 0x36], 0x61
mov    BYTE PTR [rsp + 0x37], 0x6e
mov    BYTE PTR [rsp + 0x38], 0x64
mov    BYTE PTR [rsp + 0x39], 0x6c
mov    BYTE PTR [rsp + 0x3a], 0x65
mov    BYTE PTR [rsp + 0x3b], 0x0
lea    rdx, [rsp + 0x30]
lea    rcx, [rsp + 0x40]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x36e8
xor    eax, eax
jmp    0x36f9
mov    rcx, QWORD PTR [rsp + 0x70]
call   QWORD PTR [rsp + 0x28]
mov    DWORD PTR [rsp + 0x20], eax
mov    eax, DWORD PTR [rsp + 0x20]
add    rsp, 0x68
ret
mov    QWORD PTR [rsp + 0x18], r8
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x58
mov    eax, 0x6d
mov    WORD PTR [rsp + 0x38], ax
mov    eax, 0x73
mov    WORD PTR [rsp + 0x3a], ax
mov    eax, 0x76
mov    WORD PTR [rsp + 0x3c], ax
mov    eax, 0x63
mov    WORD PTR [rsp + 0x3e], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x40], ax
mov    eax, 0x74
mov    WORD PTR [rsp + 0x42], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x44], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x46], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x4a], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x4c], ax
mov    BYTE PTR [rsp + 0x20], 0x6d
mov    BYTE PTR [rsp + 0x21], 0x65
mov    BYTE PTR [rsp + 0x22], 0x6d
mov    BYTE PTR [rsp + 0x23], 0x63
mov    BYTE PTR [rsp + 0x24], 0x70
mov    BYTE PTR [rsp + 0x25], 0x79
mov    BYTE PTR [rsp + 0x26], 0x0
lea    rdx, [rsp + 0x20]
lea    rcx, [rsp + 0x38]
call   0x37e1
mov    QWORD PTR [rsp + 0x28], rax
cmp    QWORD PTR [rsp + 0x28], 0x0
jne    0x37bf
xor    eax, eax
jmp    0x37dc
mov    r8, QWORD PTR [rsp + 0x70]
mov    rdx, QWORD PTR [rsp + 0x68]
mov    rcx, QWORD PTR [rsp + 0x60]
call   QWORD PTR [rsp + 0x28]
mov    QWORD PTR [rsp + 0x30], rax
mov    rax, QWORD PTR [rsp + 0x30]
add    rsp, 0x58
ret
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0xa8
mov    QWORD PTR [rsp + 0x40], 0x0
mov    QWORD PTR [rsp + 0x78], 0x0
mov    QWORD PTR [rsp + 0x88], 0x0
mov    eax, 0x6b
mov    WORD PTR [rsp + 0x48], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x4a], ax
mov    eax, 0x72
mov    WORD PTR [rsp + 0x4c], ax
mov    eax, 0x6e
mov    WORD PTR [rsp + 0x4e], ax
mov    eax, 0x65
mov    WORD PTR [rsp + 0x50], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x52], ax
mov    eax, 0x33
mov    WORD PTR [rsp + 0x54], ax
mov    eax, 0x32
mov    WORD PTR [rsp + 0x56], ax
mov    eax, 0x2e
mov    WORD PTR [rsp + 0x58], ax
mov    eax, 0x64
mov    WORD PTR [rsp + 0x5a], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5c], ax
mov    eax, 0x6c
mov    WORD PTR [rsp + 0x5e], ax
xor    eax, eax
mov    WORD PTR [rsp + 0x60], ax
mov    BYTE PTR [rsp + 0x20], 0x4c
mov    BYTE PTR [rsp + 0x21], 0x6f
mov    BYTE PTR [rsp + 0x22], 0x61
mov    BYTE PTR [rsp + 0x23], 0x64
mov    BYTE PTR [rsp + 0x24], 0x4c
mov    BYTE PTR [rsp + 0x25], 0x69
mov    BYTE PTR [rsp + 0x26], 0x62
mov    BYTE PTR [rsp + 0x27], 0x72
mov    BYTE PTR [rsp + 0x28], 0x61
mov    BYTE PTR [rsp + 0x29], 0x72
mov    BYTE PTR [rsp + 0x2a], 0x79
mov    BYTE PTR [rsp + 0x2b], 0x57
mov    BYTE PTR [rsp + 0x2c], 0x0
mov    BYTE PTR [rsp + 0x30], 0x47
mov    BYTE PTR [rsp + 0x31], 0x65
mov    BYTE PTR [rsp + 0x32], 0x74
mov    BYTE PTR [rsp + 0x33], 0x50
mov    BYTE PTR [rsp + 0x34], 0x72
mov    BYTE PTR [rsp + 0x35], 0x6f
mov    BYTE PTR [rsp + 0x36], 0x63
mov    BYTE PTR [rsp + 0x37], 0x41
mov    BYTE PTR [rsp + 0x38], 0x64
mov    BYTE PTR [rsp + 0x39], 0x64
mov    BYTE PTR [rsp + 0x3a], 0x72
mov    BYTE PTR [rsp + 0x3b], 0x65
mov    BYTE PTR [rsp + 0x3c], 0x73
mov    BYTE PTR [rsp + 0x3d], 0x73
mov    BYTE PTR [rsp + 0x3e], 0x0
lea    rcx, [rsp + 0x48]
call   0x3c16
mov    QWORD PTR [rsp + 0x40], rax
cmp    QWORD PTR [rsp + 0x40], 0x0
jne    0x3939
xor    eax, eax
jmp    0x39d6
lea    rdx, [rsp + 0x20]
mov    rcx, QWORD PTR [rsp + 0x40]
call   0x39de
mov    QWORD PTR [rsp + 0x68], rax
lea    rdx, [rsp + 0x30]
mov    rcx, QWORD PTR [rsp + 0x40]
call   0x39de
mov    QWORD PTR [rsp + 0x70], rax
cmp    QWORD PTR [rsp + 0x68], 0x0
je     0x3971
cmp    QWORD PTR [rsp + 0x70], 0x0
jne    0x3975
xor    eax, eax
jmp    0x39d6
mov    rax, QWORD PTR [rsp + 0x68]
mov    QWORD PTR [rsp + 0x78], rax
mov    rax, QWORD PTR [rsp + 0x70]
mov    QWORD PTR [rsp + 0x88], rax
mov    rcx, QWORD PTR [rsp + 0xb0]
call   QWORD PTR [rsp + 0x78]
mov    QWORD PTR [rsp + 0x80], rax
cmp    QWORD PTR [rsp + 0x80], 0x0
jne    0x39af
xor    eax, eax
jmp    0x39d6
mov    rdx, QWORD PTR [rsp + 0xb8]
mov    rcx, QWORD PTR [rsp + 0x80]
call   QWORD PTR [rsp + 0x88]
mov    QWORD PTR [rsp + 0x90], rax
mov    rax, QWORD PTR [rsp + 0x90]
add    rsp, 0xa8
ret
mov    QWORD PTR [rsp + 0x10], rdx
mov    QWORD PTR [rsp + 0x8], rcx
sub    rsp, 0x78
mov    rax, QWORD PTR [rsp + 0x80]
mov    QWORD PTR [rsp + 0x30], rax
mov    rax, QWORD PTR [rsp + 0x30]
movzx  eax, WORD PTR [rax]
cmp    eax, 0x5a4d
je     0x3a0f
xor    eax, eax
jmp    0x3c11
mov    rax, QWORD PTR [rsp + 0x30]
movsxd rax, DWORD PTR [rax + 0x3c]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x40], rax
mov    eax, 0x8
imul   rax, rax, 0x0
mov    rcx, QWORD PTR [rsp + 0x40]
lea    rax, [rcx + rax * 1 + 0x88]
mov    QWORD PTR [rsp + 0x38], rax
mov    rax, QWORD PTR [rsp + 0x38]
cmp    DWORD PTR [rax], 0x0
jne    0x3a57
xor    eax, eax
jmp    0x3c11
mov    rax, QWORD PTR [rsp + 0x38]
mov    eax, DWORD PTR [rax]
mov    DWORD PTR [rsp + 0x18], eax
mov    eax, DWORD PTR [rsp + 0x18]
add    rax, QWORD PTR [rsp + 0x80]
mov    QWORD PTR [rsp + 0x10], rax
mov    rax, QWORD PTR [rsp + 0x10]
mov    eax, DWORD PTR [rax + 0x18]
mov    QWORD PTR [rsp + 0x48], rax
mov    rax, QWORD PTR [rsp + 0x10]
mov    eax, DWORD PTR [rax + 0x1c]
mov    DWORD PTR [rsp + 0x24], eax
mov    rax, QWORD PTR [rsp + 0x10]
mov    eax, DWORD PTR [rax + 0x20]
mov    DWORD PTR [rsp + 0x1c], eax
mov    rax, QWORD PTR [rsp + 0x10]
mov    eax, DWORD PTR [rax + 0x24]
mov    DWORD PTR [rsp + 0x20], eax
mov    QWORD PTR [rsp + 0x8], 0x0
jmp    0x3abc
mov    rax, QWORD PTR [rsp + 0x8]
inc    rax
mov    QWORD PTR [rsp + 0x8], rax
mov    rax, QWORD PTR [rsp + 0x48]
cmp    QWORD PTR [rsp + 0x8], rax
jae    0x3c0f
mov    eax, DWORD PTR [rsp + 0x1c]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
mov    rcx, QWORD PTR [rsp + 0x8]
lea    rax, [rax + rcx * 4]
mov    QWORD PTR [rsp + 0x58], rax
mov    eax, DWORD PTR [rsp + 0x20]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
mov    rcx, QWORD PTR [rsp + 0x8]
lea    rax, [rax + rcx * 2]
mov    QWORD PTR [rsp + 0x50], rax
mov    eax, DWORD PTR [rsp + 0x24]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
mov    rcx, QWORD PTR [rsp + 0x50]
movzx  ecx, WORD PTR [rcx]
lea    rax, [rax + rcx * 4]
mov    QWORD PTR [rsp + 0x60], rax
mov    rax, QWORD PTR [rsp + 0x58]
mov    eax, DWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
mov    QWORD PTR [rsp + 0x28], rax
mov    QWORD PTR [rsp], 0x0
mov    QWORD PTR [rsp], 0x0
jmp    0x3b66
mov    rax, QWORD PTR [rsp]
inc    rax
mov    QWORD PTR [rsp], rax
mov    rax, QWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x88]
add    rcx, rax
mov    rax, rcx
movsx  eax, BYTE PTR [rax]
test   eax, eax
je     0x3bc4
mov    rax, QWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x28]
add    rcx, rax
mov    rax, rcx
movsx  eax, BYTE PTR [rax]
test   eax, eax
je     0x3bc4
mov    rax, QWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x88]
add    rcx, rax
mov    rax, rcx
movsx  eax, BYTE PTR [rax]
mov    rcx, QWORD PTR [rsp]
mov    rdx, QWORD PTR [rsp + 0x28]
add    rdx, rcx
mov    rcx, rdx
movsx  ecx, BYTE PTR [rcx]
cmp    eax, ecx
je     0x3bc2
jmp    0x3bc4
jmp    0x3b5b
mov    rax, QWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x88]
add    rcx, rax
mov    rax, rcx
movsx  eax, BYTE PTR [rax]
test   eax, eax
jne    0x3c0a
mov    rax, QWORD PTR [rsp]
mov    rcx, QWORD PTR [rsp + 0x28]
add    rcx, rax
mov    rax, rcx
movsx  eax, BYTE PTR [rax]
test   eax, eax
jne    0x3c0a
mov    rax, QWORD PTR [rsp + 0x60]
mov    eax, DWORD PTR [rax]
mov    rcx, QWORD PTR [rsp + 0x80]
add    rcx, rax
mov    rax, rcx
jmp    0x3c11
jmp    0x3aaf
xor    eax, eax
add    rsp, 0x78
ret
mov    QWORD PTR [rsp + 0x8], rcx
push   rsi
push   rdi
sub    rsp, 0x68
mov    QWORD PTR [rsp + 0x30], 0x0
mov    rax, QWORD PTR gs:0x60
mov    QWORD PTR [rsp + 0x30], rax
mov    rax, QWORD PTR [rsp + 0x30]
mov    rax, QWORD PTR [rax + 0x18]
mov    QWORD PTR [rsp + 0x38], rax
lea    rax, [rsp + 0x48]
mov    rcx, QWORD PTR [rsp + 0x38]
mov    rdi, rax
lea    rsi, [rcx + 0x10]
mov    ecx, 0x10
rep movs BYTE PTR es:[rdi], BYTE PTR ds:[rsi]
mov    rax, QWORD PTR [rsp + 0x48]
mov    QWORD PTR [rsp + 0x40], rax
mov    rax, QWORD PTR [rsp + 0x40]
mov    QWORD PTR [rsp + 0x20], rax
cmp    QWORD PTR [rsp + 0x20], 0x0
je     0x3e44
mov    rax, QWORD PTR [rsp + 0x20]
cmp    QWORD PTR [rax + 0x30], 0x0
je     0x3e44
mov    rax, QWORD PTR [rsp + 0x20]
cmp    QWORD PTR [rax + 0x60], 0x0
jne    0x3c9c
jmp    0x3c72
mov    rax, QWORD PTR [rsp + 0x20]
mov    rax, QWORD PTR [rax + 0x60]
mov    QWORD PTR [rsp + 0x18], rax
mov    QWORD PTR [rsp], 0x0
mov    QWORD PTR [rsp], 0x0
jmp    0x3cc7
mov    rax, QWORD PTR [rsp]
inc    rax
mov    QWORD PTR [rsp], rax
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
test   eax, eax
je     0x3e02
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
test   eax, eax
je     0x3e02
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
cmp    eax, 0x5a
jg     0x3d59
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
cmp    eax, 0x41
jl     0x3d59
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
sub    eax, 0x41
add    eax, 0x61
mov    DWORD PTR [rsp + 0x28], eax
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  edx, WORD PTR [rsp + 0x28]
mov    WORD PTR [rax + rcx * 2], dx
movzx  eax, WORD PTR [rsp + 0x28]
mov    WORD PTR [rsp + 0x8], ax
jmp    0x3d6e
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
mov    WORD PTR [rsp + 0x8], ax
movzx  eax, WORD PTR [rsp + 0x8]
mov    WORD PTR [rsp + 0xc], ax
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
cmp    eax, 0x5a
jg     0x3dd1
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
cmp    eax, 0x41
jl     0x3dd1
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
sub    eax, 0x41
add    eax, 0x61
mov    DWORD PTR [rsp + 0x2c], eax
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  edx, WORD PTR [rsp + 0x2c]
mov    WORD PTR [rax + rcx * 2], dx
movzx  eax, WORD PTR [rsp + 0x2c]
mov    WORD PTR [rsp + 0xa], ax
jmp    0x3de3
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
mov    WORD PTR [rsp + 0xa], ax
movzx  eax, WORD PTR [rsp + 0xa]
mov    WORD PTR [rsp + 0x10], ax
movzx  eax, WORD PTR [rsp + 0xc]
movzx  ecx, WORD PTR [rsp + 0x10]
cmp    eax, ecx
je     0x3dfd
jmp    0x3e02
jmp    0x3cbc
mov    rax, QWORD PTR [rsp + 0x80]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
test   eax, eax
jne    0x3e32
mov    rax, QWORD PTR [rsp + 0x18]
mov    rcx, QWORD PTR [rsp]
movzx  eax, WORD PTR [rax + rcx * 2]
test   eax, eax
jne    0x3e32
mov    rax, QWORD PTR [rsp + 0x20]
mov    rax, QWORD PTR [rax + 0x30]
jmp    0x3e46
mov    rax, QWORD PTR [rsp + 0x20]
mov    rax, QWORD PTR [rax]
mov    QWORD PTR [rsp + 0x20], rax
jmp    0x3c72
xor    eax, eax
add    rsp, 0x68
pop    rdi
pop    rsi
ret
