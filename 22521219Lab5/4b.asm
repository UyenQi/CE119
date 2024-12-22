	bne $s3, $s4, label 	#i!= j thi nhay xuong label
	add $s0, $s1, $s2	#i =j thi f= g+h
	j exit
label: 
	sub $s0, $s1, $s2	#i!= j thi f= g-h
exit: