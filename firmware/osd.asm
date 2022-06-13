	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_spi_osd_cmd_cont
_spi_osd_cmd_cont:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 25
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
	.liconst	521
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 26
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
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
	.global	_spi_osd_cmd
_spi_osd_cmd:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 30
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 30
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd_cont
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 31
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done
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
	.section	.text.2
	.global	_spi_osd_cmd8_cont
_spi_osd_cmd8_cont:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 35
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
	.liconst	521
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 36
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 42 type 101
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 66
						// matchobj comparing flags 161 with 66
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 66
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness

						//../DeMiSTify/firmware/osd.c, line 37
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// var, auto|reg
	.liconst	4
	ldidx	r6
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x21
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 2
						// matchobj comparing flags 161 with 2
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	-44
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
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
	.global	_spi_osd_cmd8
_spi_osd_cmd8:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 41
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 64
						// var, auto|reg
						// matchobj comparing flags 1 with 64
	.liconst	4
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 41
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

						//../DeMiSTify/firmware/osd.c, line 41
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 41
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd8_cont
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 42
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.4
	.global	_OsdWriteStart
_OsdWriteStart:
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

						//../DeMiSTify/firmware/osd.c, line 52
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/osd.c, line 52
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l16
		add	r7

						//../DeMiSTify/firmware/osd.c, line 53
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l16: # 

						//../DeMiSTify/firmware/osd.c, line 54
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
	.liconst	521
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 55
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	32
	or	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 55
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

						//../DeMiSTify/firmware/osd.c, line 56
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l9,0
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

						//../DeMiSTify/firmware/osd.c, line 57
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	8
	ldidx	r6

						//../DeMiSTify/firmware/osd.c, line 57
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l18
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 57
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	255
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 57
						//pcreltotemp
	.lipcrel	l19
	add	r7
l18: # 

						//../DeMiSTify/firmware/osd.c, line 57
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done
l19: # 

						//../DeMiSTify/firmware/osd.c, line 57
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l10,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r1

						//../DeMiSTify/firmware/osd.c, line 58
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6

						//../DeMiSTify/firmware/osd.c, line 58
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7

						//../DeMiSTify/firmware/osd.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	21845
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 58
						//pcreltotemp
	.lipcrel	l22
	add	r7
l21: # 

						//../DeMiSTify/firmware/osd.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	65535
						// (save temp)isreg
	mr	r2
						//save_temp done
l22: # 

						//../DeMiSTify/firmware/osd.c, line 58
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l11,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2

						//../DeMiSTify/firmware/osd.c, line 59
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,0
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
	.section	.text.5
	.global	_OsdPutChar
_OsdPutChar:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r3

						//../DeMiSTify/firmware/osd.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 64
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 67
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 2
						// reg r2 - only match against tmp
	mt	r2
				// flags 42
	and	r2

						//../DeMiSTify/firmware/osd.c, line 67
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 68
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 66
						// reg r2 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 68
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 68
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 4
						// (obj to r3) flags 82 type a
						// (prepobj r3)
 						// extern (offset -256)
	.liabs	_font, -256
						// extern pe is varadr
	mr	r3
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	add	r3
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 70
						//pcreltotemp
	.lipcrel	l27
	add	r7
l26: # 

						//../DeMiSTify/firmware/osd.c, line 70
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_font
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
l27: # 

						//../DeMiSTify/firmware/osd.c, line 71
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done
l32: # 
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 73
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 301
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 73
						// (bitwise/arithmetic) 	//ops: 2, 5, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 106
						// reg r4 - only match against tmp
	mt	r4
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 73
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l10,0
						//static deref
						//sizemod based on type 0x3
	ldt
	xor	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 73
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 2
						// deref
						// const to r0
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/osd.c, line 74
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	1
	sgn
	shr	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 72
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/osd.c, line 72
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r5

						//../DeMiSTify/firmware/osd.c, line 72
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7

						//../DeMiSTify/firmware/osd.c, line 76
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
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
	.liconst	8
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l9,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
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
	.section	.text.6
	.global	_OsdPuts
_OsdPuts:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 82
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 64
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 82
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 106
						// reg r2 - only match against tmp
	//mt
				// flags 42
	and	r2

						//../DeMiSTify/firmware/osd.c, line 82
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l40
		add	r7
						// freereg r1
l39: # 
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 83
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 83
						//call
						//pcreltotemp
	.lipcrel	_OsdPutChar
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 82
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 101
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 82
						// (test)
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 106
						// reg r2 - only match against tmp
	//mt
				// flags 42
	and	r2

						//../DeMiSTify/firmware/osd.c, line 82
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7
l40: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
	.global	_OsdWriteEnd
_OsdWriteEnd:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 89
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l9,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 89
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l9,0
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

						//../DeMiSTify/firmware/osd.c, line 89
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	256
	sgn
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 89
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l47
		add	r7
l46: # 

						//../DeMiSTify/firmware/osd.c, line 90
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l10,0
						//static deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/osd.c, line 89
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l9,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 89
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						//Special case - addt
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l9,0
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

						//../DeMiSTify/firmware/osd.c, line 89
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	256
	sgn
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/osd.c, line 89
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l46
		add	r7
l47: # 

						//../DeMiSTify/firmware/osd.c, line 91
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
	.liconst	8
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/osd.c, line 92
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l12,0
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
	ldinc	r6
	mr	r7

	.section	.bss.8
	.lcomm	l9,4
	.section	.bss.9
	.lcomm	l10,4
	.section	.bss.a
	.lcomm	l11,4
	.section	.bss.b
	.lcomm	l12,4
