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
	.global	_ps2_ringbuffer_init
_ps2_ringbuffer_init:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/ps2.c, line 27
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 501
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)store type 1
	stbinc	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 28
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 501
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_ps2_ringbuffer_read
_ps2_ringbuffer_read:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4

						//../DeMiSTify/firmware/ps2.c, line 53
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 64
						// deref 
	byt
	ld	r5
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 53
						// (bitwise/arithmetic) 	//ops: 6, 0, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	addt	r5
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 53
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 62 type 501
						// matchobj comparing flags 98 with 66
						// deref 
	byt
	ld	r4
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 53
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 138
						// matchobj comparing flags 106 with 10
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/ps2.c, line 53
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7

						//../DeMiSTify/firmware/ps2.c, line 54
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	-1
	mr	r0

						//../DeMiSTify/firmware/ps2.c, line 55
						//pcreltotemp
	.lipcrel	l3
	add	r7
l6: # 

						//../DeMiSTify/firmware/ps2.c, line 55
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 56
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	2
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/ps2.c, line 56
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 74
						// deref 
	byt
	ld	r4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 56
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 4, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
	addt	r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/ps2.c, line 56
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r3
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 57
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 106
						// deref 
	byt
	ld	r4
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 57
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 98
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 57
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 10
	.liconst	7
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 57
						//FIXME convert
						// (convert - reducing type 403 to 501
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
						//Saving to reg r0
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 58
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 59
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 101
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r0
						//save_temp done
						// freereg r3
						// freereg r1
l3: # 
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_ps2_ringbuffer_receive
_ps2_ringbuffer_receive:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/ps2.c, line 64
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	24
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	255
	and	r2
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/ps2.c, line 64
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	addt	r4
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 64
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 74
						// deref 
	byt
	ld	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 64
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 98
						// reg r3 - only match against tmp
	mt	r3
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3

						//../DeMiSTify/firmware/ps2.c, line 64
						// Q1 disposable
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 501
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/ps2.c, line 65
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 74
						// deref 
	byt
	ld	r4
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 65
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 98
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 65
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 10
	.liconst	7
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 65
						// Z disposable
						//FIXME convert
						// (convert - reducing type 403 to 501
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r4
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r4
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_ps2_ringbuffer_count
_ps2_ringbuffer_count:
	stdec	r6
	.liconst	-16
	add	r6
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 70
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 1
						// deref 
	byt
	ld	r1
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 70
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 70
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 62 type 501
						// matchobj comparing flags 98 with 66
						// deref 
	byt
	ld	r2
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 70
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 138
						// matchobj comparing flags 106 with 10
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	sgn
	cmp	r0

						//../DeMiSTify/firmware/ps2.c, line 70
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7

						//../DeMiSTify/firmware/ps2.c, line 71
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// matchobj comparing flags 98 with 10
						// deref 
	byt
	ld	r1
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 71
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 62 type 501
						// matchobj comparing flags 98 with 98
						// deref 
	byt
	ld	r2
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 71
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 138
						// matchobj comparing flags 106 with 10
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 106
						// matchobj comparing flags 10 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 10
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 71
						//setreturn
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0

						//../DeMiSTify/firmware/ps2.c, line 72
						//pcreltotemp
	.lipcrel	l9
	add	r7
l12: # 

						//../DeMiSTify/firmware/ps2.c, line 72
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 62 type 501
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 72
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 98
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 72
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 62 type 501
						// matchobj comparing flags 98 with 138
						// matchobj comparing flags 98 with 10
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 72
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 403
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10
						// var, auto|reg
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 10
	.liconst	4
						//sizemod based on type 0x403
	ldidx	r6
	mr	r0
						// (obj to tmp) flags a type 403
						// matchobj comparing flags 10 with 10
						// matchobj comparing flags 10 with 10
						// var, auto|reg
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	8
						//sizemod based on type 0x403
	ldidx	r6
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x403, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 10
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/ps2.c, line 72
						//setreturn
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
l9: # 
						// freereg r1
						// freereg r2
	.liconst	-16
	sub	r6
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
	.section	.text.4
	.global	_PS2Handler
_PS2Handler:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r2

						//../DeMiSTify/firmware/ps2.c, line 85
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/ps2.c, line 87
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-32
						//sizemod based on type 0x503
	ldt
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 88
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 33
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2048
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/ps2.c, line 88
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l16
		add	r7

						//../DeMiSTify/firmware/ps2.c, line 89
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 89
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 89
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_receive
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l16: # 
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 114
						//call
						//pcreltotemp
	.lipcrel	_GetInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/ps2.c, line 114
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x403, flags 0x6a
	mt	r0
	st	r6

						//../DeMiSTify/firmware/ps2.c, line 115
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_PS2Init
_PS2Init:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 120
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 120
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_init
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/ps2.c, line 124
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_PS2Handler
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/ps2.c, line 124
						//call
						//pcreltotemp
	.lipcrel	_SetIntHandler
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/ps2.c, line 125
						//call
						//pcreltotemp
	.lipcrel	_ClearKeyboard
	add	r7
						// Deferred popping of 0 bytes (0 in total)
	ldinc	r6
	mr	r7

	.section	.bss.6
	.global	_kbbuffer
	.comm	_kbbuffer,10
