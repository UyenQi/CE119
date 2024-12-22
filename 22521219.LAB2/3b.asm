	.data
max:	.asciiz "So lon hon: "
tong:	.asciiz "\nTong: "
hieu:	.asciiz "\nHieu: "
tich:	.asciiz "\nTich: "
thuong:	.asciiz "\nThuong: "
sodu:	.asciiz "\nSo du: "
vonghiem:.asciiz "\nVo nghiem"
	.text
main:
	li $v0, 5
	syscall
	add $t0,$v0, $0
	li $v0, 5
	syscall
	add $t1,$v0, $0
	# tim so lon hon
	add $t2, $t0, $0
	bgt $t0, $t1, next
	add $t2, $t1, $0
next:        
	li $v0, 4
	la $a0, max
	syscall
	li $v0, 1
	add $a0, $t2,$0
	syscall
	
	#tinh tong
	li $v0, 4
	la $a0, tong
	syscall
	add $t2, $t0, $t1
	li $v0, 1
	add $a0, $t2,$0
	syscall
	
	#tinh  hieu
	li $v0, 4
	la $a0, hieu
	syscall
	sub $t2, $t0, $t1
	li $v0, 1
	add $a0, $t2,$0
	syscall 
	
	#tinh tich
	li $v0, 4
	la $a0, tich
	syscall
	mul $t2,$t0, $t1
	li $v0, 1
	add $a0, $t2,$0
	syscall 

	#tinh thuong
	beq $t1, 0, next1 	#kiem tra co vo nghiem ko 
	li $v0, 4
	la $a0, thuong
	syscall
	div $t2, $t0, $t1
	li $v0, 1
	add $a0, $t2, $0
	syscall
	li $v0, 4
	la $a0, sodu
	syscall
	mfhi $t3
	li $v0, 1
	add $a0, $t3, $0
	syscall
	j exit
next1: 
	li $v0, 4
	la $a0, vonghiem
	syscall
	
exit:
	li $v0, 10
	add $a0, $0, $0
	syscall
