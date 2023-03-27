puts:      
	cmp [si], byte 0
	je end_put
		
	mov al, [si]
	call putc
	inc si
	jmp puts

putc:
	mov ah, 0x0E ; TeleTYpe output
	mov bh, 0x0
	mov bl, 0x07
	int 0x10
	ret

end_put:
	ret
