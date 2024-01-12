# Chương trình 21.4a: Mảng số nguyên
# -----------------------------------
# Phân đoạn dữ liệu
.data
# Định nghĩa biến
int_arr: .word 4,2,9,5,1,8,3,6,0,7
int_f: .word 0
# Nhắc nhở nhập dữ liệu
Nhac_kq: .asciiz "a[4]-a[6]= "
# -----------------------------------
# Phân đoạn mã
	.text
	.globl main
# -----------------------------------
# Chương trình chính
# -----------------------------------
main:
# Xử lý
 # a1=addr(a), t0=a[4]/f, t1=a[6]
 	la $a1,int_arr
 # a[3]: offset=4*4=16
 	lw $t0,16($a1)
 # a[5]: offset=6*4=24
 	lw $t1,24($a1)
 # Tính a[3]-a[5]
 	sub $t0,$t0,$t1
 	sw $t0,int_f
# Xuất kết quả (syscall)
 	la $a0,Nhac_kq
 	addi $v0,$zero,4
 	syscall
 	lw $a0,int_f
 	addi $v0,$zero,1
 	syscall
# Kết thúc chương trình (syscall)
Kthuc: 	addiu $v0,$zero,10
 	syscall
# -----------------------------------
# Các chương trình phụ khác
# -----------------------------------
