#Chuong trinh 21.2: tinh 200000 + 4000 - 700
#-----------------------------------
#Code segment
 .text
 .globl main
#-----------------------------------
#Chuong trinh chinh
#-----------------------------------
main: 
#Khoi tao
	#$t1 = 200000
	lui $t1, 3
	ori $t1, $t1, 3392
	#t2 = 4000
	addi $t2, $zero, 4000
	#$t3 = -700
	addi $t3, $zero, -700
#Xu ly
	#tinh 200000 + 4000
	add $s0, $t1, $t2
	#tinh 200000 + 4000 - 700
	add $s0, $s0, $t3
#In ket qua
	li $v0, 1
	add $a0, $zero, $s0
	syscall
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
#-----------------------------------
#Cac chuong trinh con khac
#-----------------------------------
