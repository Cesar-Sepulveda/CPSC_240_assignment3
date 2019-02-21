;Cesar Sepulveda
;Date:2/20/19
;CPSC 240
;Assignment # 3:
;Write a program that displays the same string in four different colors, using a loop. 
;Call the Set-TextColor procedure from the book's link library. Any colors maybe chosen, 
;but you may find it easiest to change the foreground color.

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

INCLUDE Irvine32.ivn								;Including the irvine library

.data
	str1 BYTE "Different colored string.", 0			;Initializing a string
.code

main PROC
	mov ecx, 4										;Setting the loop counter
	mov eax,yellow + (blue * 16)					;Multiplying the backround color(blue) by 16, then adding it
													;to the foreground color (yellow) in eax

	L1:												;Initialzing the loop
		call SetTextColor							;Calling the SetTextColor function to change the color
		mov edx, OFFSET str1						;Moving the string to the edx register
		call WriteString							;Calling the WriteString function to output the string
		call Crlf									;Calling Crlf to end the line
		add eax, 2									;Changing the value of eax

	loop L1											;Looping L1

	INVOKE ExitProcess, 0
main ENDP
END main
