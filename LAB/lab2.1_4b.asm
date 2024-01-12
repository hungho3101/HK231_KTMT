# Chương trình 21.4b: Mảng ký tự (chuỗi)
# -----------------------------------
# Phân đoạn dữ liệu
.data
# Định nghĩa biến
str_s: .asciiz "2211327 - Ho Nguyen Phi Hung"
# Nhắc nhở nhập dữ liệu
Nhac_kq: .asciiz "Chuoi đa đoi: "
# -----------------------------------
# Phân đoạn mã
.text
.globl main
# -----------------------------------
# Chương trình chính
# -----------------------------------
main:
# Xử lý
 # a1=addr(a[0]), t0=s[0], t1=s[27]
 la $a1,str_s
 # s[0]: offset=0
 lb $t0,0($a1)
 # s[24]: offset=27
 lb $t1,27($a1)
 # Đổi chỗ
 sb $t0,27($a1)
 sb $t1,0($a1)
# Xuất kết quả (syscall)
 la $a0,Nhac_kq
 addi $v0,$zero,4
 syscall
 la $a0,str_s
 addi $v0,$zero,4
 syscall
# Kết thúc chương trình (syscall)
Kthuc: addiu $v0,$zero,10
 syscall
# -----------------------------------
# Các chương trình phụ khác
# -----------------------------------