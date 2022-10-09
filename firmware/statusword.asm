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
	.weak	_sendstatus
_sendstatus:
	stdec	r6
						// allocreg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 14
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 15
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	33
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 16
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	30
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 17
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 503
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x503
	ldt
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 18
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	8
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//../DeMiSTify/firmware/statusword.c, line 19
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//../DeMiSTify/firmware/statusword.c, line 20
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	24
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 22
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 503
						// matchobj comparing flags 2 with 608
						// matchobj comparing flags 2 with 608
						// extern
	.liabs	_statusword_high
						//extern deref
						//sizemod based on type 0x503
	ldt
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 23
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	8
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//../DeMiSTify/firmware/statusword.c, line 24
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2

						//../DeMiSTify/firmware/statusword.c, line 25
						// Q1 disposable
						// Z disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	24
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x260
	mt	r0
	st	r2
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 27
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 608
						// matchobj comparing flags 161 with 608
						// deref
						// const to r0
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	-48
	mr	r0
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
	.section	.text.1
	.global	_statusword_get
_statusword_get:
	stdec	r6
	mt	r3
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
						// allocreg r3

						//../DeMiSTify/firmware/statusword.c, line 36
						// (bitwise/arithmetic) 	//ops: 0, 3, 4
						// (obj to r3) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r3
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
	shr	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 37
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32
	cmp	r2

						//../DeMiSTify/firmware/statusword.c, line 37
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 38
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 38
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 4
						// (obj to r3) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_statusword_high
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r3
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	shr	r3
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 40
						//pcreltotemp
	.lipcrel	l7
	add	r7
l6: # 
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 40
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 1 type 103
						// const
	.liconst	32
	mr	r1
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 40
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size

						//../DeMiSTify/firmware/statusword.c, line 40
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_statusword_high
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/statusword.c, line 40
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	or	r3
						// (save result) // isreg
						// freereg r1
l7: # 

						//../DeMiSTify/firmware/statusword.c, line 41
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	8
	ldidx	r6
	and	r3
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 42
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						//No need to mask - same size
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

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_statusword_cycle
_statusword_cycle:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-20
	add	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 103
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 64
						// extern
	.liabs	_statusword
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 50
						// (bitwise/arithmetic) 	//ops: 7, 4, 5
						// (obj to r4) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	//nop
	mr	r4
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 98
						// reg r3 - only match against tmp
	mt	r3
	shr	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 51
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32
	cmp	r3

						//../DeMiSTify/firmware/statusword.c, line 51
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7

						//../DeMiSTify/firmware/statusword.c, line 53
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
	addt	r6
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
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 54
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	32
	sub	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/statusword.c, line 54
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/statusword.c, line 54
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	36
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_statusword_high
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 55
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 6, 2, 5
						// (obj to r4) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	//mt
	mr	r4
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	shr	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 58
						//pcreltotemp
	.lipcrel	l12
	add	r7
l11: # 
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 59
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/statusword.c, line 59
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	36
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 60
						// (bitwise/arithmetic) 	//ops: 0, 4, 2
						// (obj to r1) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	32
	mr	r1
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 60
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
	.liconst	36
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/statusword.c, line 61
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_statusword_high
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/statusword.c, line 61
						// (bitwise/arithmetic) 	//ops: 6, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/statusword.c, line 61
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	or	r4
						// (save result) // isreg
						// freereg r1
l12: # 

						//../DeMiSTify/firmware/statusword.c, line 63
						// (bitwise/arithmetic) 	//ops: 0, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	36
	ldidx	r6
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 64
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 65
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
	ldidx	r6
	cmp	r4

						//../DeMiSTify/firmware/statusword.c, line 65
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7

						//../DeMiSTify/firmware/statusword.c, line 66
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l14: # 

						//../DeMiSTify/firmware/statusword.c, line 67
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	32
	cmp	r3

						//../DeMiSTify/firmware/statusword.c, line 67
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l16
		add	r7

						//../DeMiSTify/firmware/statusword.c, line 69
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
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
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 70
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 130
	.liconst	32
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 70
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size

						//../DeMiSTify/firmware/statusword.c, line 70
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 73
						//pcreltotemp
	.lipcrel	l17
	add	r7
l16: # 
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 74
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r3 - only match against tmp
	mt	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/statusword.c, line 74
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 75
						// (bitwise/arithmetic) 	//ops: 0, 4, 2
						// (obj to r1) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	32
	mr	r1
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 75
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 1
						// (obj to r0) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 66
						// reg r1 - only match against tmp
	mt	r1
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
l17: # 
						// allocreg r2

						//../DeMiSTify/firmware/statusword.c, line 77
						//comp
						// (obj to r2) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// matchobj comparing flags 1 with 2
	.liconst	-1
	xor	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 77
						// (bitwise/arithmetic) 	//ops: 3, 7, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	and	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/statusword.c, line 78
						//comp
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// matchobj comparing flags 1 with 2
	.liconst	-1
	xor	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 78
						// (bitwise/arithmetic) 	//ops: 2, 6, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/statusword.c, line 79
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2

						//../DeMiSTify/firmware/statusword.c, line 80
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_statusword_high, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/statusword.c, line 82
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-20
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	.section	.bss.3
	.global	_statusword
	.comm	_statusword,4
	.section	.bss.4
	.global	_statusword_high
	.comm	_statusword_high,4
