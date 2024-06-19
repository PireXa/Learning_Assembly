.intel_syntax noprefix

//Define read-only variables, rdx is a 64-bit register so the numbers need to also be 64-bit and .quad is used to define the numbers.
//Can use .long (32-bit) instead but the register using these variables needs to also change to a 32-bit one, in this case edx.
.section .rodata

display_string: .asciz "Enter a number: "

mensagem: .asciz "Inputed number: "

len_display_string: .quad 17

len_mensagem: .quad 16

.section .bss
buffer: .skip 32

.section .text

.global _start

.global _escritor

_escritor:
	mov rax, 1
	mov rdi, 1
	syscall
	ret

_start:
	//escrever
	lea rsi, [rip + display_string]
	mov rdx, [rip + len_display_string]
	call _escritor

	//read
	mov rax, 0
	mov rdi, 0
	lea rsi, [rip + buffer]
	mov rdx, 32
	syscall

	//escrever
	lea rsi, [rip + mensagem]
	mov rdx, [rip + len_mensagem]
	call _escritor

	//escrever
	lea rsi, [rip + buffer]
	mov rdx, 32
	call _escritor

	// exit
	mov rax, 60
	mov rdi, 88
	syscall
