	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_GetTimer
_GetTimer:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/timer.c, line 5
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 103
						// matchobj comparing flags 33 with 64
						// const/deref
						// matchobj comparing flags 1 with 64
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 64
	.liconst	-56
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/timer.c, line 6
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 33
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_CheckTimer
_CheckTimer:
	stdec	r6
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/timer.c, line 13
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 21 type 103
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-56
						//sizemod based on type 0x103
	ldt
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/timer.c, line 14
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
	.liconst	-2147483648
	cmp	r1

						//../DeMiSTify/firmware/timer.c, line 14
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l5
		add	r7

						//../DeMiSTify/firmware/timer.c, line 14
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/timer.c, line 14
						//pcreltotemp
	.lipcrel	l6
	add	r7
l5: # 

						//../DeMiSTify/firmware/timer.c, line 14
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
l6: # 
						// allocreg r1

						//../DeMiSTify/firmware/timer.c, line 14
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
						//Saving to reg r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						//No need to mask - same size
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

