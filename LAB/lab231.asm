#Chuong trinh 23.1: reverse
#-----------------------------------
#Data segment 
#Cac dinh nghia bien 
.data
cArray: .asciiz "Computer Architecture 2022" # Khai bao chuoi ky tu
cArray_size: .word 26 # Kich thuoc chuoi ky tu
#Cac cau nhac nhap du lieu 
#-----------------------------------
#Code segment 
.text
.globl main
#-----------------------------------
#Chuong trinh chinh
#----------------------------------- 
main:
    la $a0, cArray # Load dia chi cua chuoi ky tu vao thanh ghi $a0
    lw $a1, cArray_size # Load kich thuoc chuoi ky tu vao thanh ghi $a1
    jal reverse # Goi ham reverse
    move $a0, $v0 # Chuyen ket qua tra ve vao thanh ghi $a0
    jal print # In chuoi ky tu da dao nguoc ra man hinh

reverse:
    addi $sp, $sp, -8 # Cap phat bo nho tren stack
    sw $ra, 4($sp) # Luu dia chi tro ve
    sw $a1, 0($sp) # Luu kich thuoc chuoi ky tu
    add $t1, $zero, $zero # Khoi tao bien dem i
    srl $t2, $a1, 1 # Tinh nua kich thuoc chuoi ky tu

loop:
    beq $t1, $t2, end_loop # Neu i bang nua kich thuoc chuoi ky tu thi ket thuc vong lap
    add $t3, $a0, $t1 # Tinh dia chi cua phan tu thu i trong chuoi ky tu
    lb $t4, 0($t3) # Lay phan tu thu i trong chuoi ky tu
    sub $t5, $a1, $t1 # Tinh vi tri phan tu doi xung voi phan tu thu i
    addi $t5, $t5, -1 # Giam vi tri xuong 1 don vi do mang bat dau tu 0
    add $t6, $a0, $t5 # Tinh dia chi cua phan tu doi xung voi phan tu thu i
    lb $t7, 0($t6) # Lay phan tu doi xung voi phan tu thu i
    sb $t7, 0($t3) # Gan phan tu doi xung vao vi tri cua phan tu thu i
    sb $t4, 0($t6) # Gan phan tu thu i vao vi tri cua phan tu doi xung
    addi $t1, $t1, 1 # Tang bien dem len 1
    j loop # Tiep tuc vong lap

end_loop:
    lw $ra, 4($sp) # Lay dia chi tro ve
    lw $a1, 0($sp) # Lay lai kich thuoc chuoi ky tu
    addi $sp, $sp, 8 # Giai phong bo nho tren stack
    move $v0, $a0 # Tra ve dia chi cua chuoi ky tu
    jr $ra # Tro ve ham goi

#Xuat ket qua (syscall) 
print:
    li $v0, 4 # Chuan bi in chuoi ky tu
    syscall # In chuoi ky tu
    
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 
