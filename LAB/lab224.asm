#Chuong trinh 22.4: tinh Fibonacci dung for
#-----------------------------------
#Data segment 
	.data
#Cac dinh nghia bien 
int_farr: .space 80
int_n: .word 0
int_f: .word 0
#Cac cau nhac nhap du lieu
Nhap_n: .asciiz "Nhap n: "
Nhac_s1: .asciiz "Fibo("
Nhac_s2: .asciiz ")= " 
Nhac_s4: .asciiz "invalid input"
# -----------------------------------
#Code segment 
	.text
	.globl main
#-----------------------------------
#Chuong trinh chinh
#----------------------------------- 
main:
#Nhap (syscall)
	#Nhap n
	la $a0,Nhap_n
	addi $v0,$zero,4
	syscall
	addi $v0,$zero,5
	syscall
	sw $v0,int_n 

# Xu ly
	# t0=n, t1=f[i-1], t2=f[i-2], t3=i, t4=f[i]
	lw $t0,int_n
	slt $t5,$t0,$zero # Kiem tra n < 0
	bne $t5,$zero,invalid_input
	beq $t0,$zero,zero_output
	addi $t5,$zero,1
	beq $t0,$t5,one_output

	# Khoi tao f[0] = 0, f[1] = 1
	la $t6, int_farr
	sw $zero,0($t6)
	addi $t6,$t6,4
	sw $t5,0($t6)

	# Vong lap for tu i=2 den n
	addi $t3,$zero,2
	for_loop:
	sub $t5,$t3,$t0 # Kiem tra i <= n
	bgtz $t5,end_for_loop
	addi $t6,$t6,4
	lw $t1,-4($t6) # f[i-1]
	lw $t2,-8($t6) # f[i-2]
	add $t4,$t1,$t2 # f[i] = f[i-1] + f[i-2]
	sw $t4,0($t6) # Luu f[i]
	addi $t3,$t3,1 # Tang i
	j for_loop

	end_for_loop:
	lw $t4,0($t6) # Lay f[n]
	sw $t4,int_f # Luu f[n]
	j end_program

	invalid_input:
	# Xu ly truong hop n < 0
	la $a0,Nhac_s4 # invalid input
	addi $v0,$zero,4
	syscall
	j Kthuc

	zero_output:
	# Xu ly truong hop n = 0
	sw $zero,int_f # Luu f[n]
	j end_program

	one_output:
	# Xu ly truong hop n = 1
	addi $t1,$zero,1
	sw $t1,int_f # Luu f[n]
	j end_program

	end_program:
	#Xuat ket qua (syscall)
	la $a0,Nhac_s1 # Fibo(
	addi $v0,$zero,4
	syscall
	lw $a0,int_n # Fibo(n
	addi $v0,$zero,1
	syscall
	la $a0,Nhac_s2 # Fibo(n)=
	addi $v0,$zero,4
	syscall
	lw $a0,int_f # Fibo(n)= f
	addi $v0,$zero,1
	syscall
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall 
# Ket thuc chuong trinh
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 