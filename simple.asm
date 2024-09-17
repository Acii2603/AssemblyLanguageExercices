%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

string_parse:
    ;punem caracterul curent in al ( al egal plain[i] )
    mov al, [esi]
    ;shiftam caracterul respectiv cu step 
    add al, dl
    ;daca al - 'Z' mai mic ca 0 scade 26 din el ca sa ramanem in limitele alfabetului
    cmp al, 'Z'
    jle not_bigger
    	sub al, 26
not_bigger:
    
    ;punem caracterul shiftat in enc_string
    mov [edi], al
    ;trecem la urmatorul caracter in ambele siruri
    inc edi
    inc esi
    
    ;cat timp len mai mare ca 0
    loop string_parse


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
