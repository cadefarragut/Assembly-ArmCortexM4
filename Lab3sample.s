; Cade Farragut and Abdulla Asad 


Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


Heap_Size       EQU     0x00000C00

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     WDT_IRQHandler            ;  0:  Watchdog Timer
                DCD     RTC_IRQHandler            ;  1:  Real Time Clock
                DCD     TIM0_IRQHandler           ;  2:  Timer0 / Timer1
                DCD     TIM2_IRQHandler           ;  3:  Timer2 / Timer3
                DCD     MCIA_IRQHandler           ;  4:  MCIa
                DCD     MCIB_IRQHandler           ;  5:  MCIb
                DCD     UART0_IRQHandler          ;  6:  UART0 - DUT FPGA
                DCD     UART1_IRQHandler          ;  7:  UART1 - DUT FPGA
                DCD     UART2_IRQHandler          ;  8:  UART2 - DUT FPGA
                DCD     UART4_IRQHandler          ;  9:  UART4 - not connected
                DCD     AACI_IRQHandler           ; 10: AACI / AC97
                DCD     CLCD_IRQHandler           ; 11: CLCD Combined Interrupt
                DCD     ENET_IRQHandler           ; 12: Ethernet
                DCD     USBDC_IRQHandler          ; 13: USB Device
                DCD     USBHC_IRQHandler          ; 14: USB Host Controller
                DCD     CHLCD_IRQHandler          ; 15: Character LCD
                DCD     FLEXRAY_IRQHandler        ; 16: Flexray
                DCD     CAN_IRQHandler            ; 17: CAN
                DCD     LIN_IRQHandler            ; 18: LIN
                DCD     I2C_IRQHandler            ; 19: I2C ADC/DAC
                DCD     0                         ; 20: Reserved
                DCD     0                         ; 21: Reserved
                DCD     0                         ; 22: Reserved
                DCD     0                         ; 23: Reserved
                DCD     0                         ; 24: Reserved
                DCD     0                         ; 25: Reserved
                DCD     0                         ; 26: Reserved
                DCD     0                         ; 27: Reserved
                DCD     CPU_CLCD_IRQHandler       ; 28: Reserved - CPU FPGA CLCD
                DCD     0                         ; 29: Reserved - CPU FPGA
                DCD     UART3_IRQHandler          ; 30: UART3    - CPU FPGA
                DCD     SPI_IRQHandler            ; 31: SPI Touchscreen - CPU FPGA
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

;Reset_Handler   PROC
                ;EXPORT  Reset_Handler             [WEAK]
                ;IMPORT  SystemInit
                ;IMPORT  __main
                ;LDR     R0, =SystemInit
                ;BLX     R0
                ;LDR     R0, =__main
                ;BX      R0
                ;ENDP
				

; &&&&&&& code could go here if no read/write data area
; &&&&&&&    but if read/write data area, then place at end


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WDT_IRQHandler            [WEAK]
                EXPORT  RTC_IRQHandler            [WEAK]
                EXPORT  TIM0_IRQHandler           [WEAK]
                EXPORT  TIM2_IRQHandler           [WEAK]
                EXPORT  MCIA_IRQHandler           [WEAK]
                EXPORT  MCIB_IRQHandler           [WEAK]
                EXPORT  UART0_IRQHandler          [WEAK]
                EXPORT  UART1_IRQHandler          [WEAK]
                EXPORT  UART2_IRQHandler          [WEAK]
                EXPORT  UART3_IRQHandler          [WEAK]
                EXPORT  UART4_IRQHandler          [WEAK]
                EXPORT  AACI_IRQHandler           [WEAK]
                EXPORT  CLCD_IRQHandler           [WEAK]
                EXPORT  ENET_IRQHandler           [WEAK]
                EXPORT  USBDC_IRQHandler          [WEAK]
                EXPORT  USBHC_IRQHandler          [WEAK]
                EXPORT  CHLCD_IRQHandler          [WEAK]
                EXPORT  FLEXRAY_IRQHandler        [WEAK]
                EXPORT  CAN_IRQHandler            [WEAK]
                EXPORT  LIN_IRQHandler            [WEAK]
                EXPORT  I2C_IRQHandler            [WEAK]
                EXPORT  CPU_CLCD_IRQHandler       [WEAK]
                EXPORT  SPI_IRQHandler            [WEAK]

WDT_IRQHandler
RTC_IRQHandler
TIM0_IRQHandler
TIM2_IRQHandler
MCIA_IRQHandler
MCIB_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
UART2_IRQHandler
UART3_IRQHandler
UART4_IRQHandler
AACI_IRQHandler
CLCD_IRQHandler
ENET_IRQHandler
USBDC_IRQHandler
USBHC_IRQHandler
CHLCD_IRQHandler
FLEXRAY_IRQHandler
CAN_IRQHandler
LIN_IRQHandler
I2C_IRQHandler
CPU_CLCD_IRQHandler
SPI_IRQHandler
                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap

__user_initial_stackheap PROC
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
                ENDP

                ALIGN

                ENDIF




;     global reset_handler
        EXPORT  Reset_Handler

; &&&&&&& insert code "AREA" specification here
	     AREA Prog1, CODE, READONLY

	 entry

	 
Reset_Handler

; &&&&&&& insert body of code here
; &&&&&&& insert data AREA, if any, after code AREA
	LDR r0, =0x00				; load registers with given values
	LDR r1, =0x31F1D1B9
	LDR r2, =0x9F46452E
	LDR r3, =0x0C82B182
	LDR r4, =0x2A078CE2

	BIC r1, r1, #0x00FFFFFF		; clears the instructed bits and shifts leftover bits to LSB
	LSR r1, r1, #24
	BIC r2, r2, #0xFF00FFFF
	LSR r2, r2, #16
	BIC r3, r3, #0xFFFF00FF
	LSR r3, r3, #8
	BIC r4, r4, #0xFFFFFF00
	
	ADD r6, r1, r2				; adds together r1, r2, r3, r4
	ADD r7, r3, r4
	ADD r5, r6, r7
	
	CMP r0, r5				;compares r0 and r5
	BGT Finish				; if r0>r5 go to finish function
	BLE Math				; if r0<r5 go to math function

Math
	LSL r1, r1, #24			; shift bits back to original bit location and adds them together
	LSL r2, r2, #16
	LSL r3, r3, #8
	ADD r6, r1, r2
	ADD r7, r3, r4
	ADD r5, r6, r7
	B Finish				; benches to finish function


Finish
stop B stop			; stop code

     end