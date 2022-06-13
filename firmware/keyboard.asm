	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_HandlePS2RawCodes
_HandlePS2RawCodes:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 43
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 64
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 64
						// extern (offset 0)
	.liabs	_kbbuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 43
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 43
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//../DeMiSTify/firmware/keyboard.c, line 43
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/keyboard.c, line 43
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l27
		add	r7
l26: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 45
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	240
	cmp	r3

						//../DeMiSTify/firmware/keyboard.c, line 45
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l9
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 46
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l3,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 47
						//pcreltotemp
	.lipcrel	l13
	add	r7
l9: # 

						//../DeMiSTify/firmware/keyboard.c, line 47
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	224
	cmp	r3

						//../DeMiSTify/firmware/keyboard.c, line 47
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l12
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 48
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 50
						//pcreltotemp
	.lipcrel	l13
	add	r7
l12: # 

						//../DeMiSTify/firmware/keyboard.c, line 51
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/keyboard.c, line 51
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 51
						// (bitwise/arithmetic) 	//ops: 4, 0, 5
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	128
	addt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 51
						//pcreltotemp
	.lipcrel	l16
	add	r7
l15: # 

						//../DeMiSTify/firmware/keyboard.c, line 51
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
l16: # 

						//../DeMiSTify/firmware/keyboard.c, line 52
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/keyboard.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_keytable
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	15
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 53
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/keyboard.c, line 53
						//comp
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r2 - only match against tmp
						// matchobj comparing flags 1 with 74
	.liconst	-1
	xor	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 53
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/keyboard.c, line 53
						// Q1 disposable
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r1
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 55
						//pcreltotemp
	.lipcrel	l19
	add	r7
l18: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_keytable
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	15
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 55
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// const
	.liconst	3
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/keyboard.c, line 55
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/keyboard.c, line 55
						// Q1 disposable
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r2 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 6a type 103
						// matchobj comparing flags 106 with 74
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r1
						// freereg r2
						// freereg r1
l19: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 57
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/keyboard.c, line 57
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 59
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 66
						// deref
						// const to r0
						// matchobj comparing flags 1 with 66
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	545
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 60
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 61
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/keyboard.c, line 61
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 62
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 2
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	224
						// (save temp)store type 3
	st	r0
						//save_temp done
l23: # 

						//../DeMiSTify/firmware/keyboard.c, line 63
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/keyboard.c, line 63
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l25
		add	r7

						//../DeMiSTify/firmware/keyboard.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 2
						// deref
						// const to r0
						// matchobj comparing flags 1 with 2
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	240
						// (save temp)store type 3
	st	r0
						//save_temp done
l25: # 

						//../DeMiSTify/firmware/keyboard.c, line 65
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 66
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 66
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	545
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done
l21: # 

						//../DeMiSTify/firmware/keyboard.c, line 70
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 71
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l3,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l13: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 43
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

						//../DeMiSTify/firmware/keyboard.c, line 43
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 43
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//../DeMiSTify/firmware/keyboard.c, line 43
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r3

						//../DeMiSTify/firmware/keyboard.c, line 43
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
l27: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 74
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.data.1
l3:
	.int	0
	.section	.data.2
l4:
	.int	0
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
	.weak	_UpdateKeys
_UpdateKeys:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 80
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/keyboard.c, line 80
						//call
						//pcreltotemp
	.lipcrel	_HandlePS2RawCodes
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 80
						//setreturn
						// (obj to r0) flags 4a type 3
						// reg r0 - only match against tmp
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
	.section	.text.4
	.global	_ClearKeyboard
_ClearKeyboard:
	stdec	r6
						// allocreg r2

						//../DeMiSTify/firmware/keyboard.c, line 86
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l36: # 
						// allocreg r1

						//../DeMiSTify/firmware/keyboard.c, line 87
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 87
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_keytable
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 87
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r1
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 87
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 87
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16
	sgn
	cmp	r2

						//../DeMiSTify/firmware/keyboard.c, line 87
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l36
		add	r7
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_TestKey
_TestKey:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 93
						//call
						//pcreltotemp
	.lipcrel	_DisableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// allocreg r2

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 6, 0, 3
						// (obj to r2) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_keytable
						// extern pe is varadr
	add	r2
						// (save result) // isreg
						// allocreg r4

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 6, 0, 5
						// (obj to r4) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	15
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mul	r4
						// (save result) // isreg
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 103
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 2, 5, 4
						// (obj to r3) flags 4a type 103
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	mr	r3
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r4 - only match against tmp
	mt	r4
	shr	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 94
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	3
	and	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 94
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size

						//../DeMiSTify/firmware/keyboard.c, line 95
						// (bitwise/arithmetic) 	//ops: 0, 5, 5
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r4 - only match against tmp
	mt	r4
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/keyboard.c, line 95
						//comp
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r4 - only match against tmp
						// matchobj comparing flags 1 with 74
	.liconst	-1
	xor	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/keyboard.c, line 95
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/keyboard.c, line 95
						// Q1 disposable
						// Q2 disposable
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x6a
	mt	r0
	st	r2
						// freereg r4
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/keyboard.c, line 96
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/keyboard.c, line 97
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// freereg r3
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.data.6
	.global	_keytable
_keytable:
	.int	0
	.space	60
