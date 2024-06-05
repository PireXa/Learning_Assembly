.section .rodata

display_string: .asciz "Enter a number: "
len_display_string: .int 17
//this len_display_string doesnt work for some reason even though gdb prints the right value for it rdx gets a random value

mensagem: .asciz "22"
len_mensagem: .int 2

.section .bss
buffer: .skip 32

.section .text

.global _start
.intel_syntax noprefix

.global _escritor

_escritor:
	mov rax, 1
	mov rdi, 1
	syscall
	ret

_start:
	//escrever
	lea rsi, [display_string]
	mov rdx, 17
	call _escritor 

	//read
	mov rax, 0
	mov rdi, 0
	lea rsi, [rip + buffer]
	mov rdx, 32
	syscall

	lea rsi, [buffer]
	mov rdx, 32
	call _escritor

	// exit
	mov rax, 60
	mov rdi, 88
	syscall
