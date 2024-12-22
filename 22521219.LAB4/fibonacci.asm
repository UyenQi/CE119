	.data
array:  .space 100
str1:   .asciiz "Nhap n: "
str2:	.asciiz "Day fibonacci:"
str3:	.asciiz " "
	.text
main:
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	add $a0, $v0, $0 	# $a0=n
	add $t1, $0, $0		# $t1=i=0
	la $t2, array		# goi mang 
	add $a1, $a0, $0	#luu $a0 vao $a1
Loop:
	jal fibonacci		# nhay toi lenh fibonacci
	sw $v0, 0($t2)		# luu $v0 vao mang array
	addi $t2, $t2, 4
	addi $t1, $t1, 1
	addi $a0, $a0, -1
	blt $t1, $a1 , Loop
	
	add $a0, $a1, $0	# tra lai gai tri cho $a0
	sub $t1, $t1, $t1	#$t1=0
	li $v0, 4
	la $a0, str2
	syscall
XuatChuoi:
	# Xuat so fibonacci
	lw $a0, -4($t2)		# Xuat tu so dau tien 
	li $v0, 1
	syscall
	# Xuat dau cach
	li $v0, 4
	la $a0, str3
	syscall
	
	addi $t2, $t2, -4
	addi $t1, $t1, 1
	blt $t1, $a1 , XuatChuoi
	li $v0, 10
	syscall
fibonacci:
	addi $sp, $sp, -12
	sw $ra, 8($sp)		# luu $ra vao $sp +8
	sw $a0, 4($sp)		# luu $a0 vao $sp +4
	
	# $a0>0 nhay toi TH1 khong thi $v0=0
	bgt $a0, 0, TH1		
	li $v0, 0
	addi $sp, $sp, 12
	
	jr $ra			# nhay toi lenh sau lenh fibonacci tuong ung 
TH1:
	# $a0>2 nhay toi TH2 khong thi $v0=1
	bgt $a0, 2, TH2
	li $v0, 1
	addi $sp, $sp, 12
	
	jr $ra
TH2:
	addi $a0, $a0, -1
	jal fibonacci
	sw $v0, 0($sp)		# luu fibonacci(n-1) vao $sp
	
	lw $a0, 4($sp)		# tra lai gia tri cho $a0
	addi $a0, $a0, -2
	jal fibonacci
	lw $t0, 0($sp)		# luu fibonacci(n-1) tu $sp vao $t0
	
	add $v0, $v0, $t0	# $v0= fibo(n-2)+fibo(n-1)
	
	lw $a0, 4($sp)		#tra lai gia tri cho $a0
	lw $ra, 8($sp)		#tra lai gia tri cho $ra 
	addi $sp, $sp, 12	
	jr $ra			#nhay toi lenh jal fibanacci dau tien 
	
	
	
	
	
	
