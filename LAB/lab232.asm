#Chuong trinh 23.2: Tim range
#-----------------------------------
#Data segment 
.data
#Cac dinh nghia bien 
iArray: .word 1,2,3,4,5,6,7,8,9,10 #Mang
iArray1: .word  1,2,3,4,5,6,7,8,9,10 #Mang phu
iArray_size: .word 10
#Cac cau nhac nhap du lieu 
#-----------------------------------
#Code segment
 .text
 .globl main
#-----------------------------------
#Chuong trinh chinh
#----------------------------------- 
main:
    # Ghi mang vao cac thanh ghi 
    la $a0, iArray
    la $a3, iArray1
    lw $a1, iArray_size

    # Goi ham range, nhay xuong dong 34
    jal range

    # In ra ket qua
    move $a0, $v0
    li $v0, 1
    syscall
#Xuat ket qua (syscall)
#ket thuc chuong trinh (syscall)
Kthuc: addiu $v0,$zero,10
 syscall 
#-----------------------------------
#Cac chuong trinh con khac
#----------------------------------- 
# Ham range
range:
    # Luu lai dia chi,luu vao stack
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Goi ham max,nhay xuong dong 56
    jal max
    move $s0, $v0 # Luu MAX = $s0

    # Goi ham min,nhay xuong dong 80
    jal min
    move $s1, $v0 # Luu MIN = $s1

    # range = MAX - MIN
    sub $v0, $s0, $s1

    # Tra lai dia chi 
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra

# Ham max
max:
    lw $t0, 0($a0)     # Ghi phan tu dau tien vao $t0
    move $t1, $a1      # $t1 = $a1 = size
    

    loop_max:
        beqz $t1, end_max  # size = 0 thi nhay den end_max
        lw $t3, 0($a0)    # Ghi phan tu vao t3 de so sanh
        bgt $t3, $t0, update_max  # Neu $t3 > $t0 , nhay den update_max
        j next_max

    update_max:
        move $t0, $t3  # Gan Max moi = $t3

    next_max:
        addi $a0, $a0, 4  # Duyet qua phan tu ke tiep
        subi $t1, $t1, 1  # Giam size
        j loop_max

    end_max:
    move $v0, $t0  # $v0 = MAX , thoat khoi vong lap
    jr $ra

# min function
min:
    lw $t0, 0($a0)     # Ghi phan tu dau tien vao $t0
    move $t1, $a1      # $t1 = $a1 = size
    

    loop_min:
        beqz $t1, end_min  # size = 0 thi nhay den end_min
        lw $t3, 0($a3)    # Ghi phan tu vao t3 de so sanh
        blt $t3, $t0, update_min  # Neu $t3 < $t0, nhay den the update_min
        j next_min

    update_min:
        move $t0, $t3  # Cap nhat Min moi = $t3

    next_min:
        addi $a3, $a3, 4  # Duyet qua phan tu ke tiep
        subi $t1, $t1, 1  # Giam size
        j loop_min

    end_min:
    move $v0, $t0  # Thoat khoi vong lap
    jr $ra
