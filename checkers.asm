
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE


    ;calculam pozitia elementului dat
    mov edx, eax
    imul edx, edx, 8
    add edx, ebx
    
    
    mov esi, ecx
    add esi, edx
    
    ; daca nu am vecin la S, sar direct la N
    cmp eax, 0
    je N
    ; verificam daca putem pune la V
    cmp ebx, 0
    je SE
    ;calculam SV
    ;Explicatie SV(modul de calcul e asemanator pentru celelalte directii)
    ;x de coordonate i si j
    ; i - 1 j - 1   i - 1  j + 1
    ;             x
    ; i + 1 j - 1   i + 1  j + 1
    ; datorita faptului ca matricea are forma fixa de 8x8, putem rescrie
    ; relatiile astfel
    ; x - 9     x - 7
    ;        x
    ; x + 7     x + 9
    ; aplicam formula pentru fiecare directie, tinand cont sa ne incadram
    ; in matrice
    sub esi, 9
    mov byte [esi], 1
    add esi, 9
	
SE:
	cmp ebx, 7
	je N
	
	sub esi, 7
	mov byte [esi], 1
	add esi, 7


N:
	cmp eax, 7
	je FIN
	
	cmp ebx, 0 
	je NE
    
	add esi, 7
	mov byte [esi], 1
	sub esi, 7
	
NE:
	cmp ebx, 7
	je FIN
	

	add esi, 9
	mov byte [esi], 1
	sub esi, 9
	
FIN:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
