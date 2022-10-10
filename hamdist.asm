%include "/usr/share/csc314/asm_io.inc"


segment .data

	format	db	"Hamming distance = %d",10,0

	; the hamming distance between these is 1
	str1	db	"text",0
	str2	db	"test",0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	enter	0,0
	pusha
	;***************CODE STARTS HERE***************************

	; call your ham dist function here
	; pass str1 and str2 as arguments
	; result gets returned in EAX

	push	eax		; the returned integer from hamdist()
	push	format	; "Hamming distance = %d\n"
	call	printf
	add		esp, 8

	;***************CODE ENDS HERE*****************************
	popa
	mov	eax, 0
	leave
	ret

hamdist:

	ret

