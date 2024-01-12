#Chuong trinh 22.5: while - tim ky tu trong chuoi
#-----------------------------------
#Data segment
 .data
#Cac dinh nghia bien
str_s: .asciiz "Computer Architecture CSE-HCMUT"
char_c: .byte 'r'
int_vtri: .word -1
#Cac cau nhac nhap du lieu
Nhac_co1: .asciiz "Tim thay ky tu "
Nhac_co2: .asciiz " tai vi tri "
Nhac_kh: .asciiz "Khong tim thay ky tu "
#-----------------------------------
#Code segment
 .text
 .globl main
#-----------------------------------
#Chuong trinh chinh
#-----------------------------------
main:
#Nhap (syscall)
#Xu ly
 # a1=addr(s), t0=s[i], t1=c, t2=i(=0)
 la $a1,str_s
 lb $t1,char_c
 addi $t2,$zero,0
 # while (s[i]!=c && s[i]!='\0')
while:
 lb $t0,0($a1)
 beq $t0,$t1,endwhile
 beq $t0,$zero,endwhile
 # body
 addi $t2,$t2,1
 addi $a1,$a1,1
 j while
 # endwhile
endwhile:
#Xuat ket qua (syscall)
 # if (s[i]==0)
 beq $t0,$zero,khtithay
 addi $t2,$t2,1
 sw $t2,int_vtri
timthay:
 la $a0,Nhac_co1
 addi $v0,$zero,4
 syscall
 lb $a0,char_c
 addi $v0,$zero,11
 syscall
 la $a0,Nhac_co2
 addi $v0,$zero,4
 syscall
 lw $a0,int_vtri
 addi $v0,$zero,1
 syscall
 j Kthuc
khtithay:
 la $a0,Nhac_co1
 addi $v0,$zero,4
 syscall
 lb $a0,char_c
 addi $v0,$zero,11
 syscall
 la $a0,Nhac_co2
 addi $v0,$zero,4
 syscall
 lw $a0,int_vtri
 addi $v0,$zero,1
 syscall
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 