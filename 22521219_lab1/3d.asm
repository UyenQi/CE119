		.data
a:		.word 0
b:		.word 0
sum:		.word 0
		.text
main:
	 li $v0,5
	 syscall
	 sw $v0,a
	 
	 li $v0,5
	 syscall
	 sw $v0,b
	 
	 lw $s1,a
	 lw $s2,b
	 add $t1,$s1,$s2
	 
	 sw $t1,sum
	 
	 li $v0,1
	 lw $a0,sum
	 syscall
	 
	 
		
