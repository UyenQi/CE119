	.data
string: .asciiz "The factorial of 10 is\n"
	.text
main:
	# Xuat string
	li $v0,4
	la $a0, string
	syscall
	
	addi $a0, $0, 10	# Gan n=10	
	jal fact		# Nhay toi lenh fact

	add $a0, $v0, $0
	li $v0, 1
	syscall
	j exit
fact:
	sw $ra, 0($sp)		# Luu $ra vao $sp
	add $t0, $a0, $0	# $t0 = $a0
	# De_quy
fact_1:
	addi $a0, $a0, -1
	bgt $a0, 0, return	# n<1 thi return khong thi end
	# Xet neu $a0 <1 thi xuat 1
	addi $t1, $t0, -1 	
	bne $t1, $a0, end	#$t1= $a0 thi gia tri tra ve =1
	addi $t0, $0, 1
	j end
return:
	mul $t0, $t0, $a0	#Tinh n!
	j fact_1
end:
	addi $v0, $t0, 0
	lw $ra, 0($sp)		# tra lai gia tri cho $ra
	add $sp, $sp, 4
	jr $ra			#nhay toi lenh ke tiep sau lenh jal fact
exit: 
	 
	
	
	
		
	
	
