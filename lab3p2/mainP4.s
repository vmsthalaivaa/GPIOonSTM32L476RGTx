;***************************************************************
; @file    main.s
; @author  Vinay Santiago + Rachel Santos
; @date    October 14, 2026
; @note
;           This code is for the book "Embedded Systems with ARM Cortex-M 
;           Microcontrollers in Assembly Language and C, Yifeng Zhu, 4th ed.
;           ISBN-13: 978-0982692677, ISBN-10: 0982692676 as used at Santa Clara University
;*******************************************************************************



	INCLUDE core_cm4_constants.s		; Load Constant Definitions
	INCLUDE stm32l476xx_constants.s   
	
			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
						
				
__main	PROC
	
;********************************************************************************
; Put Your Code Here
;********************************************************************************
beginning
			LDR r0, =(RCC_BASE + RCC_AHB2ENR)
			LDR r1, [r0]
			ORR r1, #2
			STR r1, [r0]; this code and above sets configures GPIOB clock to ON 
			
			LDR r2, =(GPIOB_BASE + GPIO_MODER)
			LDR r3, [r2]
			BIC r3, #0x000000FF
			BIC r3, #0x00000F00
			ORR r3, #0x00000055
			ORR r3, #0x00000500
			STR r3, [r2] ; this code and above sets the pin mode on B to digital output
			
			LDR r4, =(GPIOB_BASE + GPIO_ODR)
			LDR r5, [r4]
			ORR r5, #0x00000001
			STR r5, [r4]
			; this code and above sets the pin mode on B to HIGH
			MOV r6, #0x00040000
loop0
			subs r6, #1
			cmp r6, #0
			bne loop0
			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]
			MOV r6, #0x00040000
loop1
			subs r6, #1
			cmp r6, #0
			bne loop1
			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]		
			MOV r6, #0x00040000
loop2
			subs r6, #1
			cmp r6, #0
			bne loop2
			
			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]	
			MOV r6, #0x00040000
loop3
			subs r6, #1
			cmp r6, #0
			bne loop3

			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]	
			MOV r6, #0x00040000
loop4
			subs r6, #1
			cmp r6, #0
			bne loop4

			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]	
			MOV r6, #0x00040000
loop5
			subs r6, #1
			cmp r6, #0
			bne loop5

			LSL r5, #0x00000001
			ADD r5, #1
			STR r5, [r4]	
			MOV r6, #0x00040000
loop6
			subs r6, #1
			cmp r6, #0
			bne loop6

			BIC r5, #0x0000003F
			STR r5, [r4]
			MOV r6, #0x00040000
loop7
			subs r6, #1
			cmp r6, #0
			bne loop7			
			b beginning
			
endless	 	b endless

		ENDP
			ALIGN					
			AREA    myData, DATA, READWRITE
			ALIGN			

;********************************************************************************
; Put Your Data Here
;********************************************************************************

	END
