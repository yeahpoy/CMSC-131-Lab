global _start:


section .data
	SYS_EXIT equ 60
	count db 2
	number db 25
	qtnt db 0
	rem db 0
	isPrime db 0


section .text
_start:
	mov ch, byte[count]

check_prime:
	cmp ch, byte[number]	
	je prime_change 
	mov ah, 0
	mov al, byte[number]
	div ch
	mov byte[qtnt], al
	mov byte[rem], ah
	cmp byte[rem], 0
	je exit_here
	inc ch
	jmp check_prime


prime_change:
 	mov byte[isPrime], 1

exit_here:
	mov rax, SYS_EXIT
	xor rdi, rdi
	syscall