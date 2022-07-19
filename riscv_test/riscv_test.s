	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_f2p0_d2p0"
	.file	"riscv_test.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
	sw	zero, -20(s0)
	sw	zero, -24(s0)
	addi	a0, zero, 1
	sw	a0, -28(s0)
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	a0, -28(s0)
	addi	a1, zero, 10
	blt	a1, a0, .LBB0_4
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	j	.LBB0_3
.LBB0_3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB0_1
.LBB0_4:                                # %for.end
	lw	a1, -24(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	lw	a0, -20(s0)
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Total = %d\n"
	.size	.L.str, 12

	.ident	"clang version 12.0.1 (https://github.com/llvm/llvm-project.git fed41342a82f5a3a9201819a82bf7a48313e296b)"
	.section	".note.GNU-stack","",@progbits
