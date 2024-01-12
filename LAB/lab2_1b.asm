#Chuong trinh 2.1b: Xuat chuoi "Kien truc may tinh 2022"
#-------------------------------------
#Data segment
	.data
#Cac dinh nghia bien
kq:	.asciiz 		"Kien Truc May Tinh 2022"
#Cac cau nhac nhap du lieu

#Code segment
	.text
	.globl	main
main:	
#Nhap (syscall)
#Xu ly
#Xuat ket qua (syscall)
	la	$a0,kq
	addi	$v0,$zero,4
	syscall
#ket thuc chuong trinh (syscall)
Kthuc:	addiu	$v0,$zero,10
	syscall
#-------------------------------------
# Cac chuong trinh con
#-------------------------------------
