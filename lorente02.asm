global _start

section .data
	SYS_EXIT equ 60
	RESET equ 0
	NUM_OF_DAYS equ 365
	NUM_OF_HOURS equ 24
	year dd 0
	days dd 0
	hours dd 0

section .text
_start:
	
	mov eax, NUM_OF_DAYS
	mul dword[year]
	mov dword[days], eax 
	mov dword[days+4], edx

	mov eax, RESET
	mov edx, RESET
	mov eax, NUM_OF_HOURS
	mul dword[days]
	mov dword[hours], eax
	mov dword[hours+4], edx

	mov rax, SYS_EXIT
	xor rdi, rdi
	syscall




	
