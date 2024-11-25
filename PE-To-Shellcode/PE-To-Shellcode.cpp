#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>


void int_to_bytes_le(int value, char* buffer, int num_bytes) {
    for (int i = 0; i < num_bytes; i++) {
        buffer[i] = (char)((value >> (8 * i)) & 0xFF);
    }
}


char* call_malloc(int length, size_t* out_size) {
    char* buf = (char*)malloc(15);
    if (!buf) return NULL;

    buf[0] = 0xB9; // mov ecx, imm32
    int_to_bytes_le(length, &buf[1], 4); // imm32 (length)

    buf[5] = 0xE8; // call rel32
    buf[6] = 0x6D;
    buf[7] = 0x7E;
    buf[8] = 0x00;
    buf[9] = 0x00;

    buf[10] = 0x48;
    buf[11] = 0x89;
    buf[12] = 0x44;
    buf[13] = 0x24;
    buf[14] = 0x20; // mov QWORD PTR [rsp+0x20], rax

    *out_size = 15;
    return buf;
}

char* add_bytes_to_buff_alloc_opt(char byte, int offset, size_t* out_size) {
    char* code;
    if (offset <= 127) {
        code = (char*)malloc(4);
        //mov BYTE PTR[rcx + offset], byte
        code[0] = 0xC6;
        code[1] = 0x41; 
        code[2] = (char)(offset & 0xFF); 
        code[3] = byte;
        *out_size = 4;
    }
    else {
        code = (char*)malloc(7);
        // mov BYTE PTR[rcx + offset], byte requires SIB byte
        code[0] = 0xC6; 
        code[1] = 0x81;
        int_to_bytes_le(offset, &code[2], 4);
        code[6] = byte;
        *out_size = 7;
    }
    return code;
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

size_t calculate_buf_length(size_t stack_alignment_part_size, size_t end_of_stub_size, size_t pebuf_size) {
    size_t total_length = 0;

    total_length += stack_alignment_part_size;
    total_length += 15; // Length of call_malloc (always 15 bytes)
    total_length += 5;  // Length of 'mov rcx, QWORD PTR [rsp+0x20]'
    total_length += end_of_stub_size;

    // Add dynamic parts
    for (size_t offset = 0; offset < pebuf_size; offset++) {
        if (offset <= 127) {
            total_length += 4; // Short offset instruction
        }
        else {
            total_length += 7; // Long offset instruction
        }
    }

    return total_length;
}

int main() {

    char stack_alignment_part[] = { 1 };
    char end_of_stub[] = { 1 };
    int size_of_pe_buf = 1024;
    char pebuf[] = { 1 };

    size_t buf_capacity = calculate_buf_length(sizeof(stack_alignment_part), sizeof(end_of_stub), size_of_pe_buf);
    char* buf = (char*)malloc(buf_capacity);
    size_t buf_size = 0;

    // Append stack_alignment_part
    size_t stack_alignment_part_size = sizeof(stack_alignment_part);
    memcpy(buf + buf_size, stack_alignment_part, stack_alignment_part_size);
    buf_size += stack_alignment_part_size;

    // Generate and append call_malloc code
    size_t call_malloc_size;
    char* call_malloc_code = call_malloc(size_of_pe_buf, &call_malloc_size);
    memcpy(buf + buf_size, call_malloc_code, call_malloc_size);
    buf_size += call_malloc_size;
    free(call_malloc_code);

    // Offsets for call instructions
    int OFFSET_TO_MALLOC = 0x84E + 0x24 + 10; // Adjust based on your actual values
    int OFFSET_TO_MALLOC_CALL_INS = 0x1F;

    // Append 'mov rcx, QWORD PTR [rsp+0x20]'
    char mov_rcx[] = {
        0x48, 0x8B, 0x4C, 0x24, 0x20 // mov rcx, QWORD PTR [rsp+0x20]
    };
    memcpy(buf + buf_size, mov_rcx, sizeof(mov_rcx));
    buf_size += sizeof(mov_rcx);


    for (int p = 0; p < sizeof(pebuf); p++) {
        size_t ins_size;
        char* ins = add_bytes_to_buff_alloc_opt(pebuf[p], p, &ins_size);
        memcpy(buf + buf_size, ins, ins_size);
        buf_size += ins_size;
        OFFSET_TO_MALLOC += ins_size;
        free(ins);
    }

    size_t end_of_stub_size = sizeof(end_of_stub);
    memcpy(buf + buf_size, end_of_stub, end_of_stub_size);
    buf_size += end_of_stub_size;


    size_t call_bytes_size;
    char* call_bytes = generate_call_bytes_x64(OFFSET_TO_MALLOC_CALL_INS, OFFSET_TO_MALLOC, &call_bytes_size);
    memcpy(buf + OFFSET_TO_MALLOC_CALL_INS, call_bytes, call_bytes_size);
    free(call_bytes);

    // Write to file
    FILE* f = fopen("C:\\test\\out.bin", "wb");
    if (f) {
        fwrite(buf, 1, buf_size, f);
        fclose(f);
    }
    else {
        printf("Failed to open file for writing.\n");
    }

    // Clean up
    free(buf);

    return 0;
}
