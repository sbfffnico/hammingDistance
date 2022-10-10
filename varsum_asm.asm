%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	fmtstr		db		"%d",10,0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	30
	push	20
	push	10
	push	3
	call	sum
	add		esp, 16		; 4 * 4 to repair the stack

	push	eax
	push	fmtstr
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

sum:
	;prologue
	push	ebp
	mov		ebp, esp

	mov		ecx, DWORD [ebp + 8]	; int count

	mov		esi, 0
	mov		DWORD [ebp + esi * 4 + 12]
	inc		esi

	mov		esp, ebp
	pop		ebp
	ret


