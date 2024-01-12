#Chuong trinh 2.1c: Nhap vao chuoi 10 ky tu sau do xuat chuoi ra man hinh
#-------------------------------------
#Data segment
	.data
#Cac dinh nghia bien
buffer:	.space		11
#Cac cau nhac nhap du lieu
Nhac_s:	.asciiz		"Nhap vao chuoi 10 ky tu: "
Xuat_s:	.asciiz		"Chuoi da nhap: "
#Code segment
	.text
	.globl	main
main:	
#Nhap (syscall)
 #Xuat cau nhac
 	la	$a0,Nhac_s
 	addi	$v0,$zero,4
 	syscall
 	la	$a0,buffer
 	addi	$a1,$zero,11
 	addi	$v0,$zero,8
 	syscall
 #Xuat ky tu xuong dong
 	addi	$a0,$zero,'\n'
 	addi	$v0,$zero,11
 	syscall
#Xu ly
#Xuat ket qua (syscall)
 #Xuat cau nhac
 	la	$a0,Xuat_s
 	addi	$v0,$zero,4
 	syscall
 #Xuat chuoi
 	la	$a0,buffer
 	addi	$v0,$zero,4
 	syscall
#ket thuc chuong trinh (syscall)
Kthuc:	addi	$v0,$zero,10
	syscall
#-------------------------------------
# Cac chuong trinh con
#-------------------------------------

