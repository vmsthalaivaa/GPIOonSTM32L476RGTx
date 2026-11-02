;***************************************************************
; @file    main_hw_proto.s
; @author  Vinay Santiago
; @note
;           This code is for the book "Embedded Systems with ARM Cortex-M 
;           Microcontrollers in Assembly Language and C, Yifeng Zhu, 
;           ISBN-13: 978-0982692639, ISBN-10: 0982692633 as used at Santa Clara University
;*******************************************************************************



	INCLUDE core_cm4_constants.s		; Load Constant Definitions
	INCLUDE stm32l476xx_constants.s   
	
			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC
	
			ldr		r0, =counter
			ldr		r1, [r0]
loop		subs	r1,#1
			bne		loop
endless		b		endless

		ENDP
			ALIGN						
			AREA    myData, DATA, READWRITE
			ALIGN			

counter		DCD		10

	END
