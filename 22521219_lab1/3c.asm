		.data
string1:	.space 35
str2:		.asciiz "\n"
		.text
main:		li $v0,8
		la $a0,string1
		li $a1,35
		syscall
		li $v0,4
		la $a0,str2
		syscall
		li $v0,4
		la $a0,string1
		syscall