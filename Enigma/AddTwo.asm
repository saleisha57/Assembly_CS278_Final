
;NAMES:
;Lily McKeirnan
;Aleisha 
;Ahmed 

; This program demonstrates Encryption, a procedure which uses
; special Math... (Edit)

;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess proto,dwExitCode:dword


INCLUDE Irvine32.inc

.data
;------userinput data-------
size DWORD		;size variable


key BYTE 10 DUP(0)		;key variable
byteCount DWORD ?
keyArrayCheck DWORD 10 DUP(?)
;-----------------------



greeting BYTE "Assembly Final Project, Enigma", 0dh, 0ah,0 ; Welcome banner 
keyPrompt1 BYTE "Enter a size between 5 and 10",0
keyPrompt2 BYTE "Enter in a key made of the scambled sequential numbers between 0 and one less the size you chose:"


key BYTE ?
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
	



	mov edx, OFFSET planeText	; User text to be encrypt
	call Writestring		; Display plane text
	call Crlf			; To clear the line
	mov esi, OFFSET planeText	; Creating a pointer to the plane text array
	mov edi, OFFSET key		; Creating a pointer to the key array (edit)
	mov cl, keysize			; To count the length of the key
	call Encryption			; Using Encryption function to scramble the plane text
	mov edx, OFFSET result		; To prepare the resutl to be displayed 
	call WriteString		; Print the encrypted text
	call Crlf			; Creating a space
	
	
	
	
	
	

	invoke ExitProcess,0
main endp

;-------------------User input----------------------
userinput proc

	mov edx, OFFSET greeting
	call Writestring			;Outputting greeting
	call Crlf					;new line
	mov edx, OFFSET keypromt1		;size promt
	call WriteString			;displays promt1
	call ReadInt				;user enters integer
	mov size, eax

	;********add loop?********
	.IF(EAX < 5) || (EAX > 10)
		mov edx, OFFSET keypromt1	;size promt
		call WriteString			;displays promt1
		call ReadInt				;user enters integer
		mov size, eax	
	.END IF
	
	;eax is currently holding the size of the key

	mov edx, OFFSET keypromt2	;key definition content...
	call WriteString			;display keypromt2
	call Crlf
	mov edx, OFFSET key			;point to size
	mov ecx, SIZEOF key			;specify max characters
	call ReadString				;user input (a string of numbers)
	mov byteCount, eax			;number of characters
	mov esi, 0
	mov ecx, SIZEOF keyArrayCheck
	L1:
		mov eax,key[esi]
		mov keyArrayCheck[esi],eax
	Loop L1
		
		mov esi, 0
		mov ecx, SIZEOF keyArrayCheck
		L2:
			mov eax,keyArrayCheck[esi]
			.IF(eax > size) || (eax < 0)
				;keypromt2
			.END IF
		Loop L2

		mov esi, 0
		mov ecx, SIZEOF keyArrayCheck	
		L3:
			keyArrayCheck[esi]=keyArrayCheck[esi+1]





ret
userinput ENDP
;----------------------------------------------------------



end main
