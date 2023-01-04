	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_arcfile_init
_arcfile_init:
	stdec	r6

						//../DeMiSTify/firmware/arcfile.c, line 13
		// Offsets 0, 8
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 8)
	.liabs	_arcstate, 8
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
	.section	.text.1
	.global	_arcfile_open
_arcfile_open:
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

						//../DeMiSTify/firmware/arcfile.c, line 21
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 64
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 64
						// extern (offset 0)
	.liabs	_arcstate
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 21
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 21
		// Offsets 52, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	52
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 21
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 22
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 22
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_arcstate
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 22
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 22
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/arcfile.c, line 22
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size

						//../DeMiSTify/firmware/arcfile.c, line 23
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 23
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 23
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	stdec	r6

						//../DeMiSTify/firmware/arcfile.c, line 23
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	addt	r6
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 23
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	//mt
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 23
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_arcstate
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 23
						//call
						//pcreltotemp
	.lipcrel	_FileRead
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 23
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 23
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7
						// freereg r2
						// freereg r3
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 25
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 25
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l15,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/arcfile.c, line 25
		// Offsets 4, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	4
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 25
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 25
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 25
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l16
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 26
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/arcfile.c, line 27
						//pcreltotemp
	.lipcrel	l8
	add	r7
l11: # 

						//../DeMiSTify/firmware/arcfile.c, line 29
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/arcfile.c, line 32
						//pcreltotemp
	.lipcrel	l8
	add	r7
						// freereg r1
l16: # 

						//../DeMiSTify/firmware/arcfile.c, line 32
						//call
						//pcreltotemp
	.lipcrel	_arcfile_begin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/arcfile.c, line 33
						//call
						//pcreltotemp
	.lipcrel	_arcfile_next
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 33
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 33
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l23
		add	r7
l22: # 

						//../DeMiSTify/firmware/arcfile.c, line 33
						//call
						//pcreltotemp
	.lipcrel	_arcfile_next
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 33
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 33
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7
l23: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 36
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_arcstate, 32
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/arcfile.c, line 36
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 38
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_statusword
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_arcstate, 32
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 39
						//call
						//pcreltotemp
	.lipcrel	_sendstatus
	add	r7
						// Flow control - popping 0 + 0 bytes
l21: # 

						//../DeMiSTify/firmware/arcfile.c, line 42
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	1
	mr	r0
l8: # 
						// freereg r1
						// freereg r2
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

	.section	.rodata.2
l15:
	.byte	91
	.byte	65
	.byte	82
	.byte	67
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_arcfile_begin
_arcfile_begin:
	stdec	r6

						//../DeMiSTify/firmware/arcfile.c, line 48
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 48
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_arcstate
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 48
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 49
		// Offsets 0, 24
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 24)
	.liabs	_arcstate, 24
						// extern pe not varadr
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
	ldinc	r6	// shortest way to add 4 to sp
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
	.global	_arcfile_next
_arcfile_next:
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
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 55
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r6
						//save_temp done
l80: # 

						//../DeMiSTify/firmware/arcfile.c, line 61
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// extern
	.liabs	_arcstate, 24
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	sgn
	cmp	r0

						//../DeMiSTify/firmware/arcfile.c, line 61
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 63
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_arcstate, 24
						//extern deref
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 24)
	.liabs	_arcstate, 28
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/arcfile.c, line 64
						//setreturn
						// (obj to r0) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	59
	mr	r0

						//../DeMiSTify/firmware/arcfile.c, line 65
						//pcreltotemp
	.lipcrel	l26
	add	r7
						// freereg r1
l32: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 67
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_arcstate
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 67
						//call
						//pcreltotemp
	.lipcrel	_FileGetCh
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 67
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/arcfile.c, line 68
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 68
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 69
						//setreturn
						// (obj to r0) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	mr	r0
				//return 0

						//../DeMiSTify/firmware/arcfile.c, line 70
						//pcreltotemp
	.lipcrel	l26
	add	r7
l34: # 

						//../DeMiSTify/firmware/arcfile.c, line 71
		// Offsets 24, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_arcstate, 24
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l36
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l72
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l55
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l45
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7
						//pcreltotemp
	.lipcrel	l79
	add	r7
l36: # 

						//../DeMiSTify/firmware/arcfile.c, line 80
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r4
						// freereg r1
						// freereg r2
						// freereg r3
l81: # 
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 82
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
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 82
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l1,0
						// static pe is varadr
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 82
						// (bitwise/arithmetic) 	//ops: 0, 6, 5
						// (obj to r4) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj r4)
 						// matchobj comparing flags 130 with 130
						// extern (offset 20)
	.liabs	_arcstate, 20
						// extern pe is varadr
	mr	r4
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
	add	r4
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/arcfile.c, line 82
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type 101
						// matchobj comparing flags 98 with 66
						// deref 
	byt
	ld	r4
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 82
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 98
						// reg r3 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 74
						// reg r3 - only match against tmp
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 82
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	addt	r3
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done
						// freereg r3

						//../DeMiSTify/firmware/arcfile.c, line 82
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 98
						// deref 
	ld	r2
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/arcfile.c, line 82
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 106
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 83
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/arcfile.c, line 83
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l42
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 84
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)store type 1
	byt
	st	r4
						//save_temp done
l42: # 

						//../DeMiSTify/firmware/arcfile.c, line 85
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6

						//../DeMiSTify/firmware/arcfile.c, line 85
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l44
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 86
						// (bitwise/arithmetic) 	//ops: 6, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// extern (offset 24)
	.liabs	_arcstate, 24
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	4
	addt	r5
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
l44: # 

						//../DeMiSTify/firmware/arcfile.c, line 81
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 81
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4
	sgn
	cmp	r5

						//../DeMiSTify/firmware/arcfile.c, line 81
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l81
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 88
						//pcreltotemp
	.lipcrel	l79
	add	r7
l45: # 

						//../DeMiSTify/firmware/arcfile.c, line 92
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// extern
	.liabs	_arcstate, 36
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	sgn
	cmp	r0

						//../DeMiSTify/firmware/arcfile.c, line 92
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l46
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 92
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 92
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l46
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 92
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 92
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l47
		add	r7
l46: # 

						//../DeMiSTify/firmware/arcfile.c, line 95
		// Offsets 36, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_arcstate, 36
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 96
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	sgn
	cmp	r3

						//../DeMiSTify/firmware/arcfile.c, line 96
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7
						// freereg r1
l82: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 96
						// (bitwise/arithmetic) 	//ops: 0, 4, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// extern (offset 40)
	.liabs	_arcstate, 40
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r3 - only match against tmp
	mt	r3
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 96
						// Z disposable
		// Offsets 32, 0
		// Have am? no, yes
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 96
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 96
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r3

						//../DeMiSTify/firmware/arcfile.c, line 96
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l82
		add	r7
l85: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 97
		// Offsets 82, 48
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 48)
	.liabs	_arcstate, 48
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	82
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 98
		// Offsets 79, 49
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	79
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 99
		// Offsets 77, 50
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	77
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 100
		// Offsets 0, 51
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 101
		// Offsets 3, 24
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 24 with 52
						//Fuzzy match found, offset: -28 (varadr: 1)
	.liconst	-28
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 104
						//pcreltotemp
	.lipcrel	l79
	add	r7
						// freereg r1
l47: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 104
		// Offsets 36, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_arcstate, 36
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 104
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 36)
	.liabs	_arcstate, 40
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/arcfile.c, line 104
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 40 with 36
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	4
	addt	r0

			// required value found in tmp
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 104
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/arcfile.c, line 105
						//pcreltotemp
	.lipcrel	l79
	add	r7
l55: # 
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 109
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	48
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 109
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 109
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	57
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 109
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 110
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_arcstate, 28
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	10
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 110
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	48
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 110
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 28)
	.liabs	_arcstate, 28
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// freereg r2
						// freereg r1
l57: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 111
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	10
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 111
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 111
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 111
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
l59: # 

						//../DeMiSTify/firmware/arcfile.c, line 112
		// Offsets 3, 24
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 24)
	.liabs	_arcstate, 24
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 113
						//pcreltotemp
	.lipcrel	l79
	add	r7
l62: # 

						//../DeMiSTify/firmware/arcfile.c, line 117
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	48
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 117
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 117
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	57
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 117
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 118
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_arcstate, 32
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 118
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	48
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 118
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 32)
	.liabs	_arcstate, 32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// freereg r2
						// freereg r1
l64: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 119
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	65
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 119
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 119
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	70
	sgn
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 119
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 120
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_arcstate, 32
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	mul	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/arcfile.c, line 120
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	55
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/arcfile.c, line 120
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 32)
	.liabs	_arcstate, 32
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// matchobj comparing flags 2 with 2
						// Obsoleting t1
						// freereg r2
						// freereg r1
l67: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 121
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	10
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 121
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 121
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 121
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
l69: # 

						//../DeMiSTify/firmware/arcfile.c, line 122
		// Offsets 3, 24
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 24)
	.liabs	_arcstate, 24
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 123
						//pcreltotemp
	.lipcrel	l79
	add	r7
l72: # 

						//../DeMiSTify/firmware/arcfile.c, line 127
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	34
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 127
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l74
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 128
		// Offsets 59, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	59
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 129
						//pcreltotemp
	.lipcrel	l79
	add	r7
l74: # 

						//../DeMiSTify/firmware/arcfile.c, line 129
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	10
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 129
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l76
		add	r7

						//../DeMiSTify/firmware/arcfile.c, line 129
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	13
	cmp	r4

						//../DeMiSTify/firmware/arcfile.c, line 129
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
l76: # 

						//../DeMiSTify/firmware/arcfile.c, line 130
		// Offsets 3, 24
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// extern (offset 24)
	.liabs	_arcstate, 24
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/arcfile.c, line 132
						//pcreltotemp
	.lipcrel	l79
	add	r7
l77: # 

						//../DeMiSTify/firmware/arcfile.c, line 132
		// Offsets 0, 0
		// Have am? no, no
						// (a/p assign)
						// Have an addressing mode...
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 3
	st	r6
						//save_temp done
l79: # 

						//../DeMiSTify/firmware/arcfile.c, line 56
						// (test)
						// (obj to tmp) flags 62 type 3
						// deref 
	ld	r6

						//../DeMiSTify/firmware/arcfile.c, line 56
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l80
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/arcfile.c, line 137
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 98

			// required value found in tmp
						//Saving to reg r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						// matchobj comparing flags 1 with 98
	.liconst	255
	and	r1
						// freereg r1
l26: # 
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

	.section	.bss.5
	.global	_arcstate
	.comm	_arcstate,52
	.section	.rodata.6
l2:
	.byte	67
	.byte	79
	.byte	78
	.byte	70
	.byte	61
	.byte	0
	.section	.rodata.7
l3:
	.byte	77
	.byte	79
	.byte	68
	.byte	0
	.section	.rodata.8
l4:
	.byte	78
	.byte	65
	.byte	77
	.byte	69
	.byte	0
	.section	.rodata.9
l5:
	.byte	68
	.byte	69
	.byte	70
	.byte	65
	.byte	85
	.byte	76
	.byte	84
	.byte	61
	.byte	48
	.byte	0
	.section	.data.a
l1:
						// Declaring from tree
						// static
	.ref	l2
						// Declaring from tree
						// static
	.ref	l3
						// Declaring from tree
						// static
	.ref	l4
						// Declaring from tree
						// static
	.ref	l5
