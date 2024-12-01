#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "./utils.h"

void int_to_bytes_le(int value, char* buffer, int num_bytes) {
    for (int i = 0; i < num_bytes; i++) {
        buffer[i] = (char)((value >> (8 * i)) & 0xFF);
    }
}

char* call_malloc(int length, size_t* out_size) {
    char* buf = (char*)malloc(10);
    if (!buf) return NULL;

    // mov ecx, imm32
    buf[0] = 0xB9;
    int_to_bytes_le(length, &buf[1], 4);

    buf[5] = 0xE8; // call rel32
    buf[6] = 0x00;
    buf[7] = 0x00;
    buf[8] = 0x00;
    buf[9] = 0x00;

    *out_size = 10;
    return buf;
}


char* add_bytes_to_buff_alloc_opt(char byte, int offset, size_t* out_size) {
    char* code;
    // move a byte into [rcx + offset]
    if (offset <= 127) {
        code = (char*)malloc(4);
        code[0] = 0xC6;
        code[1] = 0x41;
        code[2] = (char)(offset & 0xFF);
        code[3] = byte;
        *out_size = 4;
    }
    else {
        code = (char*)malloc(7);
        code[0] = 0xC6;
        code[1] = 0x81;
        int_to_bytes_le(offset, &code[2], 4);
        code[6] = byte;
        *out_size = 7;
    }
    return code;
}


char* call_set_command_line(size_t* out_size) {
    char* buf = (char*)malloc(5);
    if (!buf) return NULL;

    // call rel32 (will be patched later)
    buf[0] = 0xE8;
    buf[1] = 0x00;
    buf[2] = 0x00;
    buf[3] = 0x00;
    buf[4] = 0x00;

    *out_size = 5;
    return buf;
}


char* generate_call_bytes_x64(int current_address, int target_address, size_t* out_size) {
    int instruction_length = 5;
    int next_instruction_address = current_address + instruction_length;
    int relative_offset = target_address - next_instruction_address;

    char* buf = (char*)malloc(5);
    if (!buf) return NULL;

    buf[0] = 0xE8; // call rel32
    int_to_bytes_le(relative_offset, &buf[1], 4); // Relative offset
    *out_size = 5;
    return buf;
}


size_t calculate_buf_capacity(size_t stack_alignment_part_size, size_t end_of_stub_size, size_t args_size, size_t pebuf_size) {
    size_t total_length = 0;


    total_length += stack_alignment_part_size;

    total_length += 10; // Size of call_malloc for args (mov ecx, imm32 + call)

    if (args_size > 0) {
        total_length += 5;  // Size of mov [rsp+0x28], rax
        total_length += 5;  // Size of mov rcx, [rsp+0x28]


        for (size_t offset = 0; offset < args_size; offset++) {
            if (offset <= 127) {
                total_length += 4; // Short offset instruction
            }
            else {
                total_length += 7; // Long offset instruction
            }
        }

        total_length += 5; // Size of mov rcx, [rsp+0x28] before calling set_command_line
        total_length += 5; // Size of call to set_command_line

        total_length += 10; // Size of call_malloc for pebuf (mov ecx, imm32 + call)
    }
    else {
        total_length += 10; // Size of call_malloc for pebuf
    }

    total_length += 5;  // Size of mov [rsp+0x20], rax
    total_length += 5;  // Size of mov rcx, [rsp+0x20]

    for (size_t offset = 0; offset < pebuf_size; offset++) {
        if (offset <= 127) {
            total_length += 4; // Short offset instruction
        }
        else {
            total_length += 7; // Long offset instruction
        }
    }

    total_length += end_of_stub_size;

    return total_length;
}

char* GenBuf(char* args, size_t args_size, char* pebuf, size_t pebuf_size,
    char* stack_alignment_part, size_t stack_alignment_part_size,
    char* end_of_stub, size_t end_of_stub_size, size_t* total_size) {
    
    int OFFSET_TO_SET_ARGS = 0x1C; // Offset to set args without buffers from end of buffers
    int OFFSET_TO_MALLOC = 0xEC8;  // Offset to malloc without buffers from end of buffers


    size_t buf_capacity = calculate_buf_capacity(stack_alignment_part_size, end_of_stub_size, args_size, pebuf_size);
    char* buf = (char*)malloc(buf_capacity);
    if (!buf) return NULL;
    size_t buf_size = 0;

    memcpy(buf + buf_size, stack_alignment_part, stack_alignment_part_size);
    buf_size += stack_alignment_part_size;

    // Offset to call first malloc instruction + move length to rcx
    size_t offset_to_call_first_malloc_ins = buf_size + 5;


    if (args_size > 0) {
        size_t call_malloc_size;
        char* call_malloc_code = call_malloc((int)args_size, &call_malloc_size);
        memcpy(buf + buf_size, call_malloc_code, call_malloc_size);
        buf_size += call_malloc_size;
        free(call_malloc_code);

        // mov [rsp+0x28], rax store the pointer returned by malloc
        char mov_store_rax_rsp28[] = { 0x48, 0x89, 0x44, 0x24, 0x28 };
        memcpy(buf + buf_size, mov_store_rax_rsp28, sizeof(mov_store_rax_rsp28));
        buf_size += sizeof(mov_store_rax_rsp28);

        // mov rcx, [rsp+0x28] load the pointer of args into rcx for next call
        char mov_rcx_rsp28[] = { 0x48, 0x8B, 0x4C, 0x24, 0x28 };
        memcpy(buf + buf_size, mov_rcx_rsp28, sizeof(mov_rcx_rsp28));
        buf_size += sizeof(mov_rcx_rsp28);


        for (size_t p = 0; p < args_size; p++) {
            size_t ins_size;
            char* ins = add_bytes_to_buff_alloc_opt(args[p], (int)p, &ins_size);
            memcpy(buf + buf_size, ins, ins_size);
            buf_size += ins_size;
            free(ins);
        }

        // mov rcx, [rsp+0x28] load pointer to of args before calling set_command_line
        memcpy(buf + buf_size, mov_rcx_rsp28, sizeof(mov_rcx_rsp28));
        buf_size += sizeof(mov_rcx_rsp28);

        // length of the buffe up to to call
        size_t offset_to_call_args_ins = buf_size;


        size_t call_set_command_line_size;
        char* call_set_command_line_code = call_set_command_line(&call_set_command_line_size);
        memcpy(buf + buf_size, call_set_command_line_code, call_set_command_line_size);
        buf_size += call_set_command_line_size;
        free(call_set_command_line_code);

        // Offset to call second malloc instruction + mov ins
        size_t offset_to_call_second_malloc_ins = buf_size + 5;


        size_t call_malloc_size_pe;
        char* call_malloc_code_pe = call_malloc((int)pebuf_size, &call_malloc_size_pe);
        memcpy(buf + buf_size, call_malloc_code_pe, call_malloc_size_pe);
        buf_size += call_malloc_size_pe;
        free(call_malloc_code_pe);


        char mov_store_rax_rsp20[] = { 0x48, 0x89, 0x44, 0x24, 0x20 };
        memcpy(buf + buf_size, mov_store_rax_rsp20, sizeof(mov_store_rax_rsp20));
        buf_size += sizeof(mov_store_rax_rsp20);


        char mov_rcx_rsp20[] = { 0x48, 0x8B, 0x4C, 0x24, 0x20 };
        memcpy(buf + buf_size, mov_rcx_rsp20, sizeof(mov_rcx_rsp20));
        buf_size += sizeof(mov_rcx_rsp20);


        for (size_t p = 0; p < pebuf_size; p++) {
            size_t ins_size;
            char* ins = add_bytes_to_buff_alloc_opt(pebuf[p], (int)p, &ins_size);
            memcpy(buf + buf_size, ins, ins_size);
            buf_size += ins_size;
            free(ins);
        }

        // Calculate offsets for patching call instructions with pe and args buffers
        int offset_to_set_args = (int)(buf_size + OFFSET_TO_SET_ARGS);
        int offset_to_set_malloc = (int)(buf_size + OFFSET_TO_MALLOC);


        memcpy(buf + buf_size, end_of_stub, end_of_stub_size);
        buf_size += end_of_stub_size;


        size_t call_bytes_size;
        char* call_bytes;

        // Patch first malloc call
        call_bytes = generate_call_bytes_x64((int)offset_to_call_first_malloc_ins, offset_to_set_malloc, &call_bytes_size);
        memcpy(buf + offset_to_call_first_malloc_ins, call_bytes, call_bytes_size);
        free(call_bytes);

        // Patch second malloc call
        call_bytes = generate_call_bytes_x64((int)offset_to_call_second_malloc_ins, offset_to_set_malloc, &call_bytes_size);
        memcpy(buf + offset_to_call_second_malloc_ins, call_bytes, call_bytes_size);
        free(call_bytes);

        // Patch call to set_command_line
        call_bytes = generate_call_bytes_x64((int)offset_to_call_args_ins, offset_to_set_args, &call_bytes_size);
        memcpy(buf + offset_to_call_args_ins, call_bytes, call_bytes_size);
        free(call_bytes);

    }
    else {
        size_t call_malloc_size_pe;
        char* call_malloc_code_pe = call_malloc((int)pebuf_size, &call_malloc_size_pe);
        memcpy(buf + buf_size, call_malloc_code_pe, call_malloc_size_pe);
        buf_size += call_malloc_size_pe;
        free(call_malloc_code_pe);

        //mov [rsp+0x20], rax
        char mov_store_rax_rsp20[] = { 0x48, 0x89, 0x44, 0x24, 0x20 };
        memcpy(buf + buf_size, mov_store_rax_rsp20, sizeof(mov_store_rax_rsp20));
        buf_size += sizeof(mov_store_rax_rsp20);

        //mov rcx, [rsp+0x20]
        char mov_rcx_rsp20[] = { 0x48, 0x8B, 0x4C, 0x24, 0x20 };
        memcpy(buf + buf_size, mov_rcx_rsp20, sizeof(mov_rcx_rsp20));
        buf_size += sizeof(mov_rcx_rsp20);

        for (size_t p = 0; p < pebuf_size; p++) {
            size_t ins_size;
            char* ins = add_bytes_to_buff_alloc_opt(pebuf[p], (int)p, &ins_size);
            memcpy(buf + buf_size, ins, ins_size);
            buf_size += ins_size;
            free(ins);
        }


        int offset_to_set_malloc = (int)(buf_size + OFFSET_TO_MALLOC);


        memcpy(buf + buf_size, end_of_stub, end_of_stub_size);
        buf_size += end_of_stub_size;


        size_t call_bytes_size;
        char* call_bytes;

        // Patch first malloc call no other calls
        call_bytes = generate_call_bytes_x64((int)offset_to_call_first_malloc_ins, offset_to_set_malloc, &call_bytes_size);
        memcpy(buf + offset_to_call_first_malloc_ins, call_bytes, call_bytes_size);
        free(call_bytes);
    }


    *total_size = buf_size;

    return buf;
}



int main(int argc, char* argv[]) {
    char* pe_filename = NULL;
    char* param_value = NULL;


    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--pe") == 0 && i + 1 < argc) {
            pe_filename = argv[++i];
        }
        else if (strcmp(argv[i], "--param") == 0 && i + 1 < argc) {
            param_value = argv[++i];
        }
        else {
            printf("Unknown or incomplete argument: %s\n", argv[i]);
            printf("Usage: %s --pe <pe_file> [--param <parameters>]\n", argv[0]);
            return 1;
        }
    }

    if (!pe_filename) {
        printf("Error: --pe argument is required.\n");
        printf("Usage: %s --pe <pe_file> [--param <parameters>]\n", argv[0]);
        return 1;
    }

    // Read the stubs from the assets directory
    size_t stack_alignment_part_size;
    char* stack_alignment_part = (char*)GetFileBytes("..\\..\\assets\\startofstub64.bin", &stack_alignment_part_size);
    if (!stack_alignment_part) {
        printf("Failed to read stack alignment part.\n");
        return 1;
    }

    size_t end_of_stub_size;
    char* end_of_stub = (char*)GetFileBytes("..\\..\\assets\\endofstub64.bin", &end_of_stub_size);
    if (!end_of_stub) {
        printf("Failed to read end of stub.\n");
        free(stack_alignment_part);
        return 1;
    }

    size_t pebuf_size;
    char* pebuf = (char*)GetFileBytes(pe_filename, &pebuf_size);
    if (!pebuf) {
        printf("Failed to read PE file.\n");
        free(stack_alignment_part);
        free(end_of_stub);
        return 1;
    }


    char* args = NULL;
    size_t args_size = 0;
    if (param_value) {
        args_size = strlen(param_value) + 1;
        args = (char*)malloc(args_size);
        if (!args) {
            printf("Memory allocation failed for args.\n");
            free(stack_alignment_part);
            free(end_of_stub);
            free(pebuf);
            return 1;
        }
        memcpy(args, param_value, args_size);
    }


    size_t buf_size;
    char* buffer = GenBuf(args, args_size, pebuf, pebuf_size,
        stack_alignment_part, stack_alignment_part_size,
        end_of_stub, end_of_stub_size, &buf_size);

    if (buffer) {

        if (WriteFileBytes("output.bin", buffer, buf_size)) {
            printf("Buffer successfully written to output.bin\n");
        }
        else {
            printf("Failed to open output file for writing.\n");
        }


        free(buffer);
    }
    else {
        printf("Failed to generate buffer.\n");
    }


    free(stack_alignment_part);
    free(end_of_stub);
    free(pebuf);
    if (args) {
        free(args);
    }

    return 0;
}
