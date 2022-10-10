%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	fmt1	db	"%d",10,0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	37
	push	25
	call	sum
	add		esp, 8

	push	eax
	push	fmt1
	call	printf


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

sum:
	; prologue
	push	ebp
	mov		ebp, esp

	; int s
	sub		esp, 4

	mov		eax, DWORD [ebp + 8]
	add		eax, DWORD [ebp + 12]
	mov		DWORD [ebp - 4], eax

	mov		eax, DWORD [ebp - 4]

	; epilogue
	mov		esp, ebp
	pop		ebp
	ret



