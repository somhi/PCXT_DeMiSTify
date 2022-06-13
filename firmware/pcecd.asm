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
	.global	_bin2bcd
_bin2bcd:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 83
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 83
						//Call division routine
	//mt
	stdec	r6
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	10
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r0
	mr	r1
	ldinc	r6
	mr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 83
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	16
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 83
						//Call division routine
	mt	r1
	stdec	r6
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	10
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r1
	mr	r2
	ldinc	r6
	mr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 83
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 83
						//FIXME convert
						// (convert - reducing type 3 to 101
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r1

						//../DeMiSTify/firmware/pcecd.c, line 83
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 101
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
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
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_bcd2bin
_bcd2bin:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 101
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 87
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 87
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 87
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 87
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 87
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	addt	r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 87
						//FIXME convert
						// (convert - reducing type 3 to 101
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r1

						//../DeMiSTify/firmware/pcecd.c, line 87
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 101
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
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
	.section	.text.2
	.global	_gettrackbybcd
_gettrackbybcd:
	stdec	r6
	mt	r3
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
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 92
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 101
						// matchobj comparing flags 66 with 64
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 92
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 92
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 92
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 93
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/pcecd.c, line 93
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l8
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 94
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done
l8: # 

						//../DeMiSTify/firmware/pcecd.c, line 95
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_toc, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r3

						//../DeMiSTify/firmware/pcecd.c, line 95
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l10
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 96
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l10: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 97
						//call
						//pcreltotemp
	.lipcrel	_cue_parse
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 98
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
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
	.section	.text.3
l13:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 140
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l11,4
						// static pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1

						//../DeMiSTify/firmware/pcecd.c, line 141
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l11,1
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	4
	ldidx	r6
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 142
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	8
	ldidx	r6
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 143
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	12
	ldidx	r6
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
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
l16:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 102
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 148
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
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

						//../DeMiSTify/firmware/pcecd.c, line 149
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
	.liconst	97
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 150
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 102
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 150
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 150
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
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 150
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 150
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

						//../DeMiSTify/firmware/pcecd.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
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
	.section	.text.5
l19:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 156
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l12,58
						// static pe not varadr
						//sizemod based on type 0x102
	hlf
	stmpdec	r1

						//../DeMiSTify/firmware/pcecd.c, line 157
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,10
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
	.section	.text.6
l22:
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
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 161
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 64
						// deref
						// const to r0
						// matchobj comparing flags 1 with 64
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

						//../DeMiSTify/firmware/pcecd.c, line 162
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
	.liconst	100
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 163
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 102
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 163
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	//mt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 163
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
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 164
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 102
						// matchobj comparing flags 2 with 74
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 102
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	8
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 164
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r2
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/pcecd.c, line 164
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 164
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	7
	shl	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 164
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	or	r2
						// (save result) // isreg
						// freereg r3

						//../DeMiSTify/firmware/pcecd.c, line 164
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 165
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 165
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 165
						//call
						//pcreltotemp
	.lipcrel	_spi_write
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 166
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
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r4
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 2
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
l25:
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
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//../DeMiSTify/firmware/pcecd.c, line 171
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 173
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6

						//../DeMiSTify/firmware/pcecd.c, line 173
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7
l33: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 175
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

						//../DeMiSTify/firmware/pcecd.c, line 175
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 106
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 176
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 301
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 176
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 176
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 177
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 301
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 177
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 177
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	8
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 178
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 301
						// matchobj comparing flags 106 with 1
						// deref 
	ldbinc	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 178
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 179
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 5, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	xor	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 180
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	12
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	4
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 181
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 181
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 182
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
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
l32: # 

						//../DeMiSTify/firmware/pcecd.c, line 173
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	12
	ldidx	r6

						//../DeMiSTify/firmware/pcecd.c, line 173
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7
l34: # 

						//../DeMiSTify/firmware/pcecd.c, line 184
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r3
						// freereg r4
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
	.section	.text.8
l35:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2048
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 192
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_toc, 24
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 192
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 192
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 192
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 196
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_toc, 28
						//extern deref
						//sizemod based on type 0x3
	ldt
	cmp	r3

						//../DeMiSTify/firmware/pcecd.c, line 196
	cond	EQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l42
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 197
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 52
						//extern deref
						//sizemod based on type 0x103
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 197
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 197
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 197
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l42: # 

						//../DeMiSTify/firmware/pcecd.c, line 201
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 240 type 3
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 201
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 576
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 576
						// extern (offset 0)
	.liabs	_cd_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 201
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 36 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 36 with 0
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 201
						//call
						//pcreltotemp
	.lipcrel	_FileRead
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 203
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_toc, 28
						//extern deref
						//sizemod based on type 0x3
	ldt
	cmp	r3

						//../DeMiSTify/firmware/pcecd.c, line 203
	cond	EQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l44
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 204
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r1
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2064
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 204
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/pcecd.c, line 204
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_toc, 52
						//extern deref
						//sizemod based on type 0x103
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 204
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 204
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 204
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
l44: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 209
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	8
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 209
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 209
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 74
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 209
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 576
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 576
						// extern (offset 0)
	.liabs	_cd_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 209
						//call
						//pcreltotemp
	.lipcrel	l22
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 211
						//pcreltotemp
	.lipcrel	l45
	add	r7
l39: # 

						//../DeMiSTify/firmware/pcecd.c, line 212
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2352
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 212
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_cd_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 212
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						//extern: comparing 36 with 0
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						//extern: comparing 36 with 0
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 212
						//call
						//pcreltotemp
	.lipcrel	_FileRead
	add	r7
						// Deferred popping of 8 bytes (8 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 213
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	16
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 213
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 213
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2352
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 213
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_cd_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 213
						//call
						//pcreltotemp
	.lipcrel	l22
	add	r7
						// Flow control - popping 8 + 8 bytes
	.liconst	16
	add	r6
						// freereg r1
l45: # 
						// allocreg r1
						// freereg r1
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
	.section	.text.9
l46:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 219
						// (test)
						// (obj to tmp) flags 2 type 103
						// extern
	.liabs	_toc, 44
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 219
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l50
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 220
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,4
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 221
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 221
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 221
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	11
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 221
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 221
						//call
						//pcreltotemp
	.lipcrel	l13
	add	r7
						// Flow control - popping 12 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 222
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 222
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 223
						//setreturn
						// (obj to r0) flags 1 type 101
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/pcecd.c, line 224
						//pcreltotemp
	.lipcrel	l47
	add	r7
l50: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 225
						//setreturn
						// (obj to r0) flags 1 type 101
						// const
	.liconst	1
	mr	r0
l47: # 
						// freereg r1
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
	.section	.text.a
l52:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 233
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 2 type 103
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,0
						//static deref
						//sizemod based on type 0x103
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 233
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l56
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 234
						//FIXME convert
						// (convert - reducing type 104 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 104
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l51,0
						//static deref
						//sizemod based on type 0x104
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/pcecd.c, line 234
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 234
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 234
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 235
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	13
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 235
						//call
						//pcreltotemp
	.lipcrel	_GetTimer
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 235
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 235
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 104
						// (prepobj tmp)
 						// static
	.liabs	l51,4
						// static pe not varadr
						//sizemod based on type 0x104
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 236
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 103
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,0
						//static deref
						//sizemod based on type 0x103
	ldt
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
 						// static
	.liabs	l12,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 238
						//pcreltotemp
	.lipcrel	l97
	add	r7
l56: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 240
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,4
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 240
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	cmp	r2

						//../DeMiSTify/firmware/pcecd.c, line 240
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l60
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 242
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,17
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 242
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 243
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,4
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 245
						//pcreltotemp
	.lipcrel	l97
	add	r7
l62: # 

						//../DeMiSTify/firmware/pcecd.c, line 248
						// (test)
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,15
						//static deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 248
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 252
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 44
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 252
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 253
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,4
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 254
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 254
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 254
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	11
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 254
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 254
						//call
						//pcreltotemp
	.lipcrel	l13
	add	r7
						// Flow control - popping 12 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 255
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 255
						//call
						//pcreltotemp
	.lipcrel	l19
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 257
						//pcreltotemp
	.lipcrel	l97
	add	r7
l66: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 264
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,15
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 266
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 24
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 266
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 268
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
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 268
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2048
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 268
						//call
						//pcreltotemp
	.lipcrel	l35
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 269
						//pcreltotemp
	.lipcrel	l71
	add	r7
l68: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 270
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 270
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l71
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 271
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,5
						// static pe not varadr
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
l71: # 

						//../DeMiSTify/firmware/pcecd.c, line 275
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,25
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
	.liabs	l12,29
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 277
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

						//../DeMiSTify/firmware/pcecd.c, line 277
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l73
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 278
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 278
						//call
						//pcreltotemp
	.lipcrel	l19
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 279
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,4
						// static pe not varadr
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
l73: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 282
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,25
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 283
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 20
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 283
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 284
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,17
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,21
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 285
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 285
						//call
						//pcreltotemp
	.lipcrel	_cue_parse
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 286
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,5
						// static pe not varadr
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
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 287
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/pcecd.c, line 287
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 287
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 287
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 289
						//pcreltotemp
	.lipcrel	l97
	add	r7
l60: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 289
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	3
	cmp	r2

						//../DeMiSTify/firmware/pcecd.c, line 289
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 291
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_toc, 44
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 291
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l80
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 292
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,4
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 293
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 293
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 293
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	11
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 293
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 293
						//call
						//pcreltotemp
	.lipcrel	l13
	add	r7
						// Flow control - popping 12 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	12
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 294
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 294
						//call
						//pcreltotemp
	.lipcrel	l19
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 296
						//pcreltotemp
	.lipcrel	l97
	add	r7
l80: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 298
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 298
						//call
						//pcreltotemp
	.lipcrel	_cue_gettrackbylba
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 298
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,21
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 301
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,16
						//static deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 301
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 303
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 303
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,49
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 303
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7
l98: # 

						//../DeMiSTify/firmware/pcecd.c, line 304
						// (test)
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_toc, 24
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 304
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l88
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 305
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 305
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2352
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 305
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_toc, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 305
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/pcecd.c, line 305
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 305
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 305
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 307
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 307
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2352
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 307
						//call
						//pcreltotemp
	.lipcrel	l35
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1
l88: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 309
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,25
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 303
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 303
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,49
						//static deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r3

						//../DeMiSTify/firmware/pcecd.c, line 303
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l98
		add	r7
l99: # 

						//../DeMiSTify/firmware/pcecd.c, line 313
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,49
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

						//../DeMiSTify/firmware/pcecd.c, line 315
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,45
						//static deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 315
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 315
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 24
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 315
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 315
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,17
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 315
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// freereg r1
l89: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 317
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,53
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 317
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 317
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l94
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 318
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l12,21
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,41
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 319
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,0
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 321
						//pcreltotemp
	.lipcrel	l95
	add	r7
l94: # 

						//../DeMiSTify/firmware/pcecd.c, line 322
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,4
						// static pe not varadr
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
						// freereg r1
l95: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 325
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,53
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 325
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 325
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 326
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 326
						//call
						//pcreltotemp
	.lipcrel	l19
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l97: # 
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
	.section	.text.b
l100:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-60
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3

						//../DeMiSTify/firmware/pcecd.c, line 340
						// (address)
						// (prepobj tmp)
 						// reg r6 - no need to prep
	mt	r6
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 340
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 340
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 340
						//call
						//pcreltotemp
	.lipcrel	___memset
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 344
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
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 345
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
	.liconst	98
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 347
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
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
l176: # 
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 348
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 348
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 348
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 1
	.liconst	32
						//sizemod based on type 0xa
	ldidx	r6
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 348
						// Z disposable
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 2
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x503
	ld	r0
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 348
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 33
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
	.liconst	32
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
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 348
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	12
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 348
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l176
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 349
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

						//../DeMiSTify/firmware/pcecd.c, line 354
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r4)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	36
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 1
						// reg r4 - only match against tmp
	//mt
				// flags 4a
	and	r4
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 1
	.liconst	3
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	5
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l120
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	13
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l130
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	195
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l134
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l145
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l163
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	3
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l166
		add	r7
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	sub	r4
						// (save result) // isreg
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l112
		add	r7
						//pcreltotemp
	.lipcrel	l175
	add	r7
						// freereg r1
l108: # 

						//../DeMiSTify/firmware/pcecd.c, line 356
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 356
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 356
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 357
						// (a/p assign)
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

						//../DeMiSTify/firmware/pcecd.c, line 357
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 360
						//pcreltotemp
	.lipcrel	l107
	add	r7
l111: # 

						//../DeMiSTify/firmware/pcecd.c, line 363
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	18
						// (save temp)store type 1
	byt
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 364
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	1
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	128
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 366
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
	.liconst	112
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 367
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 0, 4 with 0, 3
						//Fuzzy match found, offset: 1 (varadr: 1)
	.liconst	1
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,0
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 368
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 0, 9 with 0, 5
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	10
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 369
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 0, 14 with 0, 10
						//Fuzzy match found, offset: 4 (varadr: 1)
	.liconst	4
	add	r0

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,1
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 370
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,2
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 371
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,3
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 373
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l11,3
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 373
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l11,2
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,3
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 373
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l11,1
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,2
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 373
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l11,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l11,1
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 375
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

						//../DeMiSTify/firmware/pcecd.c, line 375
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	18
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 375
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	10
	addt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 375
						//call
						//pcreltotemp
	.lipcrel	l22
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 379
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 379
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 380
						//pcreltotemp
	.lipcrel	l107
	add	r7
l112: # 

						//../DeMiSTify/firmware/pcecd.c, line 383
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 383
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 383
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 386
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	37
						//sizemod based on type 0x101
	byt
	ldidx	r6
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l116
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l118
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l119
		add	r7
						// freereg r1
l116: # 

						//../DeMiSTify/firmware/pcecd.c, line 389
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 101
						// const
	.liconst	2
						// (save temp)store type 1
	byt
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 390
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	1
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	128
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 391
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
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 392
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 392
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 392
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	3
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!

						//../DeMiSTify/firmware/pcecd.c, line 393
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 394
						//pcreltotemp
	.lipcrel	l115
	add	r7
						// freereg r2
l118: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 397
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_toc
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	150
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 398
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	48
	addt	r6
	stdec	r6
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 398
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 398
						//call
						//pcreltotemp
	.lipcrel	_LBA2MSF
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 400
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	byt
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 401
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	1
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	128
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 402
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	48
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 402
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 402
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	2
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 403
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	49
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 403
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 403
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	3
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 404
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	50
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 404
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 404
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!

						//../DeMiSTify/firmware/pcecd.c, line 405
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	5
	addt	r6
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

						//../DeMiSTify/firmware/pcecd.c, line 406
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 32, 0 with 0, 6
						//Fuzzy match found, offset: 26 (varadr: 1)
	.liconst	26
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 407
						//pcreltotemp
	.lipcrel	l115
	add	r7
l119: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 410
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	38
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 410
						//call
						//pcreltotemp
	.lipcrel	_gettrackbybcd
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 411
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	150
	add	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 414
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	48
	addt	r6
	stdec	r6
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 414
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 414
						//call
						//pcreltotemp
	.lipcrel	_LBA2MSF
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 416
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	byt
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 417
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	1
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	128
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 418
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	48
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 418
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 418
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	2
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 419
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	49
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 419
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 419
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	3
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 420
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	50
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 420
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 420
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 421
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// extern
	.liabs	_toc, 24
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 421
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	9
	addt	r6
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 422
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						//auto: flags: 82, comparing 32, 0 with 0, 5
						// Fuzzy match found against tmp.
	mr	r0
	.liconst	27
	add	r0

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	4
						// (save temp)store type 3
	st	r0
						//save_temp done
l115: # 
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 426
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 426
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 426
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	10
	addt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 426
						//call
						//pcreltotemp
	.lipcrel	l22
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 430
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 430
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 432
						//pcreltotemp
	.lipcrel	l107
	add	r7
l120: # 

						//../DeMiSTify/firmware/pcecd.c, line 435
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 435
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 435
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 437
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	37
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 437
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 437
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	38
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 437
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 437
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 437
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	39
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 437
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 437
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2097151
	and	r5
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 438
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6

						//../DeMiSTify/firmware/pcecd.c, line 438
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l124
		add	r7
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 438
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 2

			// required value found in tmp
	mr	r0
				//return 0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 438
						//pcreltotemp
	.lipcrel	l125
	add	r7
l124: # 

						//../DeMiSTify/firmware/pcecd.c, line 438
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	256
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l125: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 440
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 440
						//call
						//pcreltotemp
	.lipcrel	_cue_gettrackbylba
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 440
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,21
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 456
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,0
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 460
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l12,25
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r5

						//../DeMiSTify/firmware/pcecd.c, line 461
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,25
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 463
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
	sub	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 463
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 28
						//extern deref
						//sizemod based on type 0x3
	ldt
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 463
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 12
						//extern deref
						//sizemod based on type 0x3
	ldt
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 464
						//FIXME convert
						// (convert - reducing type 3 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/pcecd.c, line 464
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 464
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// extern (offset 36)
	.liabs	_toc, 36
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 464
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 130
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 468
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l12,37
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

						//../DeMiSTify/firmware/pcecd.c, line 470
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,15
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 471
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,4
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	2
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 475
						//pcreltotemp
	.lipcrel	l107
	add	r7
l130: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 480
						// (test)
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6

						//../DeMiSTify/firmware/pcecd.c, line 480
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l132
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 481
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,14
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 483
						//pcreltotemp
	.lipcrel	l107
	add	r7
						// freereg r1
l132: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 484
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 484
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 487
						//pcreltotemp
	.lipcrel	l107
	add	r7
l134: # 

						//../DeMiSTify/firmware/pcecd.c, line 490
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 490
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 490
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 493
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	45
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 493
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	192
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l138
		add	r7
						// allocreg r1
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	64
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l140
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	64
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l141
		add	r7
						// freereg r1
						// freereg r2
l138: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 496
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	39
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 496
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 496
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 496
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 496
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 496
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	41
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 496
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	mr	r5
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	or	r5
						// (save result) // isreg
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 497
						//pcreltotemp
	.lipcrel	l137
	add	r7
l140: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 500
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	43
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 500
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Nested call - popping 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	46
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 500
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Nested call - popping 0 bytes
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 500
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 74
						// reg r2 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 500
						//call
						//pcreltotemp
	.lipcrel	_MSF2LBA
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 500
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//../DeMiSTify/firmware/pcecd.c, line 501
						//pcreltotemp
	.lipcrel	l137
	add	r7
l141: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 505
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	38
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 505
						//call
						//pcreltotemp
	.lipcrel	_gettrackbybcd
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 506
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done
l137: # 

						//../DeMiSTify/firmware/pcecd.c, line 517
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,0
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 522
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l12,25
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r5
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 523
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 130
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 523
						//call
						//pcreltotemp
	.lipcrel	_cue_gettrackbylba
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 523
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l12,21
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 528
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l12,45
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r5

						//../DeMiSTify/firmware/pcecd.c, line 529
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l12,45
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 530
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,53
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	37
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 531
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,49
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

						//../DeMiSTify/firmware/pcecd.c, line 533
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,53
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 533
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 533
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l143
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 534
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,4
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	4
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 535
						//pcreltotemp
	.lipcrel	l144
	add	r7
l143: # 

						//../DeMiSTify/firmware/pcecd.c, line 536
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,4
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l144: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 539
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 539
						//call
						//pcreltotemp
	.lipcrel	l19
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 542
						//pcreltotemp
	.lipcrel	l107
	add	r7
l145: # 

						//../DeMiSTify/firmware/pcecd.c, line 545
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 545
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 545
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 548
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	45
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 548
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r1 - only match against tmp
	//mt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	192
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l149
		add	r7
						// allocreg r1
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	64
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l151
		add	r7
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags a type 3
						// matchobj comparing flags 10 with 10

			// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 10
	.liconst	64
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// (test)
						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
				// flags a
	//mr
	and	r0
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l152
		add	r7
						// freereg r1
						// freereg r2
l149: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 551
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	39
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 551
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shl	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 551
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 551
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 551
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 551
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	41
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 551
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	mr	r5
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	or	r5
						// (save result) // isreg
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 552
						//pcreltotemp
	.lipcrel	l148
	add	r7
l151: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	40
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 555
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	43
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 555
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Nested call - popping 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// Q1 disposable
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	//mt
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	46
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 555
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Nested call - popping 0 bytes
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 555
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 74
						// reg r2 - only match against tmp
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/pcecd.c, line 555
						//call
						//pcreltotemp
	.lipcrel	_MSF2LBA
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 555
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r5

						//../DeMiSTify/firmware/pcecd.c, line 556
						//pcreltotemp
	.lipcrel	l148
	add	r7
l152: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 560
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	38
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 560
						//call
						//pcreltotemp
	.lipcrel	_bcd2bin
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 560
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/pcecd.c, line 560
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 4a type 101
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 562
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

						//../DeMiSTify/firmware/pcecd.c, line 562
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l154
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 562
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	32
	addt	r6
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
l154: # 

						//../DeMiSTify/firmware/pcecd.c, line 563
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 4
						//extern deref
						//sizemod based on type 0x3
	ldt
	sgn
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 563
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l156
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 563
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 138
						// matchobj comparing flags 2 with 138
						// extern
	.liabs	_toc
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 563
						//pcreltotemp
	.lipcrel	l157
	add	r7
l156: # 

						//../DeMiSTify/firmware/pcecd.c, line 563
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	32
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 138
						// matchobj comparing flags 2 with 138
						// extern
	.liabs	_toc, 20
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
l157: # 

						//../DeMiSTify/firmware/pcecd.c, line 563
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	32
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l148: # 

						//../DeMiSTify/firmware/pcecd.c, line 568
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,53
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	37
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 569
						// (a/p assign)
						// (prepobj tmp)
 						// static
	.liabs	l12,49
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r5
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 571
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,53
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 571
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 571
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l159
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 572
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,4
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 573
						//pcreltotemp
	.lipcrel	l160
	add	r7
l159: # 

						//../DeMiSTify/firmware/pcecd.c, line 574
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,4
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	3
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
l160: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 579
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,53
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 579
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 579
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 580
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 580
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 583
						//pcreltotemp
	.lipcrel	l107
	add	r7
l163: # 

						//../DeMiSTify/firmware/pcecd.c, line 586
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 586
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 586
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 588
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l12,4
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	4
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 590
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 590
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 593
						//pcreltotemp
	.lipcrel	l107
	add	r7
l166: # 

						//../DeMiSTify/firmware/pcecd.c, line 596
						//call
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 596
						// (test)
						// (obj to tmp) flags 4a type 101
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 596
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 598
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 74
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_toc, 16
						//extern deref
						//sizemod based on type 0x3
	ldt
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	36
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 600
						// (a/p assign)
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	10
						// (save temp)store type 1
	byt
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 601
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	1
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	128
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 602
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (obj to r0) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,4
						//static deref
						//sizemod based on type 0x101
	byt
	ldt
	mr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	55
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 2

			// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	4
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 602
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l170
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	51
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 602
						//pcreltotemp
	.lipcrel	l171
	add	r7
l170: # 

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// var, auto|reg
	.liconst	51
						//sizemod based on type 0x3
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	cmp	r0

						//../DeMiSTify/firmware/pcecd.c, line 602
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l173
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 138 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	55
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

						//../DeMiSTify/firmware/pcecd.c, line 602
						//pcreltotemp
	.lipcrel	l174
	add	r7
l173: # 

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	55
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
						// const
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done
l174: # 

						//../DeMiSTify/firmware/pcecd.c, line 602
						// (a/p assign)
						// (prepobj r0)
 						// var, auto|reg
	.liconst	51
	addt	r6
	mr	r0

						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 138
						// var, auto|reg
						// matchobj comparing flags 1 with 138
						// matchobj comparing flags 1 with 138
	.liconst	55
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
						// freereg r3
l171: # 

						//../DeMiSTify/firmware/pcecd.c, line 602
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// var, auto|reg
	.liconst	2
	addt	r6
	mr	r0

						// (obj to tmp) flags a type 3
						// matchobj comparing flags 10 with 130
						// matchobj comparing flags 10 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	51
						//sizemod based on type 0x3
	ldidx	r6
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 603
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 10
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 10
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 604
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,17
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	1
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 604
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 604
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	4
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 605
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,17
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 605
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 605
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	5
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r3

						//../DeMiSTify/firmware/pcecd.c, line 607
						// (address)
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	48
	addt	r6
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 607
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r3 - only match against tmp
	//mt
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 607
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	36
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 607
						//call
						//pcreltotemp
	.lipcrel	_LBA2MSF
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 608
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	52
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 608
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 608
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	10
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 609
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	53
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 609
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 609
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	11
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 610
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	54
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 610
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 610
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	12
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!

						//../DeMiSTify/firmware/pcecd.c, line 612
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type a
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6
						// freereg r3
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 612
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,21
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 612
						//call
						//pcreltotemp
	.lipcrel	_LBA2MSF
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 613
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	56
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 613
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 613
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	17
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 614
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	57
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 614
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 614
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	18
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 615
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// var, auto|reg
	.liconst	58
						//sizemod based on type 0x101
	byt
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 615
						//call
						//pcreltotemp
	.lipcrel	_bin2bcd
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 615
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x101, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	19
	addt	r6
	exg	r0
	stbinc	r0	//WARNING - pointer / reg not restored, might cause trouble!

						//../DeMiSTify/firmware/pcecd.c, line 617
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 617
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 617
						// (address)
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	18
	addt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 617
						//call
						//pcreltotemp
	.lipcrel	l22
	add	r7
						// Flow control - popping 8 + 8 bytes
	.liconst	16
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 621
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 621
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 623
						//pcreltotemp
	.lipcrel	l107
	add	r7
l175: # 
						// allocreg r3

						//../DeMiSTify/firmware/pcecd.c, line 626
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 626
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 626
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 626
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 626
						//call
						//pcreltotemp
	.lipcrel	l13
	add	r7
						// Flow control - popping 12 + 0 bytes
	.liconst	12
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 630
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l12,10
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
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 631
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

						//../DeMiSTify/firmware/pcecd.c, line 631
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l107: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-60
	sub	r6
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
	.section	.text.c
	.global	_pcecd_data
_pcecd_data:
	stdec	r6
	.liconst	-12
	add	r6
						// allocreg r2

						//../DeMiSTify/firmware/pcecd.c, line 639
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
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 640
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
	.liconst	99
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 642
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
l184: # 

						//../DeMiSTify/firmware/pcecd.c, line 643
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 643
						// (address)
						// (prepobj tmp)
 						// reg r6 - no need to prep
	mt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 643
						// (bitwise/arithmetic) 	//ops: 2, 3, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 643
						// Z disposable
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 66
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x503
	ld	r0
						//Saving to reg r0
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 643
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 643
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	10
	sgn
	cmp	r2

						//../DeMiSTify/firmware/pcecd.c, line 643
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l184
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 644
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
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
						// freereg r2
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-12
	sub	r6
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
	.section	.text.d
	.global	_pcecd_clear_busy
_pcecd_clear_busy:
	stdec	r6

						//../DeMiSTify/firmware/pcecd.c, line 652
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,15
						// static pe not varadr
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
	.section	.text.e
	.global	_pcecd_reset
_pcecd_reset:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 657
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,0
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 658
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,17
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
	stinc	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 659
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 660
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,29
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

						//../DeMiSTify/firmware/pcecd.c, line 661
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,5
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 662
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_toc, 44
						//extern deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 662
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l191
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 662
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 662
						//pcreltotemp
	.lipcrel	l192
	add	r7
l191: # 

						//../DeMiSTify/firmware/pcecd.c, line 662
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done
l192: # 

						//../DeMiSTify/firmware/pcecd.c, line 662
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// static
	.liabs	l12,8
						// static pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1

						//../DeMiSTify/firmware/pcecd.c, line 663
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,33
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
	stinc	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 664
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 665
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,10
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
	stinc	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 666
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 667
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 668
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,41
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
	stinc	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 669
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 670
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,53
						// static pe not varadr
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

						//../DeMiSTify/firmware/pcecd.c, line 671
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130

						// required value found in r0
						// (obj to tmp) flags 1 type 102
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 2
	hlf
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 672
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l12,16
						// static pe not varadr
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
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.f
	.global	_pcecd_poll
_pcecd_poll:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//../DeMiSTify/firmware/pcecd.c, line 679
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
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 680
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
	.liconst	96
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 680
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 33 with 1
						// matchobj comparing flags 33 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						//sizemod based on type 0x503
	ld	r0
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1

						//../DeMiSTify/firmware/pcecd.c, line 681
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
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

						//../DeMiSTify/firmware/pcecd.c, line 682
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 682
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 682
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l197
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 682
						//call
						//pcreltotemp
	.lipcrel	l100
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l197: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 683
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

						//../DeMiSTify/firmware/pcecd.c, line 683
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l199
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 683
						//call
						//pcreltotemp
	.lipcrel	_pcecd_data
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l199: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 684
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

						//../DeMiSTify/firmware/pcecd.c, line 684
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l201
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 684
						//call
						//pcreltotemp
	.lipcrel	_pcecd_clear_busy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l201: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 685
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

						//../DeMiSTify/firmware/pcecd.c, line 685
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l203
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 686
						//call
						//pcreltotemp
	.lipcrel	_pcecd_reset
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/pcecd.c, line 687
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
	.liconst	517
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 688
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
	.liconst	102
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 689
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
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 690
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
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
						// freereg r1
l203: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 692
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/pcecd.c, line 692
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj tmp)
 						// static
	.liabs	l12,20
						// static pe not varadr
						//sizemod based on type 0x101
	byt
	stmpdec	r1
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 694
						//call
						//pcreltotemp
	.lipcrel	l52
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/pcecd.c, line 699
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,10
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 699
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l205
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 699
						// (test)
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,0
						//static deref
						//sizemod based on type 0x103
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 699
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l205
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 700
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 102
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,54
						//static deref
						//sizemod based on type 0x102
	hlf
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 700
						//call
						//pcreltotemp
	.lipcrel	l16
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/pcecd.c, line 701
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l12,10
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
l205: # 
						// allocreg r1

						//../DeMiSTify/firmware/pcecd.c, line 703
						// (test)
						// (obj to tmp) flags 2 type 101
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l12,14
						//static deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/pcecd.c, line 703
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l208
		add	r7

						//../DeMiSTify/firmware/pcecd.c, line 704
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 2
						// deref
						// const to r0
						// matchobj comparing flags 1 with 2
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

						//../DeMiSTify/firmware/pcecd.c, line 705
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
	.liconst	101
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 706
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
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/pcecd.c, line 707
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
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

						//../DeMiSTify/firmware/pcecd.c, line 708
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// static
	.liabs	l12,14
						// static pe not varadr
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
l208: # 
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	.section	.bss.10
	.global	_cd_buffer
	.comm	_cd_buffer,2352
	.section	.data.11
l51:
	.int	0
	.section	.data.12
l193:
	.int	0
	.section	.bss.13
	.lcomm	l11,4
	.section	.bss.14
	.lcomm	l12,56
