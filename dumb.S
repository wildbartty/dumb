	section .data

msg: db	"0x00000000" ;The string to print
	;; Clobbered on each printint iteration

len:	equ $ - msg		;length of string

mychar:	dq 0x30

msgp:	equ msg			;pointer to string

start_time:	dq 0
end_time:	dq 0

	global _start
	global main
	extern printf
	section .text

end:	
	;; mov rax, 60		;Time to exit
	;; mov rdi, 0		;Exit sucess
	;; syscall
	mov rax, 0
	mov DWORD [rax], 21


_start:
	mov rax, 201		;Get current epoch
	mov rdi, start_time	;put the time in start_time
	syscall 

	mov r8, rdi		;r8 is where the starting time is put

	mov r13,0		;r13 is the count register

	xor r11, r11		;r11 is the current loop count mod 1000000
	mov r10,4294967296	;r10 is the limit

busy_loop:

	;; mov rax, 1000	;Slow mod implementation
	;; mov rdx, 0
	;; mov rcx, r13
	;; div rcx

	inc r13
	inc r11
	cmp r11, 1000000
	je print_int
reentrent:

	cmp r13, r10
	jne busy_loop
	jmp end

print_int:			;Prints the integer in r13 to stdout, base 16

 	;; mov rax, 0xf00000000	;1111 for the first bits
 	;; lea rdi, [msg]		;mov &message to rdi
 	;; add rdi, 1		;go to 3rd char
 	;; mov cl, len	
 	;; sub cl, 3		;count - 2

print_str:

 	;; mov rdx, r13		;move the current count to rdx
 	;; and rdx, rax		;rdx = rdx and rax // mod 16 << x
 	;; shr rax, 4		;move rax to next 4 bits
 	;; shl rdx, cl		;shift left by the loop count
 	;; sub rbx, 4
 	;; add dl, 0x30
 	;; add rdi, 2

 	;; sub cl,1
 	;; cmp cl, 0
 	;; jne print_str
	mov rsi, msg		;pre store the char
	mov r11, r13		;store num to print in r11
	and r11, 0xf		;get the first nibble
	mov QWORD [rsi], r11
	add QWORD [rsi], 0x30
debug:	
	mov BYTE [rsi+1], 0x31
 	mov rax,1		;syscall to write
 	mov rdi,1		;write to stdio
 	mov rdx,8		;the len to write
 	syscall			
	mov QWORD [rsi], 0xa	;mov newline to rsi
 	mov rax,1		;syscall to write
 	mov rdi,1		;write to stdio
 	mov rdx, 1		;the len to write
 	syscall
	xor r11, r11		;reset the mod counter
	jmp reentrent
