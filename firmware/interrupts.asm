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
	.global	_SetIntHandler
_SetIntHandler:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/interrupts.c, line 31
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-80
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

						//../DeMiSTify/firmware/interrupts.c, line 32
						// Q1 disposable
						// (a/p assign)
						// (prepobj tmp)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	13
	exg	r1
						//sizemod based on type 0xa
	st	r1
	exg	r1
						// freereg r1
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
	.section	.text.1
	.global	_GetInterrupts
_GetInterrupts:
	stdec	r6
	stdec	r6	// shortest way to decrement sp by 4

						//../DeMiSTify/firmware/interrupts.c, line 46
						//FIXME convert
						// (convert - reducing type 503 to 403
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 21 type 503
						// const/deref
						// (prepobj tmp)
 						// deref
						// const to tmp
	.liconst	-80
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/interrupts.c, line 46
						//setreturn
						// (obj to r0) flags 6a type 403
						// matchobj comparing flags 106 with 33
						// deref 
	//nop
	mr	r0
	ldinc	r6	// shortest way to add 4 to sp
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
	.section	.text.2
	.global	_EnableInterrupts
_EnableInterrupts:
	stdec	r6

						//../DeMiSTify/firmware/interrupts.c, line 52
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-80
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
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
	.section	.text.3
	.global	_DisableInterrupts
_DisableInterrupts:
	stdec	r6

						//../DeMiSTify/firmware/interrupts.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-80
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
	ldinc	r6
	mr	r7

