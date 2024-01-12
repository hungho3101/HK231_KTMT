#Chuong trinh 22.3: switch - case
#-----------------------------------
#Data segment
 .data
#Cac dinh nghia bien
int_a: .word 8
int_b: .word 100
int_c: .word 2
int_in: .word 0
#Cac cau nhac nhap du lieu
Nhap_in: .asciiz "Nhap input: "
Nhac_kq: .asciiz "a = "
#-----------------------------------
#Code segment
 .text
 .globl main
#-----------------------------------
#Chuong trinh chinh
#-----------------------------------
main:
#Nhap (syscall)
 #Nhap input
 la $a0,Nhap_in
 addi $v0,$zero,4
 syscall
 addi $v0,$zero,5
 syscall
 sw $v0,int_in
#Xu ly
 # t0=a, t1=input, t2=b, t3=c, t4=1/2/3/4
 lw $t1,int_in
 lw $t2,int_b
 lw $t3,int_c
 # switch (input)
 # kiem tra tri input
 addi $t4,$zero,1
 beq $t1,$t4,case1
 addi $t4,$zero,2
 beq $t1,$t4,case2
 addi $t4,$zero,3
 beq $t1,$t4,case3
 addi $t4,$zero,4
 beq $t1,$t4,case4
 j default
 # case 1: a=b+c
case1: add $t0,$t2,$t3
 sw $t0,int_a
 j endswitch
 # case 2: a=b-c
case2: sub $t0,$t2,$t3
 sw $t0,int_a
 j endswitch
 # case 3: a=b*c
case3: mul $t0,$t2,$t3
 sw $t0,int_a
 j endswitch
 # case 4: a=b/c
case4: div $t2,$t3
 mflo $t0
 sw $t0,int_a
 j endswitch
 # default: a=0
default: sw $zero,int_a
endswitch:
#Xuat ket qua (syscall)
 la $a0,Nhac_kq
 addi $v0,$zero,4
 syscall
 lw $a0,int_a
 addi $v0,$zero,1
 syscall
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 