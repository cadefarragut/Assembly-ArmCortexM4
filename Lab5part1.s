;Cade Farragut and Abdulla Asad
	mov r0, #0
	LDR r3, =mi_O1
	LDR r3, [r3]
	ldr r4, =s_RT
	ldr r4, [r4]
	ldr r5, =r_T2
	ldr r6, =ack_T2
	ldr r7, =valid
	ldr r12,=size
	ldr r12, [r12]
	
	
	
	sub r12, r12, #1
loop 
	
	cmp r0, r12
	bgt stop
	
	ldr r8, [r6, r0, lsl #2] ;ack-T2
	cmp r8, #0
	beq ellse

	ldr r10, [r5, r0, lsl #2]
	eor r2, r4, r3
	eor r2, r2, r10
	cmp r8, r2
	bne ellse
	
	mov r11, #1
	str r11, [r7, r0, lsl #2] 
	
	add r0, r0, #1
	
	
	b loop



ellse
	mov r11, #0
	str r11, [r7, r0, lsl #2]
	add r0, r0, #1
	
	b loop

stop B stop


r_T2 dcd 0xffff, 0xebb0, 0x2, 0x2, 0xC85e
ack_T2 dcd 0x5011, 0x4ee8, 0x0, 0x0, 0x6d06
mi_O1 dcd 0x8C25
s_RT dcd 0x297d
size dcd 0x5
	


	AREA lab5data, data, readwrite 

valid dcd 0x0

     end