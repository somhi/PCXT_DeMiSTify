	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_HandlePS2Mouse
_HandlePS2Mouse:
	stdec	r6
	mt	r3
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
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 44
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
				// flags 42
	and	r2

						//../DeMiSTify/firmware/mouse.c, line 44
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l13
		add	r7

						//../DeMiSTify/firmware/mouse.c, line 45
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l8,0
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
l13: # 

						//../DeMiSTify/firmware/mouse.c, line 47
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l8,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/mouse.c, line 47
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 49
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 49
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 49
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 49
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7
l36: # 
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 49
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 49
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 49
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 49
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l36
		add	r7
l37: # 
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 51
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l8,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 51
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l8,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//../DeMiSTify/firmware/mouse.c, line 51
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l1,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/mouse.c, line 51
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l9,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 52
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l10,0
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

						//../DeMiSTify/firmware/mouse.c, line 55
						//pcreltotemp
	.lipcrel	l35
	add	r7
l15: # 
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 56
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l10,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/mouse.c, line 56
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 58
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_read
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 59
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 59
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 62
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l10,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l10,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/mouse.c, line 64
						//pcreltotemp
	.lipcrel	l26
	add	r7
						// freereg r1
l23: # 
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 64
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l6,0
						//static deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/mouse.c, line 64
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 64
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 64
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 67
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_init
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 68
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l8,0
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
l26: # 
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 71
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l9,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/mouse.c, line 71
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7

						//../DeMiSTify/firmware/mouse.c, line 71
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l10,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/mouse.c, line 71
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 73
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l8,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 73
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l8,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//../DeMiSTify/firmware/mouse.c, line 73
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l1,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/mouse.c, line 73
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 74
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	128
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 74
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 76
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	127
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l10,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/mouse.c, line 80
						//pcreltotemp
	.lipcrel	l35
	add	r7
l31: # 

						//../DeMiSTify/firmware/mouse.c, line 81
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l9,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r3

						//../DeMiSTify/firmware/mouse.c, line 88
						//pcreltotemp
	.lipcrel	l35
	add	r7
l21: # 

						//../DeMiSTify/firmware/mouse.c, line 88
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l9,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/mouse.c, line 88
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 91
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l8,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 91
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l8,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1

						//../DeMiSTify/firmware/mouse.c, line 91
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l1,0
						// static pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/mouse.c, line 91
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 91
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 91
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_mousebuffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 91
						//call
						//pcreltotemp
	.lipcrel	_ps2_ringbuffer_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/mouse.c, line 92
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l9,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l9,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/mouse.c, line 93
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l10,0
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
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 94
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	3500
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/mouse.c, line 94
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/mouse.c, line 94
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/mouse.c, line 94
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj tmp)
 						// static
	.liabs	l6,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1
l35: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

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
l8:
	.int	0
	.section	.data.2
l9:
	.int	0
	.section	.data.3
l10:
	.int	0
	.section	.bss.4
	.lcomm	l6,4
	.section	.data.5
l1:
	.byte	1
	.byte	255
	.byte	130
	.byte	1
	.byte	244
	.byte	0
	.section	.bss.6
	.lcomm	l2,4
