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

						//../DeMiSTify/firmware/statusword.c, line 9
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

						//../DeMiSTify/firmware/statusword.c, line 10
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

						//../DeMiSTify/firmware/statusword.c, line 11
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

						//../DeMiSTify/firmware/statusword.c, line 12
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

						//../DeMiSTify/firmware/statusword.c, line 13
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

						//../DeMiSTify/firmware/statusword.c, line 14
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

						//../DeMiSTify/firmware/statusword.c, line 15
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

						//../DeMiSTify/firmware/statusword.c, line 16
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

	.section	.bss.1
	.global	_statusword
	.comm	_statusword,4
