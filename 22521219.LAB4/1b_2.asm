.data
str1: 	.asciiz "Nhap a: "
str2: 	.asciiz "Nhap b: "
str3: 	.asciiz "Nhap c: "
str4: 	.asciiz "Nhap d: "
str5: 	.asciiz "Nhap e: "
str6: 	.asciiz "Nhap f: "
	.text
main:	
	#nhap a
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 5	
	syscall
	move $s0, $v0	#luu a vao $s0
	
	#nhap b
	li $v0,4
	la $a0, str2
	syscall
  	li $v0, 5
	syscall
	move $s1, $v0	#luu b vao $s1
	
	#nhap c
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 5
	syscall
	move $s2, $v0	#luu c vao $s2
	
	#nhap d
	li $v0, 4
	la $a0, str4
	syscall
	li $v0, 5
	syscall
	move $s3, $v0	#luu d vao $s3
	
	#nhap e 
	li $v0, 4
	la $a0, str5 
	syscall
	li $v0, 5
	syscall
	move $s4, $v0	#luu c vao $s2
	
	#nhap f 
	li $v0, 4
	la $a0, str6 
	syscall
	li $v0, 5
	syscall
	move $s5, $v0	#luu d vao $s3
	
	move 	$a0, $s0
	move 	$a1, $s1
	move 	$a2, $s2
	move 	$a3, $s3
	
	addi 	$sp, $sp, -4
	sw 	$a0, 0($sp)	#luu a vao $sp-4
	move 	$a0, $s4	#luu e vao $a0
	 
	addi 	$sp, $sp, -4
	sw 	$a1, 0($sp)	#luu bvao $sp-8
	move 	$a1, $s5	#luu f vao $a1
	
	jal 	proc_example 
	
	move 	$a0, $v0
	li 	$v0, 1
	syscall
	
	move 	$a0, $v1
	li 	$v0, 1
	syscall
	j exit
	
	
proc_example:
	addi 	$sp, $sp, -8
	sw	$s0, 4($sp)
	sw	$s1, 0($sp)
	# $s1=e-f
	sub	$s1, $a0, $a1
	
	# $s0=(a+b)-(c+d)
	lw 	$a0, 8($sp)
	lw	$a1, 12($sp)
	add 	$t0, $a0, $a1
	add 	$t1, $a2, $a3
	sub 	$s0, $t0, $t1
	
	move 	$v0, $s0
	move 	$v1, $s1
	
	lw	$s1, 0($sp)
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 16
	
	jr 	$ra
exit:
