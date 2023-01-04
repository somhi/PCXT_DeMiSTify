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
	.global	_Menu_Draw
_Menu_Draw:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r4
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 62
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 63
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l14: # 

						//../DeMiSTify/firmware/menu.c, line 65
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 65
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	cmp	r3

						//../DeMiSTify/firmware/menu.c, line 65
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7

						//../DeMiSTify/firmware/menu.c, line 65
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 138 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 65
						//pcreltotemp
	.lipcrel	l12
	add	r7
l11: # 

						//../DeMiSTify/firmware/menu.c, line 65
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// var, auto|reg
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l12: # 

						//../DeMiSTify/firmware/menu.c, line 65
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 65
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 10
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 65
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteStart
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 66
		// Offsets 32, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 66
						//call
						//pcreltotemp
	.lipcrel	_OsdPutChar
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 67
						// (bitwise/arithmetic) 	//ops: 6, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	4
	addt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 67
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/menu.c, line 67
						//call
						//pcreltotemp
	.lipcrel	_OsdPuts
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 68
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/menu.c, line 69
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	11
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 64
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 64
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r3

						//../DeMiSTify/firmware/menu.c, line 64
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7
						// allocreg r1
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
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
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_Menu_Set
_Menu_Set:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 76
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// static
	.liabs	l1,4
						// static pe not varadr
						//sizemod based on type 0xa
	stmpdec	r2

						//../DeMiSTify/firmware/menu.c, line 77
		// Offsets 7, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
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
	.liconst	7
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 78
		// Offsets 7, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 78
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_Menu_ShowHide
_Menu_ShowHide:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
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

						//../DeMiSTify/firmware/menu.c, line 92
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 92
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7

						//../DeMiSTify/firmware/menu.c, line 93
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 93
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7

						//../DeMiSTify/firmware/menu.c, line 93
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 93
						//pcreltotemp
	.lipcrel	l23
	add	r7
l22: # 

						//../DeMiSTify/firmware/menu.c, line 93
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l23: # 

						//../DeMiSTify/firmware/menu.c, line 93
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// static
	.liabs	l2,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r3

						//../DeMiSTify/firmware/menu.c, line 95
						//pcreltotemp
	.lipcrel	l25
	add	r7
l21: # 

						//../DeMiSTify/firmware/menu.c, line 95
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// static
	.liabs	l2,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// freereg r1
						// freereg r2
l25: # 
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 96
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	and	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 96
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/menu.c, line 96
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 100
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-4
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_Menu_Visible
_Menu_Visible:
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 106
						//setreturn
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
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
	.section	.text.4
	.weak	_Menu_JoystickToAnalogue
_Menu_JoystickToAnalogue:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 113
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 64
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 114
		// Offsets -32512, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	-32512
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 114
		// Offsets 32512, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32512
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 115
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 115
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 117
						// (minus)
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	mr	r1
						// matchobj comparing flags 1 with 2
	.liconst	0
	exg r1
	sub r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 117
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	shl	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 118
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 120
						//pcreltotemp
	.lipcrel	l35
	add	r7
l31: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 120
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 120
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7

						//../DeMiSTify/firmware/menu.c, line 122
						// (bitwise/arithmetic) 	//ops: 0, 0, 6
						// (obj to r5) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 123
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 126
						//pcreltotemp
	.lipcrel	l35
	add	r7
l34: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 126
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 126
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	4
	sgn
	shr	r2
						// (save result) // isreg
						// freereg r1
l35: # 

						//../DeMiSTify/firmware/menu.c, line 127
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 127
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7

						//../DeMiSTify/firmware/menu.c, line 128
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r5 - only match against tmp
						// (save temp)isreg
	mr	r2
						//save_temp done
l37: # 

						//../DeMiSTify/firmware/menu.c, line 129
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 129
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//../DeMiSTify/firmware/menu.c, line 130
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
						// (save temp)isreg
	mr	r2
						//save_temp done
l39: # 

						//../DeMiSTify/firmware/menu.c, line 131
						// Q1 disposable
						// Z disposable
		// Offsets 0, 0
		// Have am? yes, yes
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r3
						//save_temp done
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
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
	.section	.text.5
	.weak	_Menu_Joystick
_Menu_Joystick:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 138
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	4
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 138
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 138
						//call
						//pcreltotemp
	.lipcrel	_user_io_digital_joystick_ext
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.6
	.global	_Menu_UpdateInput
_Menu_UpdateInput:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 182
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 182
						//call
						//pcreltotemp
	.lipcrel	_UpdateKeys
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 183
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menu_joy
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 130
						// matchobj comparing flags 33 with 130
						// const/deref
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 130
						// matchobj comparing flags 161 with 130
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	-24
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 184
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// matchobj comparing flags 130 with 33
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_menu_buttons
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 130
						// matchobj comparing flags 33 with 130
						// const/deref
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 130
						// matchobj comparing flags 161 with 130
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	-20
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r2
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 33
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_menu_joy
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 185
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 185
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	8
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 185
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu_joymerged, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// freereg r1
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
	.section	.text.7
	.global	_Menu_PollInput
_Menu_PollInput:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4

						//../DeMiSTify/firmware/menu.c, line 192
						//call
						//pcreltotemp
	.lipcrel	_Menu_UpdateInput
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/menu.c, line 193
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menu_longpress
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 194
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 194
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 194
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 194
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r4
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 195
		// Offsets 750, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	750
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 195
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 195
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 195
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						//Saving to reg r5
						// (save temp)isreg
	mr	r5
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	20
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_buttons
						//extern deref
						//sizemod based on type 0x3
	ldt
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 196
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
l57: # 

						//../DeMiSTify/firmware/menu.c, line 198
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 199
						//call
						//pcreltotemp
	.lipcrel	_Menu_UpdateInput
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 200
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 200
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 200
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 200
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_menu_longpress
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
l53: # 

						//../DeMiSTify/firmware/menu.c, line 196
						// (test)
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_buttons
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	20
	ldidx	r6
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 196
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 196
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 196
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
l58: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 203
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
	.global	_Menu_Run
_Menu_Run:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 210
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 211
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 213
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-20
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 215
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 33
						// var, auto|reg
						// matchobj comparing flags 1 with 33
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)store type a
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 228
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 228
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 228
		// Offsets 7, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	7
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 228
						//call
						//pcreltotemp
	.lipcrel	_Menu_PollInput
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 228
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 228
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 230
		// Offsets -1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	-1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 230
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 231
		// Offsets 90, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 231
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 233
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
l62: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 235
						// (test)
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 235
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7

						//../DeMiSTify/firmware/menu.c, line 236
						//call
						//pcreltotemp
	.lipcrel	_ToggleScandoubler
	add	r7
						// Flow control - popping 0 + 0 bytes
l64: # 

						//../DeMiSTify/firmware/menu.c, line 238
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_menu_joy
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 239
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 239
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7

						//../DeMiSTify/firmware/menu.c, line 244
		// Offsets 32768, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	32768
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 245
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_joy_keymap
						// extern pe is varadr
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1
l119: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 248
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2a type 101
						// deref 
						// (prepobj tmp)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 248
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type a
						// matchobj comparing flags 98 with 42
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/menu.c, line 248
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 248
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 248
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 248
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l73
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 249
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	or	r3
						// (save result) // isreg
l73: # 

						//../DeMiSTify/firmware/menu.c, line 250
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 246
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
				// flags 2
	//mr
	and	r0

						//../DeMiSTify/firmware/menu.c, line 246
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l119
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 254
		// Offsets 253, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 254
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 255
		// Offsets 250, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 255
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 256
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 256
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 256
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 256
						//call
						//pcreltotemp
	.lipcrel	_Menu_Joystick
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 257
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 257
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 257
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 257
						//call
						//pcreltotemp
	.lipcrel	_Menu_Joystick
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 259
						//pcreltotemp
	.lipcrel	l117
	add	r7
l66: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 261
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 263
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/menu.c, line 263
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l75
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 265
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_joy_timestamp
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 265
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 265
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 265
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 266
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 268
						//pcreltotemp
	.lipcrel	l79
	add	r7
						// freereg r1
l77: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 268
		// Offsets 160, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	160
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 268
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 268
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_joy_timestamp, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 271
						//pcreltotemp
	.lipcrel	l79
	add	r7
l75: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 271
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_joy_timestamp
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
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
l79: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 273
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 273
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l80
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 273
		// Offsets 235, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	235
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 273
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 273
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 273
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 273
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l81
		add	r7
l80: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 275
		// Offsets -5, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-5
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l81: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 280
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 280
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l83
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 280
		// Offsets 244, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	244
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 280
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 280
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 280
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 280
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l84
		add	r7
l83: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 282
		// Offsets -6, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l84: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 287
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 287
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l86
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 287
		// Offsets 245, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	245
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 287
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 287
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 287
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 287
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l87
		add	r7
l86: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 289
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 289
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l90
		add	r7

						//../DeMiSTify/firmware/menu.c, line 290
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
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
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 292
						//pcreltotemp
	.lipcrel	l91
	add	r7
l90: # 

						//../DeMiSTify/firmware/menu.c, line 292
		// Offsets -1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-1
						// (save temp)isreg
	mr	r4
						//save_temp done
l91: # 

						//../DeMiSTify/firmware/menu.c, line 293
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l87: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 296
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 296
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l92
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 296
		// Offsets 242, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	242
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 296
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 296
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 296
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 296
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l93
		add	r7
l92: # 
						// allocreg r1
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 298
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 2
						// deref 
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	7
	sgn
	cmp	r0

						//../DeMiSTify/firmware/menu.c, line 298
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l96
		add	r7

						//../DeMiSTify/firmware/menu.c, line 299
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 301
						//pcreltotemp
	.lipcrel	l97
	add	r7
l96: # 

						//../DeMiSTify/firmware/menu.c, line 301
		// Offsets -2, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-2
						// (save temp)isreg
	mr	r4
						//save_temp done
l97: # 

						//../DeMiSTify/firmware/menu.c, line 302
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l93: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 305
		// Offsets 253, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 305
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 305
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 305
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 305
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 307
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 307
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l101
		add	r7

						//../DeMiSTify/firmware/menu.c, line 308
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
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

						//../DeMiSTify/firmware/menu.c, line 310
						//pcreltotemp
	.lipcrel	l102
	add	r7
l101: # 

						//../DeMiSTify/firmware/menu.c, line 310
		// Offsets -3, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-3
						// (save temp)isreg
	mr	r4
						//save_temp done
l102: # 

						//../DeMiSTify/firmware/menu.c, line 311
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l99: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 314
		// Offsets 250, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 314
						//call
						//pcreltotemp
	.lipcrel	_TestKey
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 314
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 314
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 314
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l104
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 316
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	cmp	r0

						//../DeMiSTify/firmware/menu.c, line 316
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l106
		add	r7

						//../DeMiSTify/firmware/menu.c, line 317
		// Offsets 7, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
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
	.liconst	7
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 319
						//pcreltotemp
	.lipcrel	l107
	add	r7
l106: # 

						//../DeMiSTify/firmware/menu.c, line 319
		// Offsets -4, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-4
						// (save temp)isreg
	mr	r4
						//save_temp done
l107: # 

						//../DeMiSTify/firmware/menu.c, line 320
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
l104: # 

						//../DeMiSTify/firmware/menu.c, line 322
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/menu.c, line 322
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l109
		add	r7

						//../DeMiSTify/firmware/menu.c, line 322
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	88
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 322
						// (test)
						// (obj to tmp) flags 62 type 4
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r2

						//../DeMiSTify/firmware/menu.c, line 322
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l109
		add	r7
						// freereg r1
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 323
						//FIXME convert
						// (convert - reducing type 4 to a
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type 4
						// matchobj comparing flags 98 with 98

			// required value found in tmp
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 323
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 98
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 323
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 66
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l109: # 
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 326
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 326
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	240
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 326
		// Offsets 90, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 326
						//call
						//pcreltotemp
	.lipcrel	_Menu_PollInput
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 326
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 326
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 326
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 326
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 326
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 98
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 98
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//../DeMiSTify/firmware/menu.c, line 326
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 327
						//FIXME convert
						// (convert - reducing type 4 to a
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 34 with 34

			// required value found in tmp
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 327
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 327
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 2
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l112: # 
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 338
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/menu.c, line 338
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l115
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 339
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 339
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l115: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 341
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 341
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l117
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 341
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 341
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 341
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 341
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l117
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 343
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 343
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 344
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 344
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 345
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
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
l117: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.9
	.global	_Menu_Message
_Menu_Message:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r4
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3
						// allocreg r2
						// allocreg r1
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 352
						// (bitwise/arithmetic) 	//ops: 2, 0, 6
						//Special case - addt
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	77
	addt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 353
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	81
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 353
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 354
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/menu.c, line 354
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 356
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	4
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 356
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type a
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 357
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 357
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 358
						// Z disposable
		// Offsets 0, 0
		// Have am? no, yes
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type a
						// deref 
	ld	r6
						// (save temp)store type a
	st	r3
						//save_temp done
						// freereg r3
l124: # 
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 360
						// (test)
						// (obj to tmp) flags 42 type a
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/menu.c, line 360
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l125
		add	r7

						//../DeMiSTify/firmware/menu.c, line 360
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 360
						//pcreltotemp
	.lipcrel	l126
	add	r7
l125: # 

						//../DeMiSTify/firmware/menu.c, line 360
		// Offsets 1, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l126: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 360
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 360
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 361
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
	ldidx	r6

						//../DeMiSTify/firmware/menu.c, line 361
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l129
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 361
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 361
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 361
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/menu.c, line 361
						//pcreltotemp
	.lipcrel	l130
	add	r7
l129: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 361
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l130: # 

						//../DeMiSTify/firmware/menu.c, line 361
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj tmp)
 						// static
	.liabs	l3,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.data.a
	.weak	_joy_keymap
_joy_keymap:
	.byte	88
	.byte	18
	.byte	17
	.byte	20
	.byte	29
	.byte	27
	.byte	28
	.byte	35
	.byte	90
	.byte	89
	.byte	145
	.byte	148
	.byte	245
	.byte	242
	.byte	235
	.byte	244
	.section	.data.b
	.global	_joy_timestamp
_joy_timestamp:
	.int	0
	.section	.bss.c
	.global	_menu_longpress
	.comm	_menu_longpress,1
	.section	.bss.d
	.global	_menu_buttons
	.comm	_menu_buttons,4
	.section	.bss.e
	.global	_menu_joy
	.comm	_menu_joy,4
	.section	.bss.f
	.global	_menu_joymerged
	.comm	_menu_joymerged,4
	.section	.data.10
l2:
	.int	0
	.section	.data.11
l3:
	.int	0
	.section	.bss.12
	.lcomm	l1,4
	.section	.bss.13
	.lcomm	l4,4
