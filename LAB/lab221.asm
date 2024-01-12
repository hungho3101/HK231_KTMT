#Chuong trinh 22.1: if (a%2==0)
#-----------------------------------
#Data segment
 .data
#Cac dinh nghia bien
int_a: .word 13
#Cac cau nhac nhap du lieu
Nhap_a: .asciiz "Nhap a: "
Nhac_t: .asciiz "Computer Science and Engineering, HCMUT"
Nhac_f: .asciiz "Computer Architecture 2022"
#-----------------------------------
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
#Xu ly
 # t0=a/sodu, t1=2
 lw $t0,int_a
 addi $t1,$zero,2
 # if1 (a%2==0)
 div $t0,$t1
 mfhi $t0 # t0=hi=so du
 bne $t0,$zero,else1
 # then1
then1: la $a0,Nhac_t
 addi $v0,$zero,4
 syscall
 j endif1
 # else1
else1: la $a0,Nhac_f
 addi $v0,$zero,4
 syscall
 # endif1
endif1:
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 