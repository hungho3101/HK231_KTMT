#Chuong trinh 21.1: tinh f(a,b,c)=a-b-c
#-----------------------------------
#Data segment
	.data
#Cac dinh nghia bien
int_a: 	 .word 		15
int_b: 	 .word 		7
int_c: 	 .word 		3
int_f: 	 .word 		45
#Cac cau nhac nhap du lieu
Nhap_a:  .asciiz 	"Nhap a: "
Nhap_b:  .asciiz 	"Nhap b: "
Nhap_c:  .asciiz 	"Nhap c: "
Nhac_s1: .asciiz 	"f("
Nhac_s2: .asciiz 	","
Nhac_s3: .asciiz 	","
Nhac_s4: .asciiz 	")= "
#-----------------------------------
#Code segment
 	 .text
 	 .globl 	main
#-----------------------------------
#Chuong trinh chinh
#-----------------------------------
main:
#Nhap (syscall)
 #Nhap a
 	la 	$a0,Nhap_a
 	addi 	$v0,$zero,4
 	syscall
 	addi 	$v0,$zero,5
 	syscall
 	sw 	$v0,int_a
 #Nhap b
 	la 	$a0,Nhap_b
 	addi	$v0,$zero,4
 	syscall
 	addi	$v0,$zero,5
 	syscall
 	sw	$v0,int_b
 #Nhap c
 	la	$a0,Nhap_c
 	addi	$v0,$zero,4
 	syscall	
 	addi	$v0,$zero,5
 	syscall
 	sw	$v0,int_c
#Xu ly
 # t0=a/f, t1=b/c
 # tinh f=a-b
 	lw	$t0,int_a
 	lw	$t1,int_b
 	sub	$t0,$t0,$t1 #t0 = f = a-b
 # tinh f=(a-b)-c
 	lw	$t1,int_c
 	sub	$t0,$t0,$t1 # t0 = f = (a-b)-c
 	sw	$t0,int_f
#Xuat ket qua (syscall)
 	la 	$a0,Nhac_s1 # f(
 	addi 	$v0,$zero,4
 	syscall
 	lw	$a0,int_a   # f(a
 	addi	$v0,$zero,1
 	syscall
 	la	$a0,Nhac_s2 # f(a,
 	addi	$v0,$zero,4
 	syscall
 	lw	$a0,int_b   # f(a,b
 	addi	$v0,$zero,1
 	syscall
 	la	$a0,Nhac_s3 # f(a,b,
 	addi	$v0,$zero,4
 	syscall
 	lw	$a0,int_c   # f(a,b,c
 	addi	$v0,$zero,1
 	syscall
 	la	$a0,Nhac_s3 # f(a,b,c,
 	addi	$v0,$zero,4
 	syscall
 	la	$a0,Nhac_s4 # f(a,b,c)=
 	addi 	$v0,$zero,4
 	syscall
 	lw	$a0,int_f   # f(a,b,c)= f
 	addi	$v0,$zero,1
 	syscall
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
       syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 