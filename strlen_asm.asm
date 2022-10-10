%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	teststr1	db	"abcdefghijklmnopqrstuvwxy",0
	;teststr2	db	"abc",0
	fmtstr		db	"%d",10,0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	teststr1 ; vs DWORD [teststr] - just the pointer and not the data
	;push	teststr2
	call 	strlen
	add		esp, 4

	push	eax
	push	fmtstr
	call	printf
	add		esp, 8


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

strlen:
	; prologue
	push	ebp
	mov		ebp, esp

	; int len
	sub		esp, 4

	; len = 0
	mov		DWORD [ebp - 4], 0

	mov		esi, DWORD [ebp + 8]	; s
	toploop:
	mov		ecx, DWORD [ebp - 4]	; len
	cmp		BYTE [esi + ecx], 0 	; s[len] != 0
	je		endloop
		inc		DWORD [ebp - 4]		; len++
	jmp		toploop
	endloop:

	mov 	eax, DWORD [ebp - 4]	; return len;

	; epilogue
	mov		esp, ebp
	pop		ebp
	ret



