# Chuong trinh 21.4a: Mang so nguyen
# -----------------------------------
#Data segment 
.data
#Cac dinh nghia bien 
int_arr: .word 4,2,9,5,1,8,3,6,0,7
int_f: .word 0
#Cac cau nhac nhap du lieu 
Nhac_kq: .asciiz "a[4]-a[6]= "
# -----------------------------------
#Code segment 
	.text
	.globl main
# -----------------------------------
#Chuong trinh chinh 
# -----------------------------------
main:
#Nhap (syscall)

#Xu ly 
 # a1=addr(a), t0=a[4]/f, t1=a[6]
 	la $a1,int_arr
 # a[3]: offset=4*4=16
 	lw $t0,16($a1)
 # a[5]: offset=6*4=24
 	lw $t1,24($a1)
 # Tinh a[4]-a[6]
 	sub $t0,$t0,$t1
 	sw $t0,int_f
#Xuat ket qua (syscall) 
 	la $a0,Nhac_kq
 	addi $v0,$zero,4
 	syscall
 	lw $a0,int_f
 	addi $v0,$zero,1
 	syscall
#ket thuc chuong trinh (syscall) 
Kthuc: 	addiu $v0,$zero,10
 	syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 