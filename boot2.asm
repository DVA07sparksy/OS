;boot2.asm
; A simple x86 bootloader

[org 0x7C00]  ;BIOS loads bootloader at memor address 0x7C00

mov ah, 0x0E  ;BIOS teletype bootloader function for printing characters

mov si, message ;SI points to the message string

print:
lodsb        ;load next byte from SI into AL
cmp al, 0    ;check if character is null(end of string)
je halt      ;if yes , jump to halt

int 0x10     ; BIOS interrupt to  to print character in AL

jmp print    ;repeat for next character

halt:
jmp $    ;infinite loop to stop execution

message db 'Hello from Bootloader!', 0  

times 510-($-$$) db 0   ;fill remaining bytes with zeros 

dw 0xAA55  ;boot signature required by BIOS

