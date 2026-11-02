;***************************************************************
; @file    main_hw_proto.s
; @author  Vinay Santiago + Rachel Santos
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
			LDR r0, =(RCC_BASE + RCC_AHB2ENR)
			LDR r1, [r0]
			ORR r1, #1
			STR r1, [r0]; this code and above sets configures GPIOA clock to ON 
			
			LDR r2, =(GPIOA_BASE + GPIO_MODER)
			LDR r3, [r2]
			BIC r3, #0x00000C00
			ORR r3, #0x00000400
			STR r3, [r2] ; this code and above sets the pin mode on A to digital output
			
			LDR r4, =(GPIOA_BASE + GPIO_ODR)
			LDR r5, [r4]
			ORR r5, #0x0000020
			STR r5, [r4]
			; this code and above sets the pin mode on A to HIGH
endless	 	b endless

		ENDP
			ALIGN					
			AREA    myData, DATA, READWRITE
			ALIGN			

;********************************************************************************
; Put Your Data Here
;********************************************************************************

	END
