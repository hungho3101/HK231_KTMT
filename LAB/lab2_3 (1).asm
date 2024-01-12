#Lab2_3: tinh f = a.x^3 + b.x^2 - c.x - d
#-----------------------------------
#Data segment
 .data
#Cac dinh nghia bien
int_a: .word 15
int_b: .word 7
int_c: .word 3
int_d: .word 15
int_x: .word 7
int_f: .word 45
#Cac cau nhac nhap du lieu
	Nhap_a: .asciiz "Nhap a: "
	Nhap_b: .asciiz "Nhap b: "
	Nhap_c: .asciiz "Nhap c: "
	Nhap_d: .asciiz "Nhap d: "
	Nhap_x: .asciiz "Nhap x: "
	Nhac_s1: .asciiz "f("
	Nhac_s2: .asciiz ")= "
#Code segement
	.text
	.globl	main
#----------------------------------- 
#Chuong trinh chinh 
#-----------------------------------
main:
#Nhap (syscall)
 #Nhap a
 	la $a0, Nhap_a 
 	addi $v0, $zero, 4 
 	syscall
 	addi $v0, $zero, 5 
 	syscall 
	sw $v0, int_a
#Nhap b
 	la $a0, Nhap_b
 	addi $v0, $zero, 4 
 	syscall
 	addi $v0, $zero, 5 
 	syscall 
	sw $v0, int_b
#Nhap c
 	la $a0, Nhap_c
 	addi $v0, $zero, 4 
 	syscall
 	addi $v0, $zero, 5 
 	syscall 
	sw $v0, int_c
#Nhap d
 	la $a0, Nhap_d
 	addi $v0, $zero, 4 
 	syscall
 	addi $v0, $zero, 5 
 	syscall 
	sw $v0, int_d
#Nhap x
 	la $a0, Nhap_x
 	addi $v0, $zero, 4 
 	syscall
 	addi $v0, $zero, 5 
 	syscall 
	sw $v0, int_x
#Xu ly
 # tinh f = ax
 # t0 = a, t1 = x
 	lw $t0, int_a 
 	lw $t1, int_x 
 	mul $t0, $t0, $t1	# t0 = f = ax
 # tinh f = ax + b
 # t0 = ax, t1 = b
 	lw $t1, int_b
 	add $t0, $t0, $t1 	# t0 = f = ax + b
 # tinh f = ax^2 + bx
 # t0 = ax + b, t1 = x
 	lw $t1, int_x
 	mul $t0, $t0, $t1 	# t0 = f = ax^2 + bx
 # tinh f = ax^2 + bx - c
 # t0 = ax^2 + bx, t1 = c
 	lw $t1, int_c
 	sub $t0, $t0, $t1 	# t0 = f = ax^2 + bx - c
 # tinh f = ax^3 + bx^2 - cx
 # t0 = ax^2 + bx - c, t1 = x
 	lw $t1, int_x
 	mul $t0, $t0, $t1 	# t0 = f = ax^3 + bx^2 - cx
 # tinh f = ax^3 + bx^2 - cx - d
 # t0 = ax^3 + bx^2 - cx, t1 = d
 	lw $t1, int_d
 	sub $t0, $t0, $t1	# t0 = f = ax^3 + bx^2 - cx - d
 	sw $t0, int_f
 #Xuat ket qua (syscall) 
 	la $a0, Nhac_s1		# f(
 	addi $v0, $zero, 4 
 	syscall 
 	lw $a0, int_x		# f(x
 	addi $v0, $zero, 1
 	syscall
 	la $a0, Nhac_s2 	# f(x)=
 	addi $v0, $zero, 4 
 	syscall 
	lw $a0, int_f 		# f(x)=f
 	addi $v0, $zero, 1 
 	syscall
 #ket thuc chuong trinh (syscall) 
Kthuc: 	addiu $v0,$zero,10 
	syscall
#----------------------------------- 
#Cac chuong trinh con khac 
#-----------------------------------
