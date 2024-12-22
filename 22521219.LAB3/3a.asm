	.data 
array:  .space 100
str1:	.asciiz "Nhap so luong phan tu: "
str2: 	.asciiz "Nhap cac phan tu trong mang:\n"
str3:	.asciiz "So lon nhat:"
str4:	.asciiz "\nSo nho nhat:"
str5:	.asciiz "\nTong cua mang:"
str6:	.asciiz "\nNhap chi so can tim:"
str7:	.asciiz "Phan tu can tim:"
	.text 
main:
	li $v0,4
	la $a0,str1
	syscall
	la $s2, array 		# con_tro
	li $v0,5
	syscall
	add $s0, $v0, $0	# n
	
	sll $t1, $s0, 2
	add $s1, $t1, $s2	# a[n+1]
	li $v0,4
	la $a0,str2
	syscall
loop:
	# tao_mang
	
	li $v0,5
	syscall
	sw $v0,0($s2)
    	addi $s2, $s2, 4
    	slt $t3, $s2, $s1
    	bne $t3,$0,loop
    	
    	la $s2, array	
    	# tim so lon nhat | nho nhat
    	li $v0,4
	la $a0,str3
	syscall
    	lw $t1, 0($s2)		# max =a[0]
    	addi $t4, $s1, -4	#a[n]
loop1:
	
	lw $t2,4($s2)
	bgt $t1,$t2,skip         	 # nho nhat thi su dung blt
	add $t1,$t2,0
skip:
	addi $s2, $s2, 4  
    	slt $t3, $s2, $t4
    	bne $t3,$0,loop1

 	li $v0, 1
 	add $a0,$t1,$0			# Xuat gia tri max (min)
   	syscall
   	
   	li $v0,4
	la $a0,str4
	syscall
   	la $s2, array	
   	lw $t1, 0($s2)		# min= a[0]
lop1:
	
	lw $t2,4($s2)
	blt $t1,$t2,skipp        	
	add $t1,$t2,0
skipp:
	addi $s2, $s2, 4   
    	slt $t3, $s2, $t4
    	bne $t3,$0,lop1

 	li $v0, 1
 	add $a0,$t1,$0			# Xuat gia tri max (min)
   	syscall
   	
   	la $s2, array	
   	# tinh tong mang
   	li $v0,4
	la $a0,str5
	syscall
   	add $t1, $0, $0		# tong=0
loop2:
	lw $t2, 0($s2) 		    	  		
   	add $t1, $t1, $t2  	    	
   	addi $s2, $s2, 4 
    	slt $t3, $s2, $s1
    	bne $t3,$0, loop2              
 	
 	li $v0, 1
 	add $a0,$t1,$0
   	syscall
   	
	la $s2, array
	# tim phan tu i
	li $v0,4
	la $a0,str6
	syscall
	add $t1, $0, $0
	li $v0,5			# nhap phan tu x can tim
	syscall
	add $t1, $v0, $0 
	li $v0,4
	la $a0,str7
	syscall
	sll $t1, $t1, 2
	add $t2, $t1, $s2	# a[x]
	li $v0, 1
 	lw $a0,0($t2)
   	syscall
	
	
	
