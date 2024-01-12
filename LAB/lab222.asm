#Chuong trinh 22.2: if (a < -3 or a >= 7) 
# -----------------------------------
#Data segment 
	.data
#Cac dinh nghia bien 
int_a: .word 0
int_b: .word 2
int_c: .word 6
#Cac cau nhac nhap du lieu
Nhap_a: .asciiz "Nhap a: "
Nhac_kq: .asciiz "a = " 
# -----------------------------------
#Code segment 
	.text
	.globl main
#-----------------------------------
#Chuong trinh chinh
#----------------------------------- 
main:
#Nhap (syscall)
 #Nhap a
 la $a0,Nhap_a
 addi $v0,$zero,4
 syscall
 addi $v0,$zero,5
 syscall
 sw $v0,int_a 
# Xu ly
	# t0=a, t1=b, t2=c, t3=-3, t4=7
		lw $t0,int_a
		lw $t1,int_b
		lw $t2,int_c
		addi $t3,$zero,-3
		addi $t4,$zero,7

	# Kiem tra dieu kien: a < -3 hoac a >= 7
		slt $t5,$t0,$t3 # t5 = 1 neu a < -3
		slt $t6,$t0,$t4 # t6 = 1 neu a < 7
		xori $t6,$t6,1 # dao bit, t6 = 1 neu a >= 7

		or $t7,$t5,$t6 # t7 = 1 neu a < -3 hoac a >= 7
		beq $t7,$zero,else # Neu a >= -3 va a < 7 thi nhay den nhanh else

	# Neu a < -3 hoac a >= 7 thi a = b * c
		mul $t0,$t1,$t2
		sw $t0,int_a
		j endif

	# Nhanh else: a = b + c
		else:
		add $t0,$t1,$t2
		sw $t0,int_a

	# Ket thuc if-else
		endif:
	#Xuat ket qua (syscall)
 		la $a0,Nhac_kq
		addi $v0,$zero,4
		syscall
		lw $a0,int_a
		addi $v0,$zero,1
		syscall 

# Ket thuc chuong trinh
#ket thuc chuong trinh (syscall)
Kthuc: 
	addiu $v0,$zero,10
	syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 
