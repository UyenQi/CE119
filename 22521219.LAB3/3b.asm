	.data 
array:  .space 100
str1:	.asciiz "Nhap so luong phan tu: "
str2: 	.asciiz "Nhap cac phan tu trong mang:\n"
str3:	.asciiz "Nhap i: "
str4:	.asciiz "\nNhap j: "

	.text 
main:
	li $v0,4
	la $a0,str1
	syscall
	la $s3, array 		# con_tro
	li $v0,5
	syscall
	add $s0, $v0, $0	# n
	
	sll $t1, $s0, 2
	add $s1, $t1, $s3	# a[n+1]
	li $v0,4
	la $a0,str2
	syscall
loop:
	# tao_mang
	
	li $v0,5
	syscall
	sw $v0,0($s3)
    	addi $s3, $s3, 4
    	slt $t3, $s3, $s1
    	bne $t3,$0,loop
    	
    	la $s3, array	
	#Nhap i | $s0 = i
	li $v0,4
	la $a0,str3
	syscall
	li $v0 , 5
	syscall
	add $s0, $0 , $v0  
	#Nhap j | $s1 = j
	li $v0,4
	la $a0,str4
	syscall
	li $v0 , 5
	syscall
	add $s1, $0 , $v0 
	 
	sll $t1 , $s0 , 2 	
	add $t1 , $t1 , $s3 
	slt $t2 , $s0 , $s1  	
	beq $t2 , $zero , else
if: 
	sw $s0 , 0($t1)
	j end
else: 
	sw $s1 , 0($t1)
end:
