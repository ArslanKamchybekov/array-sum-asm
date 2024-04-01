section .data
    array dd 1, 2, 3, 4, 5     ; Array of integers
    array_size equ ($ - array) / 4   ; Calculate the size of the arr: 4 bytes each

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, array       ; Load the address of the array into esi
    xor ecx, ecx         ; Clear ecx register to use as a counter for looping
    mov eax, 0           ; Clear eax register to store the sum

sum_loop:
    cmp ecx, array_size  ; Compare counter with array size
    jge end_sum          ; If counter >= array_size, end the loop
    add eax, [esi + ecx * 4]  ; Add the value at array[ecx] to eax, offset = base_address + (index * element_size)
    inc ecx              ; Increment the counter
    jmp sum_loop         ; Continue looping

end_sum:
    ; Exit the program
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80          ; call kernel
