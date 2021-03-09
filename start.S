#include "memmap.h"

.section .vector_table, "x"
.global start
start:
 	b reset_handler
	b undef_instr	/* 0x4 Undefined Instruction */
	b sw_intr /* 0x8 Software Interrupt */
	b prf_abrt /* 0xC Prefetch Abort */
	b data_abrt /* 0x10 Data Abort */
	b . /* 0x14 Reserved */
	b . /* 0x18 IRQ */
	b . /* 0x1C FIQ */

.section .text
reset_handler:
	;; ldr x7, el3_exception
	;; mrs x20, CurrentEL
	;; msr VBAR_EL3, x7
	;; mrs x5, VBAR_EL3
	mov x1, STACK_BASE
	mov sp, x1
	bl main
	b .

el3_exception:
	mov x10, #5

undef_instr:
	mov x10, #1
	b .

sw_intr:
	mov x10, #2
	b .

prf_abrt:
	mov x10, #3
	b .

data_abrt:
	mov x10, #4
	b .




