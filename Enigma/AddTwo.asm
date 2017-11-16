; This program demonstrates Encryption, a procedure which uses
; special Math... (Edit)

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword


INCLUDE Irvine32.inc

.data

greeting BYTE "Assembly Final Project, Enigma", 0dh, 0ah,0 ; Welcome banner 
keySize = 10					      ; Encryption Key size if we are using one
planeText BYTE "Plane Text",0			      ; User adds his text to be encrypted
hinText BYTE "More scrambled, better security!",0     ; To give a hint that more encryption is better
result BYTE "Encrypted Text is: ",0

.code

;-----------------------------------Encryption Function-----------------------------------------
; We will encrypt a string of text using sepcial math ? , the length of the 
; encryption key array will determine length and type of encryption. (Edit)

Encryption PROC 		; Encryption Function

charcheck:			; To check the location on the string text and that we have not reached its end
	mov al, [esi]
	cmp, al, 0
	ja length		; (Jump if above) To see that the character is acceptable, then we go (jump) to the key array
	jbe quit		; (Jump if below or equal) When there is no character (text) found, we need to quit

length: 			; To see that we have not reached keay's end
	cmp ecx, 0
	ja ???			; When the key is acceptable (valid) then we start our encryption math array?!!!(edit)
	jbe resetkey		; When we reach the key's end then we need to reset the key

resetkey:			; Restart the counter from the beginuing 
	mov ecx, keySize	; Zero counter
	sub edi, 10 		; Go back to the beginning of the key (size 10)(edit)

quit:				; stop loops 

ret
Encryption ENDP
-------------------------------------------------------------------------------------------------

main proc
	mov	eax,5				
	add	eax,6				

	invoke ExitProcess,0
main endp
end main
