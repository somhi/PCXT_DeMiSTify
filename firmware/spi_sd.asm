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
	.global	_SPI_PUMP
_SPI_PUMP:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 62
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 63
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 65
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 66
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 66
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

						//../DeMiSTify/firmware/spi_sd.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 68
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 69
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 69
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	or	r2
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 70
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 71
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 72
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 72
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

						//../DeMiSTify/firmware/spi_sd.c, line 73
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 74
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
	.global	_SPI_PUMP_LE
_SPI_PUMP_LE:
	stdec	r6
	mt	r3
	stdec	r6
	.liconst	-12
	add	r6
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-44
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 80
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 81
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 82
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 83
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	8
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x6a
	mt	r0
	st	r6
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 83
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 6a type 503
						// matchobj comparing flags 106 with 106

			// required value found in tmp
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 84
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 106
						// matchobj comparing flags 74 with 106
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/spi_sd.c, line 85
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 106
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 106
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 86
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 106
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	16
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	8
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 86
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 87
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 10
						// matchobj comparing flags 74 with 10
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/spi_sd.c, line 88
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 10
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 10
	.liconst	255
						// (save temp)store type 3
	st	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 89
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// matchobj comparing flags 608 with 10
						// deref 
	ld	r3
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	24
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0xa
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 89
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags a type 503
						// matchobj comparing flags 10 with 138
						// matchobj comparing flags 10 with 10

			// required value found in r0
	mt	r0
				//return 0
						//Saving to reg r2
						// (save temp)isreg
	mr	r2
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 90
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 10
						// matchobj comparing flags 74 with 10
						// reg r2 - only match against tmp
	//mt
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/spi_sd.c, line 91
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// matchobj comparing flags 74 with 10
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
						// freereg r3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	-12
	sub	r6
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
	.section	.text.2
	.global	_cmd_write
_cmd_write:
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
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 102
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 102
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 104
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sd_is_sdhc
						//extern deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/spi_sd.c, line 104
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l8
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 105
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 104
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r0
						// (save result) // not reg
						// Store_reg to type 0x104, flags 0x2
						// (prepobj tmp)
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.
	// Volatile, or not int - not caching
l8: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 109
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// var, auto|reg
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	24
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 109
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 109
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 110
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	16
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 110
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 110
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 111
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 111
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 111
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 112
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 104
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 112
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 116
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 116
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 116
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 104 to 503
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 104
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)store type 3
	st	r4
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 120
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 74
						// deref 
	ld	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 121
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	39999
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 121
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	cmp	r3

						//../DeMiSTify/firmware/spi_sd.c, line 121
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7
l14: # 

						//../DeMiSTify/firmware/spi_sd.c, line 123
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 124
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 121
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	1
	sub	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 121
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l15
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 121
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	cmp	r3

						//../DeMiSTify/firmware/spi_sd.c, line 121
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7
l15: # 

						//../DeMiSTify/firmware/spi_sd.c, line 128
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
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
	.global	_spi_spin
_spi_spin:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 136
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done
l22: # 

						//../DeMiSTify/firmware/spi_sd.c, line 137
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 137
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 137
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	200
	sgn
	cmp	r1

						//../DeMiSTify/firmware/spi_sd.c, line 137
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7
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
	.section	.text.4
	.global	_wait_initV2
_wait_initV2:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 146
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 147
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	19999
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l34: # 

						//../DeMiSTify/firmware/spi_sd.c, line 149
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 149
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711799
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 149
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 149
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 149
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l30
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 151
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 152
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1073741824
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 152
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	8847465
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 152
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 152
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 152
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l32
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 154
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 155
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 156
						//pcreltotemp
	.lipcrel	l24
	add	r7
l32: # 

						//../DeMiSTify/firmware/spi_sd.c, line 157
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes
l30: # 

						//../DeMiSTify/firmware/spi_sd.c, line 147
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 147
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 164
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l24: # 
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
	.section	.text.5
	.global	_wait_init
_wait_init:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 172
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 174
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	19
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l44: # 

						//../DeMiSTify/firmware/spi_sd.c, line 176
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 176
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711745
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 176
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 176
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 176
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l42
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 179
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 180
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 181
						//pcreltotemp
	.lipcrel	l36
	add	r7
l42: # 

						//../DeMiSTify/firmware/spi_sd.c, line 186
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 174
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 174
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l44
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 188
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l36: # 
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_is_sdhc
_is_sdhc:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// const
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/spi_sd.c, line 196
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/spi_sd.c, line 198
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	426
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 198
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8847432
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 198
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 200
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 200
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l49
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 203
						//call
						//pcreltotemp
	.lipcrel	_wait_init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 205
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 206
						//pcreltotemp
	.lipcrel	l46
	add	r7
						// freereg r1
l49: # 

						//../DeMiSTify/firmware/spi_sd.c, line 208
						//call
						//pcreltotemp
	.lipcrel	_SPI_PUMP
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 208
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/spi_sd.c, line 209
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	65535
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 209
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	426
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 209
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l51
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 212
						//call
						//pcreltotemp
	.lipcrel	_wait_init
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 214
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 215
						//pcreltotemp
	.lipcrel	l46
	add	r7
l51: # 

						//../DeMiSTify/firmware/spi_sd.c, line 217
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 224
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	49
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l65: # 

						//../DeMiSTify/firmware/spi_sd.c, line 226
						//call
						//pcreltotemp
	.lipcrel	_wait_initV2
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 226
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 226
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l61
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 228
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 228
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711802
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 228
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 228
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 228
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l61
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 231
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 232
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 234
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 235
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 236
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 237
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 238
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 238
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l60
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 241
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 242
						//pcreltotemp
	.lipcrel	l46
	add	r7
l60: # 

						//../DeMiSTify/firmware/spi_sd.c, line 246
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 247
						//pcreltotemp
	.lipcrel	l46
	add	r7
l61: # 

						//../DeMiSTify/firmware/spi_sd.c, line 252
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	cmp	r3

						//../DeMiSTify/firmware/spi_sd.c, line 252
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 255
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 256
						//pcreltotemp
	.lipcrel	l46
	add	r7
l64: # 

						//../DeMiSTify/firmware/spi_sd.c, line 224
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 224
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 258
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l46: # 
						// freereg r1
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
	.section	.text.7
	.global	_sd_init
_sd_init:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 266
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_sd_is_sdhc
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

						//../DeMiSTify/firmware/spi_sd.c, line 269
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 130
	.liconst	7
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l79: # 

						//../DeMiSTify/firmware/spi_sd.c, line 271
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
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 272
						//call
						//pcreltotemp
	.lipcrel	_spi_spin
	add	r7
						// Deferred popping of 0 bytes (0 in total)

						//../DeMiSTify/firmware/spi_sd.c, line 274
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
	.liconst	3
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 275
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 275
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	9764928
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 275
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 275
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	cmp	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 275
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l73
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 276
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r3
						//save_temp done
l73: # 

						//../DeMiSTify/firmware/spi_sd.c, line 278
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	2
	cmp	r3

						//../DeMiSTify/firmware/spi_sd.c, line 278
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l75
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 282
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 283
						//pcreltotemp
	.lipcrel	l67
	add	r7
l75: # 

						//../DeMiSTify/firmware/spi_sd.c, line 269
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 269
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 286
						//call
						//pcreltotemp
	.lipcrel	_is_sdhc
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 286
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sd_is_sdhc, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/spi_sd.c, line 287
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

						//../DeMiSTify/firmware/spi_sd.c, line 287
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l78
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 292
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 292
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 2
	.liconst	16711760
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 292
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 2
	.liconst	4
	add	r6
						// freereg r1
l78: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 294
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 296
						//call
						//pcreltotemp
	.lipcrel	_sd_get_size
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/spi_sd.c, line 296
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sd_size, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/spi_sd.c, line 300
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 130
						// matchobj comparing flags 161 with 2
						// deref
						// const to r0
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 301
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 304
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0
l67: # 
						// freereg r1
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
	.section	.text.8
	.global	_sd_write_sector
_sd_write_sector:
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
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	255
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3

						//../DeMiSTify/firmware/spi_sd.c, line 312
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 313
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 576
						// deref
						// const to r0
						// matchobj comparing flags 1 with 576
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	259
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 314
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// matchobj comparing flags 576 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 316
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 576
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 316
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16711768
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 316
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 317
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 317
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l84
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 321
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	mr	r0

						//../DeMiSTify/firmware/spi_sd.c, line 322
						//pcreltotemp
	.lipcrel	l81
	add	r7
						// freereg r1
l84: # 

						//../DeMiSTify/firmware/spi_sd.c, line 324
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 325
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	254
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 328
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 328
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 328
						//call
						//pcreltotemp
	.lipcrel	_spi_write
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 340
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 341
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 576
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 342
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// matchobj comparing flags 576 with 576
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 344
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	100000
						// (save temp)isreg
	mr	r3
						//save_temp done
l89: # 

						//../DeMiSTify/firmware/spi_sd.c, line 346
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 347
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 576
						// deref 
	ld	r4
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 348
						// Q1 disposable
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	//mt
				// flags 4a
	and	r1
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 348
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l90
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 348
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	sub	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 348
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7
						// freereg r1
l90: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 349
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 240 type 503
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 350
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 576
						// deref
						// const to r0
						// matchobj comparing flags 1 with 576
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 351
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
l81: # 
						// freereg r1
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
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.9
l91:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
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
						// allocreg r5
						// allocreg r4
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 359
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

						//../DeMiSTify/firmware/spi_sd.c, line 361
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1499999
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
l107: # 

						//../DeMiSTify/firmware/spi_sd.c, line 364
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 365
						//FIXME convert
						// (convert - reducing type 503 to 3
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
						//No need to mask - same size

						//../DeMiSTify/firmware/spi_sd.c, line 366
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 33
						// matchobj comparing flags 1 with 1
	.liconst	254
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 366
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l98
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 368
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1

			// required value found in r0
	mt	r0
				//return 0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 369
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//../DeMiSTify/firmware/spi_sd.c, line 369
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l100
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 371
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 371
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 371
						//call
						//pcreltotemp
	.lipcrel	_spi_read
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 382
						//pcreltotemp
	.lipcrel	l110
	add	r7
l100: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 383
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
	.liconst	273
						// (save temp)store type 3
	st	r0
						//save_temp done
l108: # 

						//../DeMiSTify/firmware/spi_sd.c, line 387
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 403
						// const
	.liconst	255
						// (save temp)store type 3
	st	r5
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 388
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
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
 						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	addt	r6
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/spi_sd.c, line 388
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

						//../DeMiSTify/firmware/spi_sd.c, line 388
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
l110: # 

						//../DeMiSTify/firmware/spi_sd.c, line 390
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 391
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

			// required value found in tmp
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 392
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//../DeMiSTify/firmware/spi_sd.c, line 392
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l106
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 393
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
	.liconst	16
						// (save temp)store type 3
	st	r0
						//save_temp done
l106: # 

						//../DeMiSTify/firmware/spi_sd.c, line 395
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 396
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)isreg
	mr	r4
						//save_temp done
l98: # 

						//../DeMiSTify/firmware/spi_sd.c, line 361
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 361
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l107
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 399
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
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
	.section	.text.a
	.global	_sd_read_sector
_sd_read_sector:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r3

						//../DeMiSTify/firmware/spi_sd.c, line 404
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 408
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-44
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 409
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
	.liconst	259
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 410
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
	.liconst	255
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 412
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 412
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 66
						// matchobj comparing flags 1 with 1
	.liconst	16711761
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 412
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Flow control - popping 4 + 0 bytes
						// matchobj comparing flags 1 with 1
	.liconst	4
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 413
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 413
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l111
		add	r7

						//../DeMiSTify/firmware/spi_sd.c, line 419
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	512
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 419
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	12
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 419
						//call
						//pcreltotemp
	.lipcrel	l91
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 419
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//../DeMiSTify/firmware/spi_sd.c, line 421
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
	.liconst	2
						// (save temp)store type 3
	st	r0
						//save_temp done
l111: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 422
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r0
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
	.global	_sd_get_size
_sd_get_size:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// allocreg r4

						//../DeMiSTify/firmware/spi_sd.c, line 430
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 104
						// const
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 430
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711753
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 430
						//call
						//pcreltotemp
	.lipcrel	_cmd_write
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 432
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	18
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 432
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sizebuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 432
						//call
						//pcreltotemp
	.lipcrel	l91
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 433
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
l127: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 434
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 434
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	18
	sgn
	cmp	r4

						//../DeMiSTify/firmware/spi_sd.c, line 434
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l127
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 439
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 439
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	192
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 439
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 439
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l122
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 441
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 7
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 441
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

						//../DeMiSTify/firmware/spi_sd.c, line 441
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 8
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 441
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 441
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

						//../DeMiSTify/firmware/spi_sd.c, line 441
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sizebuf, 9
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 441
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

						//../DeMiSTify/firmware/spi_sd.c, line 441
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	4194303
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 441
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 442
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	shl	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 445
						//pcreltotemp
	.lipcrel	l130
	add	r7
l122: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 446
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_sizebuf, 9
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 446
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 446
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	and	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 446
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 10
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 446
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 446
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

						//../DeMiSTify/firmware/spi_sd.c, line 447
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sizebuf, 5
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 447
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 6
						// (obj to r5) flags 4a type 3
						// matchobj comparing flags 74 with 2
						// reg r2 - only match against tmp
	//mt
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	15
	and	r5
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/spi_sd.c, line 448
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r2)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 6
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	10
	shl	r2
						// (save result) // isreg
						// allocreg r3

						//../DeMiSTify/firmware/spi_sd.c, line 448
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// extern
	.liabs	_sizebuf, 7
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	shl	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	or	r2
						// (save result) // isreg
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/spi_sd.c, line 448
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r3)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_sizebuf, 8
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	192
	and	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	6
	sgn
	shr	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 448
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r3 - only match against tmp
	mt	r3
	or	r2
						// (save result) // isreg
						// freereg r3

						//../DeMiSTify/firmware/spi_sd.c, line 450
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	2
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 450
						// (bitwise/arithmetic) 	//ops: 0, 2, 2
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/spi_sd.c, line 452
						// (bitwise/arithmetic) 	//ops: 0, 6, 6
						// WARNING - evading q2 and target collision - check code for correctness.
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	mr	r0
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	shl	r0
						// (save result) // isreg
	mt	r0
	mr	r5

						//../DeMiSTify/firmware/spi_sd.c, line 453
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	mt	r2
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	add	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 453
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mul	r4
						// (save result) // isreg
						// freereg r2
						// freereg r1

						//../DeMiSTify/firmware/spi_sd.c, line 455
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	512
	sgn
	cmp	r5

						//../DeMiSTify/firmware/spi_sd.c, line 455
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l130
		add	r7
l128: # 
						// allocreg r1

						//../DeMiSTify/firmware/spi_sd.c, line 457
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	shl	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 458
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

			// required value found in tmp
	sgn
	shr	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/spi_sd.c, line 455
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	512
	sgn
	cmp	r5

						//../DeMiSTify/firmware/spi_sd.c, line 455
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l128
		add	r7
l130: # 

						//../DeMiSTify/firmware/spi_sd.c, line 462
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	.section	.bss.c
	.global	_sd_is_sdhc
	.comm	_sd_is_sdhc,4
	.section	.bss.d
	.global	_sd_size
	.comm	_sd_size,4
	.section	.bss.e
	.global	_SPI_R1
	.comm	_SPI_R1,6
	.section	.bss.f
	.global	_sizebuf
	.comm	_sizebuf,18
