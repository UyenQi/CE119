		.data
nhap:		.asciiz "Nhap ki tu: "
xuat1:		.asciiz "\nKi tu truoc: "
xuat2:		.asciiz "\nKi tu sau: "
chuthuong:	.asciiz "\nChu thuong"
chuhoa:		.asciiz "\nChu hoa"
so:		.asciiz "\nSo"
chukhac:	.asciiz "\ninvalid type"
		.text
main:
		li $v0, 4
		la $a0, nhap
		syscall
		
		li $v0, 12
		syscall
		move $t1, $v0     
		
		#Xuat ki tu truoc 
		addi $t1, $t1, -1
		li $v0, 4
		la $a0, xuat1
		syscall
		li $v0, 11
		move $a0,$t1
		syscall
		
		#Xuat ki tu sau
		addi $t1, $t1, 2
		li $v0, 4
		la $a0, xuat2
		syscall
		li $v0, 11
		move $a0,$t1
		syscall
		
		# kiem tra 
		addi $t1, $t1, -2
if:
		blt $t1, 48, else
		bgt $t1, 57, else
		li $v0, 4
		la $a0,so
		syscall 
		j end
else:		
		blt $t1, 65, else1
		bgt $t1, 90, else1
		li $v0, 4
		la $a0, chuhoa
		syscall 
		j end
else1:		blt $t1, 97, else2
		bgt $t1, 122, else2
		li $v0, 4
		la $a0, chuthuong
		syscall 
		j end
else2:		
		li $v0, 4
		la $a0, chukhac
		syscall 
end:
		li $v0, 10
		add $a0, $0, $0
		syscall
