global _start

section .data
	SYS_EXIT equ 60
	inputA db 15
	inputB db 21
	inputC db 7
	largestNum db 0
	largestInput db "N"
	varA equ "A"
	varB equ "B"
	varC equ "C"


section .text

_start:
	mov ah, byte[inputA]
	cmp byte[inputB], ah
	jb larger_a  				; if B is less than A
	
	; if B > A
	mov ah, byte[inputB]
	mov byte[largestNum], ah
	mov byte[largestInput], varB
	jmp compare_to_C

larger_a:
	mov ah, byte[inputA]
	mov byte[largestNum], ah
	mov byte[largestInput], varA

compare_to_C:
	mov bh, byte[largestNum]
	cmp byte[inputC], bh 		
	jb largest_num 				; if C < largest_num

	;if C > largestNum
	mov bh, byte[inputC]
	mov byte[largestNum], bh
	mov byte[largestInput], varC
	jmp exit_here

largest_num:
	jmp exit_here


exit_here:
	mov rax, SYS_EXIT
	xor rdi, rdi
	syscall