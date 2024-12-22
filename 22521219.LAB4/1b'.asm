	.data
str1: 	.asciiz "Nhap a: "
str2: 	.asciiz "Nhap b: "
str3: 	.asciiz "Nhap c: "
str4: 	.asciiz "Nhap d: "
	.text
main:	
	#nhap a
	li $v0,4
	la $a0, str1
	syscall
	li $v0,5	
	syscall
	move $s0,$v0	#luu a vao $s0
	
	#nhap b
	li $v0,4
	la $a0, str2
	syscall
  	li $v0,5
	syscall
	move $s1,$v0	#luu b vao $s1
	
	#nhap c
	li $v0,4
	la $a0, str3
	syscall
	li $v0,5
	syscall
	move $s2,$v0	#luu c vao $s2
	
	#nhap d
	li $v0,4
	la $a1, str4
	syscall
	li $v0,5
	syscall
	move $s3, $v0	#luu d vao $s3
	
	move 	$a0, $s0
	move 	$a1, $s1
	move 	$a2, $s2
	move 	$a3, $s3
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
	
	# $s0=(a+b)-(c+d)
	add 	$t0, $a0, $a1
	add 	$t1, $a2, $a3
	sub 	$s0, $t0, $t1
	# $s1=(a-b)+(c-d)
	sub	$t0, $a0, $a1
	sub 	$t1, $a2, $a3
	add 	$s1, $t0, $t1

	move 	$v0, $s0
	move 	$v1, $s1
	
	lw	$s1, 0($sp)
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 8
	
	jr 	$ra
exit:
