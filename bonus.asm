section .data

section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
        
    ; acelasi principiu ca la 4
    ; daca nu am vecin la S, sar direct la N
    cmp eax, 0
    je N
    ; verificam daca putem pune la V
    cmp ebx, 0
    je SE
    ;calculam SV
       
    push ecx
    ;punem in edx 1, pe care dupa il shiftam de y ori
    ;astfel creand coloana noua
	mov edx, 1
	
	mov cl, bl
	dec ecx
	
	shl dl, cl
	
	pop ecx
	;verificam daca S este in board[0] sau board[1]
    cmp eax, 5
    jge SV2
    ;adaugam la vecinii corespunzatori 1
    add byte [ecx + eax + 3], dl
    jmp SE
SV2:
	add byte [ecx + eax - 5], dl

	;analog pentru toate celelalte cazuri	
SE:
	cmp ebx, 7
	je N
	
	push ecx
	mov edx, 1
	
	mov cl, bl
	inc ecx
	
	shl dl, cl
	
	pop ecx
	
    cmp eax, 5
    jge SV3
    
    add byte [ecx + eax + 3], dl
    jmp N
SV3:
	add byte [ecx + eax - 5], dl


N:
	cmp eax, 7
	je FIN
	
	cmp ebx, 0 
	je NE
    
    push ecx
	mov edx, 1
	
	mov cl, bl
	dec ecx
	
	shl dl, cl
	
	pop ecx
	
    cmp eax, 3
    jge SV4
    
    add byte [ecx + eax + 5], dl
    jmp NE
SV4:
	add byte [ecx + eax - 3], dl
	
NE:
	cmp ebx, 7
	je FIN
	

    push ecx
	mov edx, 1
	
	mov cl, bl
	inc ecx
	
	shl dl, cl
	
	pop ecx
	
    cmp eax, 3
    jge SV5
    
    add byte [ecx + eax + 5], dl
    jmp FIN
SV5:
	add byte [ecx + eax - 3], dl
	
FIN:



    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
