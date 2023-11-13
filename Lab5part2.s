;Cade Farragut and Abdulla Asad	

	mov r1, #0 ; count
	ldr r2, =PID
	ldr r3, =PID_Q
	ldr r4, =rank
	ldr r5, =abort
	
	
	ldr r9, [r2] ;load pid into r9
	ldr r10,[r4] ;load rank into r10
	ldr r6, [r3, r1, lsl #2] ;load pid_q at count index 
	
	b test
operation 
	ldr r6, [r3, r1, lsl #2] ;load pid_q at count index 
	cmp r6, r9
	beq rankupdate
	add r1, r1, #1
	b test
	
rankupdate	
	add r1, r1, #1
	mov r10, r1
	str r10, [r4]
	b test2
test 	
	cmp r6, #0
	bne operation
	
test2	
	cmp r6, #0
	bne operation
	
	ldr r8, [r5]
	ldr r7, [r4]
	
	cmp r7, #0
	bne ellse
	add r8, r8, #1
	str r8, [r5]
	b exit
ellse
	mov r8, #0
	str r8, [r5]
exit


PID DCD 0x2e3e4
PID_Q DCD 0x2e333, 0xd09, 0x2, 0x2e3e4, 0
STOP B STOP
	AREA LAB5PART2DATA, DATA, READWRITE	
rank dcd 0
abort dcd 0
	
     end