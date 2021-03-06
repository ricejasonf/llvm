; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-linux-gnu -global-isel -verify-machineinstrs < %s -o - | FileCheck %s --check-prefix=ALL --check-prefix=X64

define i8 @const_i8() {
; ALL-LABEL: const_i8:
; ALL:       # BB#0:
; ALL-NEXT:    movb $2, %al
; ALL-NEXT:    retq
  ret i8 2
}

define i16 @const_i16() {
; ALL-LABEL: const_i16:
; ALL:       # BB#0:
; ALL-NEXT:    movw $3, %ax
; ALL-NEXT:    retq
  ret i16 3
}

define i32 @const_i32() {
; ALL-LABEL: const_i32:
; ALL:       # BB#0:
; ALL-NEXT:    movl $4, %eax
; ALL-NEXT:    retq
  ret i32 4
}

define i64 @const_i64() {
; ALL-LABEL: const_i64:
; ALL:       # BB#0:
; ALL-NEXT:    movabsq $68719476720, %rax # imm = 0xFFFFFFFF0
; ALL-NEXT:    retq
  ret i64 68719476720
}

;i64 value fit into u32
define i64 @const_i64_u32() {
; ALL-LABEL: const_i64_u32:
; ALL:       # BB#0:
; ALL-NEXT:    movq $1879048192, %rax # imm = 0x70000000
; ALL-NEXT:    retq
  ret i64 1879048192
}

;i64 value fit into i32
define i64 @const_i64_i32() {
; ALL-LABEL: const_i64_i32:
; ALL:       # BB#0:
; ALL-NEXT:    movq $-1, %rax
; ALL-NEXT:    retq
  ret i64 -1
}


