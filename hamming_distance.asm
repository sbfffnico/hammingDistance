; Nico Edrich
; Hamming Distance assignment

%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	format	db	"Hamming distance = %d",10,0

	str1	db	"texttexttexttext",0
	str2	db	"testtelltoldbold",0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	str2		; ebp + 12
	push	str1		; ebp + 8
	call	hamdist
	add		esp, 8

	push	eax
	push	format
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

hamdist:
	; prologue
	push	ebp
	mov		ebp, esp
	;

	; int c , unmatched
	sub		esp, 8
	; unmatched = 0
	mov		DWORD [ebp - 8], 0
	; c = 0
	mov		DWORD [ebp - 4], 0

	toploop:
	mov		ecx, DWORD [ebp - 4]	; c
	mov		eax, DWORD [ebp + 8]	; str1
	mov		edx, DWORD [ebp + 12]	; str2
	cmp		BYTE [eax + ecx], 0		; check for null terminator
	je		endloop
	; found when researching objdump of c file
	; works perfect this way but unsure if allowed to use as not yet taught
	;movzx	eax, BYTE [eax + ecx]
	;movzx	edx, BYTE [edx + ecx]
	;
	mov		al, BYTE [eax + ecx]
	mov		dl, BYTE [edx + ecx]
	inc		DWORD [ebp - 4]			; increment c
	cmp		al, dl					; compare elements of string
	je		toploop
	inc		DWORD [ebp - 8]			; increment unmatched
	jmp 	toploop
	endloop:

	mov		eax, DWORD [ebp - 8]	; unmatched total

	; epilogue
	mov		esp, ebp
	pop		ebp
	ret
	;