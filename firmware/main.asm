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
	.global	_LoadROM
_LoadROM:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-8
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
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 72
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 74
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 74
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 74
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 74
						// (test)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 74
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l4
		add	r7

						//../DeMiSTify/firmware/main.c, line 76
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_rom_minsize
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 79
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 79
						//call
						//pcreltotemp
	.lipcrel	_configstring_setindex
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 84
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
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

						//../DeMiSTify/firmware/main.c, line 85
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	86
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 86
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l32: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 87
						// (bitwise/arithmetic) 	//ops: 6, 3, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 87
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 301
						// matchobj comparing flags 106 with 74
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)store type 3
	st	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 87
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	1
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 87
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	11
	sgn
	cmp	r2

						//../DeMiSTify/firmware/main.c, line 87
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 88
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	12
						// (save temp)isreg
	mr	r2
						//save_temp done
l33: # 

						//../DeMiSTify/firmware/main.c, line 89
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// const
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 89
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 89
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
	sgn
	cmp	r2

						//../DeMiSTify/firmware/main.c, line 89
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7

						//../DeMiSTify/firmware/main.c, line 90
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
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 92
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 94
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
	.liconst	5
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 94
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 94
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 94
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
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 96
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 96
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7
l34: # 

						//../DeMiSTify/firmware/main.c, line 98
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_file, 8
						//extern deref
						//sizemod based on type 0x103
	ldt
						//Saving to reg r4
						// (save temp)isreg
	mr	r4
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 99
						// (bitwise/arithmetic) 	//ops: 0, 5, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 101
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 101
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l40
		add	r7
l35: # 

						//../DeMiSTify/firmware/main.c, line 103
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)store type a
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 106
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	512
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 107
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 108
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 108
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7

						//../DeMiSTify/firmware/main.c, line 110
						// (bitwise/arithmetic) 	//ops: 5, 0, 6
						//Special case - addt
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
	addt	r4
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 111
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l20: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 114
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_configstring_coretype
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 114
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 114
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7

						//../DeMiSTify/firmware/main.c, line 115
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 115
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 115
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 115
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 115
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 117
						//pcreltotemp
	.lipcrel	l23
	add	r7
l22: # 

						//../DeMiSTify/firmware/main.c, line 118
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 118
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 118
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 118
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 118
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 119
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 120
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	84
						// (save temp)store type 3
	st	r3
						//save_temp done
l36: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 123
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r3 - no need to prep
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
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 123
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

						//../DeMiSTify/firmware/main.c, line 124
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	sub	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 124
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l36
		add	r7

						//../DeMiSTify/firmware/main.c, line 125
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
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
l23: # 

						//../DeMiSTify/firmware/main.c, line 127
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//../DeMiSTify/firmware/main.c, line 127
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l28
		add	r7

						//../DeMiSTify/firmware/main.c, line 128
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/main.c, line 130
						//pcreltotemp
	.lipcrel	l31
	add	r7
						// freereg r1
l28: # 

						//../DeMiSTify/firmware/main.c, line 130
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 130
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_file
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 130
						//call
						//pcreltotemp
	.lipcrel	_FileNextSector
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 101
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 101
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l35
		add	r7
l40: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 132
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 132
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l30
		add	r7

						//../DeMiSTify/firmware/main.c, line 133
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_file
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

						//../DeMiSTify/firmware/main.c, line 133
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 16 with 0
						//Fuzzy match found, offset: 16 (varadr: 1)
	.liconst	16
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 133
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 4 with 16
						//Fuzzy match found, offset: -12 (varadr: 1)
	.liconst	-12
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_file, 12
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
l30: # 

						//../DeMiSTify/firmware/main.c, line 96
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 96
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7
l39: # 

						//../DeMiSTify/firmware/main.c, line 136
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
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

						//../DeMiSTify/firmware/main.c, line 136
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	83
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 136
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 136
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
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 137
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/main.c, line 138
						//pcreltotemp
	.lipcrel	l31
	add	r7
l4: # 

						//../DeMiSTify/firmware/main.c, line 140
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
l31: # 
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-8
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
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
l46:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 174
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 176
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 177
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	cmp	r3

						//../DeMiSTify/firmware/main.c, line 177
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l59
		add	r7
l58: # 

						//../DeMiSTify/firmware/main.c, line 178
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_configstring_matchextension
						// extern pe is varadr
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 178
						// (test)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/main.c, line 178
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7

						//../DeMiSTify/firmware/main.c, line 178
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 178
						//pcreltotemp
	.lipcrel	l54
	add	r7
l53: # 

						//../DeMiSTify/firmware/main.c, line 178
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
l54: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 178
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 178
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 178
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/main.c, line 179
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 180
						// (test)
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6

						//../DeMiSTify/firmware/main.c, line 180
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 181
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 98
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r4
						//save_temp done
l57: # 

						//../DeMiSTify/firmware/main.c, line 177
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	1
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 177
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 177
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
l59: # 

						//../DeMiSTify/firmware/main.c, line 183
						//setreturn
						// (obj to r0) flags 62 type a
						// deref 
	ld	r6
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.2
	.global	_spi32le
_spi32le:
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

						//../DeMiSTify/firmware/main.c, line 190
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 190
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 191
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 191
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 191
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 192
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 192
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 192
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 193
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	24
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 193
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 193
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r0
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
	.section	.text.3
	.weak	_loadimage
_loadimage:
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
						// allocreg r1
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	4
	ldidx	r6
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 237
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 237
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 237
						//setreturn
						// (obj to r0) flags 4a type 3
						// reg r0 - only match against tmp
						// freereg r1
l64: # 
						// allocreg r1
						// freereg r1
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
	.section	.text.4
	.global	_selectrom
_selectrom:
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
						// (a/p assign)
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
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 268
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r4 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	30
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 268
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 6
						// (obj to r5) flags 82 type a
						// (prepobj r5)
 						// static
	.liabs	l45,0
						// static pe is varadr
	mr	r5
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r5
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 268
						// (test)
						// (obj to tmp) flags 62 type 101
						// matchobj comparing flags 98 with 74
						// deref 
	byt
	ld	r5

						//../DeMiSTify/firmware/main.c, line 268
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 270
						// (bitwise/arithmetic) 	//ops: 0, 5, 3
						// (obj to r2) flags 2 type 3
						// matchobj comparing flags 2 with 98
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r2
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 270
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	mt	r2
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 270
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 270
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/main.c, line 272
						// (test)
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 98

			// required value found in tmp
				// flags 62
	mr	r0
	and	r0

						//../DeMiSTify/firmware/main.c, line 272
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l71
		add	r7
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 274
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 98
						// matchobj comparing flags 130 with 98
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 98
						// matchobj comparing flags 130 with 98
						// extern (offset 0)
	.liabs	_filename
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 274
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 130
						// matchobj comparing flags 98 with 98

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 274
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 274
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r2
						// freereg r1
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 276
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						// (obj to r3) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
	mul	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 276
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 276
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 276
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l72,0
						// static pe is varadr
						// (save temp)store type a
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 277
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 277
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 278
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type a
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type a
	st	r3
						//save_temp done
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 279
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_unit
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 279
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 279
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_filename
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 279
						//call
						//pcreltotemp
	.lipcrel	_loadimage
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l71: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 281
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 281
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 282
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 282
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 283
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menupage
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
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 284
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 284
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l66: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata.5
l72:
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	105
	.byte	110
	.byte	103
	.byte	46
	.byte	46
	.byte	46
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
l73:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 290
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r2
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 290
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	mt	r2
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 290
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 290
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 291
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 291
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 292
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 292
						//call
						//pcreltotemp
	.lipcrel	_ChangeDirectory
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l77: # 

						//../DeMiSTify/firmware/main.c, line 293
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menuindex
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
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 294
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 294
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r3
						// freereg r4
	.lipcrel	.functiontail, 2
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
	.section	.text.7
l42:
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

						//../DeMiSTify/firmware/main.c, line 300
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 302
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 303
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

						//../DeMiSTify/firmware/main.c, line 304
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 304
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	0
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 304
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 304
						// (test)
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
				// flags 82
	mr	r0
	and	r0

						//../DeMiSTify/firmware/main.c, line 304
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
l109: # 

						//../DeMiSTify/firmware/main.c, line 305
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_configstring_matchextension
						// extern pe is varadr
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 305
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6

						//../DeMiSTify/firmware/main.c, line 305
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7

						//../DeMiSTify/firmware/main.c, line 305
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/main.c, line 305
						//pcreltotemp
	.lipcrel	l86
	add	r7
l85: # 

						//../DeMiSTify/firmware/main.c, line 305
						// (a/p assign)
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
l86: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 305
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 305
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 305
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//../DeMiSTify/firmware/main.c, line 306
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 304
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 304
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 304
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	cmp	r4
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 304
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 304
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 2
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/main.c, line 304
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l109
		add	r7
l111: # 

						//../DeMiSTify/firmware/main.c, line 309
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 310
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/main.c, line 310
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7
l110: # 

						//../DeMiSTify/firmware/main.c, line 311
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_configstring_matchextension
						// extern pe is varadr
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 311
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6

						//../DeMiSTify/firmware/main.c, line 311
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l94
		add	r7

						//../DeMiSTify/firmware/main.c, line 311
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
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

						//../DeMiSTify/firmware/main.c, line 311
						//pcreltotemp
	.lipcrel	l95
	add	r7
l94: # 

						//../DeMiSTify/firmware/main.c, line 311
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	12
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
l95: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 311
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 311
						//call
						//pcreltotemp
	.lipcrel	_NextDirEntry
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 311
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching

						//../DeMiSTify/firmware/main.c, line 312
						// (test)
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 98

			// required value found in tmp
				// flags 62
	mr	r0
	and	r0

						//../DeMiSTify/firmware/main.c, line 312
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 315
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 98

			// required value found in tmp
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
						// matchobj comparing flags 1 with 98
	.liconst	11
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 315
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// matchobj comparing flags 106 with 98
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 315
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 98
	.liconst	16
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 315
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l100
		add	r7
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 317
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 98
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 98
						// static
	.liabs	l73,0
						// static pe is varadr
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 317
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 98
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 317
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 98
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 98
						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 317
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 4
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 98
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 318
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 318
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
	.liconst	255
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 319
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 98
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 98
	.liconst	30
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 319
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 6
						// (obj to r5) flags 82 type a
						// matchobj comparing flags 130 with 98
						// (prepobj r5)
 						// matchobj comparing flags 130 with 98
						// static
	.liabs	l45,0
						// static pe is varadr
	mr	r5
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 98
						// reg r1 - only match against tmp
	mt	r1
	add	r5
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 319
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 98
	.liconst	129
						// (save temp)store type 1
	byt
	st	r5
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 320
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 98
	.liconst	1
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done
						// matchobj comparing flags 74 with 74
						// Obsoleting t1

						//../DeMiSTify/firmware/main.c, line 320
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 321
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_longfilename
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/main.c, line 321
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7
						// freereg r3

						//../DeMiSTify/firmware/main.c, line 322
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 322
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 322
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 322
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	27
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 322
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 324
						//pcreltotemp
	.lipcrel	l107
	add	r7
l102: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 325
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	13
	addt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 325
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 326
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 326
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 326
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 330
						//pcreltotemp
	.lipcrel	l107
	add	r7
l100: # 
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 331
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_selectrom
						// extern pe is varadr
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 331
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 331
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 331
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 4
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 332
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_longfilename
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/main.c, line 332
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l106
		add	r7
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 333
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						// (obj to r1) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r4 - only match against tmp
	mt	r4
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	30
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 333
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 333
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 4
						// (obj to r3) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj r3)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l45,0
						// static pe is varadr
	mr	r3
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r3
						// (save result) // isreg
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 333
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_longfilename
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 333
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	29
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 333
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 335
						//pcreltotemp
	.lipcrel	l107
	add	r7
l106: # 
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 336
						// (bitwise/arithmetic) 	//ops: 5, 0, 4
						// (obj to r3) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
	mr	r3
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	30
	mul	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 336
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l45,0
						// static pe is varadr
	add	r3
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 336
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	11
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 336
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 337
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 337
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 337
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 74
						// deref 
	ld	r6
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 337
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	11
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 337
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1
l107: # 
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 310
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 310
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	7
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 310
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7

						//../DeMiSTify/firmware/main.c, line 310
						// (test)
						// (obj to tmp) flags 62 type a
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6

						//../DeMiSTify/firmware/main.c, line 310
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l110
		add	r7
l112: # 
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 342
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 103
						// reg r4 - only match against tmp
	mt	r4
						//Saving to reg r1
						// (save temp)isreg
	mr	r0
						//save_temp done
						//No need to mask - same size
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 66
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
l113:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 347
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 347
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 347
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 347
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_romtype
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 348
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
	.liconst	9
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// matchobj comparing flags 74 with 74
						// Obsoleting t1

						//../DeMiSTify/firmware/main.c, line 348
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_configstring_index
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 349
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 130
	.liconst	10
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 349
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// extern (offset 0)
	.liabs	_unit
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 350
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 106
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_unit
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 350
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 350
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 350
						//call
						//pcreltotemp
	.lipcrel	_loadimage
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 351
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menupage
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	30
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 352
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 352
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1
						// freereg r3
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 4
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
	.section	.text.9
l44:
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

						//../DeMiSTify/firmware/main.c, line 359
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 359
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 359
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 359
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r1
//Disposable, postinc doesn't matter.
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menupage, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 360
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_menuindex
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
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 362
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 362
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
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
	.section	.text.a
l118:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 367
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 367
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
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
	.section	.text.b
l121:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 373
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r1 - only match against tmp
	mt	r1
				// flags 42
	and	r1

						//../DeMiSTify/firmware/main.c, line 373
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l125
		add	r7

						//../DeMiSTify/firmware/main.c, line 375
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// extern (offset 85)
	.liabs	_menu, 85
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

						//../DeMiSTify/firmware/main.c, line 376
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 77 with 86
						//Fuzzy match found, offset: -9 (varadr: 1)
	.liconst	-9
	add	r0

						// required value found in r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l44,0
						// static pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	stinc	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 377
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// extern (offset 0)
	.liabs	_std_label_back
						// extern pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 380
						//pcreltotemp
	.lipcrel	l126
	add	r7
l125: # 

						//../DeMiSTify/firmware/main.c, line 381
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 81)
	.liabs	_menu, 81
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 81
						// extern (offset 0)
	.liabs	_std_label_exit
						// extern pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 382
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 77 with 0
						// matchobj comparing flags 130 with 130
						//extern: comparing 77 with 81
						//Fuzzy match found, offset: -4 (varadr: 1)
	.liconst	-4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l118,0
						// static pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r0
						//save_temp done
l126: # 
						// freereg r1
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
	.section	.text.c
	.global	_cycle
_cycle:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r4
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 390
						// (bitwise/arithmetic) 	//ops: 5, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r4 - only match against tmp
	//mt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	11
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 390
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 391
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	8
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 391
						// (bitwise/arithmetic) 	//ops: 3, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	9
	addt	r2
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 391
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r3
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 391
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r3 - only match against tmp
	//mt
	stdec	r6
						// freereg r3

						//../DeMiSTify/firmware/main.c, line 391
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 391
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 391
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	10
	add	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 391
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 391
						//call
						//pcreltotemp
	.lipcrel	_statusword_cycle
	add	r7
						// Deferred popping of 8 bytes (8 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 392
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 392
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 393
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 393
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1
						// freereg r4
	.liconst	-8
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.d
	.weak	_toggle
_toggle:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 399
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 399
						//call
						//pcreltotemp
	.lipcrel	_cycle
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 400
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 400
						//call
						//pcreltotemp
	.lipcrel	_cycle
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.e
l43:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2
						// allocreg r1
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	6
	addt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l134
		add	r7
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	sub	r2
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l134
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
	.lipcrel	l145
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
	.lipcrel	l142
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
	.lipcrel	l139
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
	.lipcrel	l136
		add	r7
						//pcreltotemp
	.lipcrel	l147
	add	r7
						// freereg r1
l134: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 416
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	7
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 416
						//call
						//pcreltotemp
	.lipcrel	l44
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 418
						//pcreltotemp
	.lipcrel	l131
	add	r7
l136: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 421
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/main.c, line 421
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//../DeMiSTify/firmware/main.c, line 422
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
 						// extern (offset 0)
	.liabs	_menuindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 423
						//pcreltotemp
	.lipcrel	l147
	add	r7
l139: # 

						//../DeMiSTify/firmware/main.c, line 425
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_moremenu
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/main.c, line 425
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//../DeMiSTify/firmware/main.c, line 426
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menuindex
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
 						// extern (offset 0)
	.liabs	_menuindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 427
						//pcreltotemp
	.lipcrel	l147
	add	r7
						// freereg r1
l142: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 429
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	6
	sub	r1
						// (save result) // isreg
						// (a/p assign)
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menuindex, 4
						// extern pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//../DeMiSTify/firmware/main.c, line 430
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 430
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 431
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_menuindex
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

						//../DeMiSTify/firmware/main.c, line 432
						//pcreltotemp
	.lipcrel	l147
	add	r7
l145: # 

						//../DeMiSTify/firmware/main.c, line 434
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_moremenu
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/main.c, line 434
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l147
		add	r7

						//../DeMiSTify/firmware/main.c, line 435
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menuindex
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
	.liconst	6
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menuindex, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
l147: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 438
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 438
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 439
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 439
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l131: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
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
	.section	.text.f
	.global	_parseconf
_parseconf:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-48
	add	r6
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r1
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 447
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	8
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

						//../DeMiSTify/firmware/main.c, line 449
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 12, 0 with 8, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	68
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 450
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 16, 0 with 12, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 451
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 20, 0 with 16, 0
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 452
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_moremenu
						// extern pe not varadr
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

						//../DeMiSTify/firmware/main.c, line 454
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_menupage
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	30
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 454
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l151
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 456
						//call
						//pcreltotemp
	.lipcrel	l42
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 456
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 456
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 474
						//pcreltotemp
	.lipcrel	l152
	add	r7
l151: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 475
						//call
						//pcreltotemp
	.lipcrel	_configstring_begin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 477
						//call
						//pcreltotemp
	.lipcrel	_configstring_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 478
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 478
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 479
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	59
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 479
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l154
		add	r7

						//../DeMiSTify/firmware/main.c, line 481
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6

						//../DeMiSTify/firmware/main.c, line 481
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l156
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 483
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	64
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 483
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r2
						// (save temp)store type a
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 483
						// (a/p assign)
	mt	r2
	stdec	r6
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l157,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 170 with 2
						// matchobj comparing flags 170 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	ldidx	r6
	mr	r1
					// Copying 2 words and 1 bytes to 
					// Copying 2 words to 
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
	mr	r2
.cpywordloop0:
	ldinc	r0
	stinc	r1
	mt	r1
	cmp	r2
	cond	NEQ
		.lipcrel	.cpywordloop0
		add	r7
					// Copying 1 byte tail to 
	ldbinc	r0
	stbinc	r1
	ldinc	r6
	mr	r2

						//../DeMiSTify/firmware/main.c, line 484
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// deref
						// var FIXME - deref?
						// reg - auto
	.liconst	64
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l113,0
						// static pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 485
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 6a type a
						// matchobj comparing flags 106 with 130
						// deref 
	ld	r2
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	7
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 485
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 486
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	64
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 486
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 487
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	64
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	9
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 487
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 488
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	64
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	10
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 488
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 489
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 489
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	24
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 489
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r2
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	8
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 489
						//call
						//pcreltotemp
	.lipcrel	_configstring_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 490
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	68
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 490
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l159
		add	r7
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 491
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 493
						//pcreltotemp
	.lipcrel	l161
	add	r7
l159: # 

						//../DeMiSTify/firmware/main.c, line 493
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	68
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 496
						//pcreltotemp
	.lipcrel	l161
	add	r7
l156: # 

						//../DeMiSTify/firmware/main.c, line 496
						//call
						//pcreltotemp
	.lipcrel	_configstring_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes
l161: # 

						//../DeMiSTify/firmware/main.c, line 497
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	16
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done
l154: # 

						//../DeMiSTify/firmware/main.c, line 499
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 499
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l240
		add	r7

						//../DeMiSTify/firmware/main.c, line 499
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	72
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 499
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l240
		add	r7
l234: # 

						//../DeMiSTify/firmware/main.c, line 501
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
	addt	r6
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

						//../DeMiSTify/firmware/main.c, line 503
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 4, 0 with 28, 0
						//Fuzzy match found, offset: -24 (varadr: 1)
	.liconst	-24
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 504
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 504
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 507
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	80
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 507
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l241
		add	r7
						// freereg r1
l235: # 

						//../DeMiSTify/firmware/main.c, line 509
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 510
						//call
						//pcreltotemp
	.lipcrel	_configstring_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 510
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 510
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	8
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 512
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 512
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 513
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	44
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 513
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l170
		add	r7
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 515
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 515
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// var, auto|reg
	.liconst	64
	ldidx	r6
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 515
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 515
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 516
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	8
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 516
						// Z disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 517
						// Z disposable
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l44,0
						// static pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 518
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 518
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 519
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 519
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l242
		add	r7
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 519
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	59
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 519
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l242
		add	r7
l236: # 

						//../DeMiSTify/firmware/main.c, line 521
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type 1
	stbinc	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 522
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 522
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 519
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 66
						// reg r4 - only match against tmp
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 519
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l242
		add	r7

						//../DeMiSTify/firmware/main.c, line 519
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	59
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 519
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l236
		add	r7
l242: # 
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 524
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	32
						// (save temp)store type 1
	stbinc	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 525
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	129
						// (save temp)store type 1
	stbinc	r5
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 526
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 1
	byt
	st	r5
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 528
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 528
						// Q1 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 62 type 103
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 528
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l180
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 530
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 98
						// var, auto|reg
						// matchobj comparing flags 1 with 98
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 530
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l179
		add	r7

						//../DeMiSTify/firmware/main.c, line 531
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 533
						//pcreltotemp
	.lipcrel	l180
	add	r7
l179: # 

						//../DeMiSTify/firmware/main.c, line 533
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l180: # 

						//../DeMiSTify/firmware/main.c, line 535
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 535
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4
l170: # 

						//../DeMiSTify/firmware/main.c, line 537
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	80
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 537
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l182
		add	r7

						//../DeMiSTify/firmware/main.c, line 538
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l182: # 

						//../DeMiSTify/firmware/main.c, line 507
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	80
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 507
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l235
		add	r7
						// freereg r1
l241: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 541
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// var, auto|reg
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	24
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 541
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	32
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 541
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l184
		add	r7

						//../DeMiSTify/firmware/main.c, line 544
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	36
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
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	59
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x6a
	mt	r0
	st	r6
						// (test)
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l226
		add	r7
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	11
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x6a
	mt	r0
	st	r6
						// (test)
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l243
		add	r7
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	9
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x6a
	mt	r0
	st	r6
						// (test)
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l202
		add	r7
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	4
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x6a
	mt	r0
	st	r6
						// (test)
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l187
		add	r7
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x6a
	mt	r0
	st	r6
						// (test)
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l202
		add	r7
						//pcreltotemp
	.lipcrel	l225
	add	r7
l187: # 

						//../DeMiSTify/firmware/main.c, line 552
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	28
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	48
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 553
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 553
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 554
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	44
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 554
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l189
		add	r7

						//../DeMiSTify/firmware/main.c, line 555
						// (a/p assign)
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	32
	addt	r6
						//sizemod based on type 0x3
	stmpdec	r4
l189: # 

						//../DeMiSTify/firmware/main.c, line 556
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	44
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 556
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l243
		add	r7
l237: # 

						//../DeMiSTify/firmware/main.c, line 557
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 557
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 556
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	44
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 556
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l237
		add	r7
l243: # 

						//../DeMiSTify/firmware/main.c, line 560
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	44
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 560
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l195
		add	r7

						//../DeMiSTify/firmware/main.c, line 561
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l195: # 

						//../DeMiSTify/firmware/main.c, line 562
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 562
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 562
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 562
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type a
						// var, auto|reg
	.liconst	72
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 562
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0xa
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 562
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 130
	.liconst	12
	ldidx	r6
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 562
						//call
						//pcreltotemp
	.lipcrel	_configstring_copytocomma
	add	r7
						// Deferred popping of 8 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 563
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 563
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	30
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 563
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 563
						//call
						//pcreltotemp
	.lipcrel	_configstring_copytocomma
	add	r7
						// Flow control - popping 8 + 8 bytes
	.liconst	16
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 563
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 563
						// (minus)
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// matchobj comparing flags 1 with 74
	.liconst	0
	exg r1
	sub r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 563
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	44
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 564
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 564
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l197
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 564
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	29
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 564
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l197
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 566
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 22 type a
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	4
	ldidx	r6
						//sizemod based on type 0xa
	ldt
	mr	r1
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 34
						// var, auto|reg
						// matchobj comparing flags 1 with 34
	.liconst	40
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 566
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	32
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 567
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 567
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	4
	ldidx	r6
						//sizemod based on type 0xa
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 567
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	129
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 568
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 568
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 1
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	4
	ldidx	r6
						//sizemod based on type 0xa
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 568
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 34
						// const
						// matchobj comparing flags 1 with 34
	.liconst	0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l197: # 

						//../DeMiSTify/firmware/main.c, line 570
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l113,0
						// static pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 571
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 571
						// Z disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 572
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	9
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 572
						// Z disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 573
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	10
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 573
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 574
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 575
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 575
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l200
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 576
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 578
						//pcreltotemp
	.lipcrel	l226
	add	r7
l200: # 

						//../DeMiSTify/firmware/main.c, line 578
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 579
						//pcreltotemp
	.lipcrel	l226
	add	r7
						// freereg r1
l202: # 

						//../DeMiSTify/firmware/main.c, line 583
						//call
						//pcreltotemp
	.lipcrel	_configstring_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 583
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 583
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	44
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 584
						//call
						//pcreltotemp
	.lipcrel	_configstring_getdigit
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 584
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 584
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	32
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 586
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	28
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	44
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 586
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l205
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 587
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	28
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 589
						//pcreltotemp
	.lipcrel	l206
	add	r7
l205: # 

						//../DeMiSTify/firmware/main.c, line 589
						//call
						//pcreltotemp
	.lipcrel	_configstring_next
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// freereg r2
l206: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 591
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 591
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type a
						// var, auto|reg
	.liconst	64
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
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 591
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 98

			// required value found in tmp
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	8
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 591
						// (bitwise/arithmetic) 	//ops: 7, 0, 3
						// (obj to r2) flags 62 type a
						// matchobj comparing flags 98 with 1
						// deref 
	ld	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	10
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 591
						// Z disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 592
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	28
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 592
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x103
	ldidx	r6
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 592
						//FIXME convert
						// (convert - reducing type 103 to 3
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 592
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/main.c, line 592
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 592
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 1
	byt
	st	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 594
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 74
						// deref 
	byt
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 594
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

						//../DeMiSTify/firmware/main.c, line 594
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	44
						//sizemod based on type 0x103
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 594
						//call
						//pcreltotemp
	.lipcrel	_statusword_get
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 594
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 594
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	48
	addt	r6
						//sizemod based on type 0x103
	stmpdec	r1
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 598
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	4
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 598
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 1
						// deref 
	ld	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 599
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 106
						// var, auto|reg
						// matchobj comparing flags 1 with 106
	.liconst	32
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 599
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l209
		add	r7
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 599
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/main.c, line 599
						//pcreltotemp
	.lipcrel	l210
	add	r7
l209: # 

						//../DeMiSTify/firmware/main.c, line 599
						// (a/p assign)
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
l210: # 

						//../DeMiSTify/firmware/main.c, line 599
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 599
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	32
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 599
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 599
						//call
						//pcreltotemp
	.lipcrel	_configstring_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 599
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 599
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 599
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l244
		add	r7
						// freereg r2
						// freereg r3

						//../DeMiSTify/firmware/main.c, line 601
						// (bitwise/arithmetic) 	//ops: 6, 5, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	add	r5
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 602
						// (bitwise/arithmetic) 	//ops: 0, 5, 2
						// (obj to r1) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	32
	mr	r1
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 602
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 66
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l212,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 602
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 603
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	2
	add	r5
						// (save result) // isreg
l238: # 
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 606
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 607
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	44
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 607
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 607
	cond	EQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l216
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 607
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/main.c, line 607
						//pcreltotemp
	.lipcrel	l217
	add	r7
l216: # 

						//../DeMiSTify/firmware/main.c, line 607
						// (a/p assign)
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
l217: # 

						//../DeMiSTify/firmware/main.c, line 607
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 607
						// (bitwise/arithmetic) 	//ops: 5, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
	.liconst	2
	addt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 607
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	32
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	sub	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 607
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 607
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 607
						//call
						//pcreltotemp
	.lipcrel	_configstring_copytocomma
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 607
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	sgn
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 607
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l238
		add	r7
l244: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 610
						// (test)
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6

						//../DeMiSTify/firmware/main.c, line 610
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l220
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 612
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// matchobj comparing flags 98 with 2
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	9
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 612
						// Z disposable
						//FIXME convert
						// (convert - reducing type 103 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
						//sizemod based on type 0x103
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 613
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// matchobj comparing flags 162 with 2
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_cycle
						// extern pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 616
						//pcreltotemp
	.lipcrel	l221
	add	r7
l220: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 617
						// (bitwise/arithmetic) 	//ops: 7, 0, 2
						// (obj to r1) flags 62 type a
						// deref 
	ld	r6
	mr	r1
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	9
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 617
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 618
						//FIXME convert
						// (convert - reducing type a to 4
						// (prepobj r0)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
	mr	r0
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_toggle
						// extern pe is varadr
						//Saving to reg r0
						// (save temp)store type 4
	st	r0
						//save_temp done
l221: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 621
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 621
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l223
		add	r7

						//../DeMiSTify/firmware/main.c, line 622
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 624
						//pcreltotemp
	.lipcrel	l226
	add	r7
l223: # 

						//../DeMiSTify/firmware/main.c, line 624
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 625
						//pcreltotemp
	.lipcrel	l226
	add	r7
l225: # 

						//../DeMiSTify/firmware/main.c, line 627
						//call
						//pcreltotemp
	.lipcrel	_configstring_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 627
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4

						//../DeMiSTify/firmware/main.c, line 632
						//pcreltotemp
	.lipcrel	l226
	add	r7
l184: # 

						//../DeMiSTify/firmware/main.c, line 633
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	70
	cmp	r4

						//../DeMiSTify/firmware/main.c, line 633
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l228
		add	r7

						//../DeMiSTify/firmware/main.c, line 634
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l228: # 

						//../DeMiSTify/firmware/main.c, line 635
						//call
						//pcreltotemp
	.lipcrel	_configstring_nextfield
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 635
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r4
l226: # 

						//../DeMiSTify/firmware/main.c, line 637
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	20
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	24
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 499
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/main.c, line 499
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l240
		add	r7

						//../DeMiSTify/firmware/main.c, line 499
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 2
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	72
	ldidx	r6
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 499
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l234
		add	r7
l240: # 

						//../DeMiSTify/firmware/main.c, line 639
						//call
						//pcreltotemp
	.lipcrel	_configstring_end
	add	r7
						// Flow control - popping 0 + 0 bytes
l152: # 

						//../DeMiSTify/firmware/main.c, line 642
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// var, auto|reg
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 642
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l245
		add	r7
						// freereg r1
						// freereg r2
l239: # 

						//../DeMiSTify/firmware/main.c, line 643
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_moremenu
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
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 644
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/main.c, line 644
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	64
	ldidx	r6
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 644
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	4
	addt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// matchobj comparing flags 74 with 74
						// Obsoleting t1

						//../DeMiSTify/firmware/main.c, line 644
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 644
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	0
						// (save temp)store type 1
	stbinc	r2
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/main.c, line 645
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 4
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 4
	st	r1
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 642
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/main.c, line 642
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	7
	cmp	r0

						//../DeMiSTify/firmware/main.c, line 642
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l239
		add	r7
l245: # 
						// allocreg r2
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-48
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	.section	.rodata.10
l157:
	.byte	76
	.byte	111
	.byte	97
	.byte	100
	.byte	32
	.byte	42
	.byte	46
	.byte	32
	.byte	0
	.section	.rodata.11
l212:
	.byte	58
	.byte	32
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.12
	.global	_buildmenu
_buildmenu:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 651
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/main.c, line 651
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l249
		add	r7

						//../DeMiSTify/firmware/main.c, line 652
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_menuindex
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
						// freereg r1
l249: # 

						//../DeMiSTify/firmware/main.c, line 653
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	7
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 653
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_menuindex
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/main.c, line 653
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 653
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 653
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_menupage
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 653
						//call
						//pcreltotemp
	.lipcrel	_parseconf
	add	r7
						// Flow control - popping 12 + 0 bytes
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 654
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_menupage
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 654
						//call
						//pcreltotemp
	.lipcrel	l121
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 655
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//../DeMiSTify/firmware/main.c, line 655
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l251
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 656
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_menu
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 656
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l251: # 
						// allocreg r1
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.13
	.weak	_autoboot
_autoboot:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//../DeMiSTify/firmware/main.c, line 675
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 679
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_romtype
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

						//../DeMiSTify/firmware/main.c, line 681
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_bootrom_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 681
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 681
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 681
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l256
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 682
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l257,0
						// static pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
l256: # 

						//../DeMiSTify/firmware/main.c, line 686
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata.14
l257:
	.byte	82
	.byte	79
	.byte	77
	.byte	32
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	102
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.15
	.weak	_get_rtc
_get_rtc:
	stdec	r6
	mt	r3
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 403
						// const
	.liconst	255
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 694
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-44
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 696
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-4
						//sizemod based on type 0x503
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 33
	.liconst	1
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x6a
	mt	r0
	st	r6

						//../DeMiSTify/firmware/main.c, line 696
						// (test)
						// (obj to tmp) flags 6a type 503
						// matchobj comparing flags 106 with 106

			// required value found in tmp
				// flags 6a
	mr	r0
	and	r0

						//../DeMiSTify/firmware/main.c, line 696
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l261
		add	r7

						//../DeMiSTify/firmware/main.c, line 699
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 106
						// matchobj comparing flags 161 with 106
						// deref
						// const to r0
						// matchobj comparing flags 1 with 106
						// matchobj comparing flags 1 with 106
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	65
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 700
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 403
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	146
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 1
						// matchobj comparing flags 576 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 1
						// extern (offset 1)
	.liabs	_sector_buffer, 1
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 701
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	-1
	add	r0

						// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 702
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 702
						// Z disposable
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 576
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 703
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 703
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 130
						//extern: comparing 2 with 1
						//Fuzzy match found, offset: 1 (varadr: 1)
	.liconst	1
	add	r0

						// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 1
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 704
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 704
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 576
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 705
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 705
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 98 with 576
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 706
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 706
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 576
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 707
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 240 type 403
						// matchobj comparing flags 576 with 98
						// matchobj comparing flags 576 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)store type 3
	st	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 707
						//FIXME convert
						// (convert - reducing type 403 to 101
						// (prepobj r0)
 						// matchobj comparing flags 130 with 576
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 62 type 403
						// matchobj comparing flags 98 with 576
						// matchobj comparing flags 98 with 130
						// deref 
	ld	r2
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 708
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// extern (offset 6)
	.liabs	_sector_buffer, 10
						// extern pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 709
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 130
						// matchobj comparing flags 161 with 130
						// deref
						// const to r0
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	64
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 712
						//pcreltotemp
	.lipcrel	l262
	add	r7
l261: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 713
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 1)
	.liabs	_sector_buffer, 1
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 713
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 1
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	-1
	add	r0

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

						//../DeMiSTify/firmware/main.c, line 714
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 715
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 2 with 1
						//Fuzzy match found, offset: 1 (varadr: 1)
	.liconst	1
	add	r0

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

						//../DeMiSTify/firmware/main.c, line 716
						// (a/p assign)
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
	.liconst	25
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 717
						// (a/p assign)
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
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 718
						// (a/p assign)
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
	.liconst	34
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 719
						// (a/p assign)
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
	.liconst	3
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
l262: # 

						//../DeMiSTify/firmware/main.c, line 721
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 7)
	.liabs	_sector_buffer, 7
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

						//../DeMiSTify/firmware/main.c, line 722
						//setreturn
						// (obj to r0) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 8
						//Fuzzy match found, offset: -8 (varadr: 0)
	.liconst	-8
	add	r0

			// required value found in r0
						// freereg r2
						// freereg r3
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 4
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
	.section	.text.16
	.weak	_init
_init:
	stdec	r6
						// allocreg r2

						//../DeMiSTify/firmware/main.c, line 732
						//call
						//pcreltotemp
	.lipcrel	_PS2Init
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 734
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 734
						//call
						//pcreltotemp
	.lipcrel	_buildmenu
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 739
						//call
						//pcreltotemp
	.lipcrel	_sd_init
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 739
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 739
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l269
		add	r7

						//../DeMiSTify/firmware/main.c, line 739
						//call
						//pcreltotemp
	.lipcrel	_FindDrive
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 739
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 739
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l269
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 739
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 739
						//pcreltotemp
	.lipcrel	l270
	add	r7
l269: # 

						//../DeMiSTify/firmware/main.c, line 739
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l270: # 

						//../DeMiSTify/firmware/main.c, line 739
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//../DeMiSTify/firmware/main.c, line 739
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l277
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 741
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 741
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l271,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 741
						//call
						//pcreltotemp
	.lipcrel	_Menu_Message
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l276: # 
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 742
						//pcreltotemp
	.lipcrel	l276
	add	r7
l277: # 
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 747
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 747
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l275,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/main.c, line 747
						//call
						//pcreltotemp
	.lipcrel	_Menu_Message
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 748
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 748
						//call
						//pcreltotemp
	.lipcrel	_autoboot
	add	r7
						// Nested call - popping 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/main.c, line 748
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/main.c, line 748
						//call
						//pcreltotemp
	.lipcrel	_Menu_Message
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/main.c, line 750
						//call
						//pcreltotemp
	.lipcrel	_EnableInterrupts
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r2
	.liconst	-8
	sub	r6
	ldinc	r6
	mr	r7

	.section	.rodata.17
l271:
	.byte	83
	.byte	68
	.byte	32
	.byte	102
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	46
	.byte	0
	.section	.rodata.18
l275:
	.byte	66
	.byte	111
	.byte	111
	.byte	116
	.byte	105
	.byte	110
	.byte	103
	.byte	46
	.byte	46
	.byte	46
	.byte	0
	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.19
	.weak	_mainloop
_mainloop:
	stdec	r6
l283: # 

						//../DeMiSTify/firmware/main.c, line 768
						//call
						//pcreltotemp
	.lipcrel	_Menu_Run
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/main.c, line 759
						//pcreltotemp
	.lipcrel	l283
	add	r7
	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1a
	.weak	_main
_main:
	stdec	r6

						//../DeMiSTify/firmware/main.c, line 787
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menuindex
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

						//../DeMiSTify/firmware/main.c, line 788
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_menupage
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

						//../DeMiSTify/firmware/main.c, line 789
						//call
						//pcreltotemp
	.lipcrel	_init
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/main.c, line 790
						//call
						//pcreltotemp
	.lipcrel	_mainloop
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/main.c, line 791
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
	ldinc	r6
	mr	r7

	.section	.data.1b
	.global	_romtype
_romtype:
	.byte	0
	.section	.data.1c
	.global	_unit
_unit:
	.byte	0
	.section	.data.1d
	.weak	_rom_minsize
_rom_minsize:
	.int	1
	.section	.data.1e
	.global	_std_label_exit
_std_label_exit:
	.byte	128
	.byte	32
	.byte	69
	.byte	120
	.byte	105
	.byte	116
	.byte	0
	.section	.data.1f
	.global	_std_label_back
_std_label_back:
	.byte	128
	.byte	32
	.byte	66
	.byte	97
	.byte	99
	.byte	107
	.byte	0
	.section	.data.20
	.global	_menu
_menu:
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,30
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,60
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,90
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,120
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,150
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// extern (offset 0)
	.ref	_selectrom
						// Declaring from tree
						// static
	.ref	l45,180
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l44
	.int	0
	.byte	0
	.byte	0
	.byte	0
						// Declaring from tree
						// static
	.ref	l43
	.int	0
	.byte	0
	.byte	0
	.byte	0
	.section	.data.21
	.weak	_bootrom_name
_bootrom_name:
						// Declaring from tree
						// static
	.ref	l252
	.section	.bss.22
	.global	_menupage
	.comm	_menupage,4
	.section	.bss.23
	.global	_file
	.comm	_file,20
	.section	.bss.24
	.global	_menuindex
	.comm	_menuindex,4
	.section	.bss.25
	.global	_moremenu
	.comm	_moremenu,4
	.section	.bss.26
	.global	_romindex
	.comm	_romindex,4
	.section	.bss.27
	.global	_filename
	.comm	_filename,12
	.section	.rodata.28
l252:
	.byte	80
	.byte	67
	.byte	88
	.byte	84
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	82
	.byte	79
	.byte	77
	.byte	0
	.section	.bss.29
	.lcomm	l45,210
