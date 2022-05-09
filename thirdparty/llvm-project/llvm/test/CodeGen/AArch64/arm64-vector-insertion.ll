; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=arm64-eabi -mcpu=generic -aarch64-neon-syntax=apple -mattr="+fullfp16" | FileCheck %s

define void @test0f(float* nocapture %x, float %a) #0 {
; CHECK-LABEL: test0f:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    movi.2d v1, #0000000000000000
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov.s v1[0], v0[0]
; CHECK-NEXT:    str q1, [x0]
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <4 x float> <float undef, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %a, i32 0
  %1 = bitcast float* %x to <4 x float>*
  store <4 x float> %0, <4 x float>* %1, align 16
  ret void
}

define void @test1f(float* nocapture %x, float %a) #0 {
; CHECK-LABEL: test1f:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fmov.4s v1, #1.00000000
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov.s v1[0], v0[0]
; CHECK-NEXT:    str q1, [x0]
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <4 x float> <float undef, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, float %a, i32 0
  %1 = bitcast float* %x to <4 x float>*
  store <4 x float> %0, <4 x float>* %1, align 16
  ret void
}

define <16 x i8> @test_insert_v16i8_insert_1(i8 %a) {
; CHECK-LABEL: test_insert_v16i8_insert_1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v0, #0000000000000000
; CHECK-NEXT:    mov.b v0[14], w0
; CHECK-NEXT:    ret
  %v.0 = insertelement <16 x i8> zeroinitializer, i8 %a, i32 14
  ret <16 x i8> %v.0
}

define <16 x i8> @test_insert_v16i8_insert_2(i8 %a) {
; CHECK-LABEL: test_insert_v16i8_insert_2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v0, #0000000000000000
; CHECK-NEXT:    mov.b v0[1], w0
; CHECK-NEXT:    mov.b v0[2], w0
; CHECK-NEXT:    ret
  %v.0 = insertelement <16 x i8> zeroinitializer, i8 %a, i32 2
  %v.1 = insertelement <16 x i8> %v.0, i8 %a, i32 1
  ret <16 x i8> %v.1
}

define <16 x i8> @test_insert_v16i8_insert_2_undef_base(i8 %a) {
; CHECK-LABEL: test_insert_v16i8_insert_2_undef_base:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup.16b v0, w0
; CHECK-NEXT:    mov.b v0[5], wzr
; CHECK-NEXT:    mov.b v0[9], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <16 x i8> <i8 undef, i8 undef, i8 undef, i8 undef, i8 undef, i8 0, i8 undef, i8 undef, i8 undef, i8 0, i8 undef, i8 undef, i8 undef, i8 undef, i8 undef, i8 undef>  , i8 %a, i32 0
  %v.1 = insertelement <16 x i8> %v.0, i8 %a, i32 1
  %v.2 = insertelement <16 x i8> %v.1, i8 %a, i32 2
  %v.3 = insertelement <16 x i8> %v.2, i8 %a, i32 3
  %v.4 = insertelement <16 x i8> %v.3, i8 %a, i32 4
  %v.6 = insertelement <16 x i8> %v.4, i8 %a, i32 6
  %v.7 = insertelement <16 x i8> %v.6, i8 %a, i32 7
  %v.8 = insertelement <16 x i8> %v.7, i8 %a, i32 8
  %v.10 = insertelement <16 x i8> %v.7, i8 %a, i32 10
  %v.11 = insertelement <16 x i8> %v.10, i8 %a, i32 11
  %v.12 = insertelement <16 x i8> %v.11, i8 %a, i32 12
  %v.13 = insertelement <16 x i8> %v.12, i8 %a, i32 13
  %v.14 = insertelement <16 x i8> %v.13, i8 %a, i32 14
  %v.15 = insertelement <16 x i8> %v.14, i8 %a, i32 15
  ret <16 x i8> %v.15
}

define <16 x i8> @test_insert_v16i8_insert_2_undef_base_different_valeus(i8 %a, i8 %b) {
; CHECK-LABEL: test_insert_v16i8_insert_2_undef_base_different_valeus:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup.16b v0, w0
; CHECK-NEXT:    mov.b v0[2], w1
; CHECK-NEXT:    mov.b v0[5], wzr
; CHECK-NEXT:    mov.b v0[7], w1
; CHECK-NEXT:    mov.b v0[9], wzr
; CHECK-NEXT:    mov.b v0[12], w1
; CHECK-NEXT:    mov.b v0[15], w1
; CHECK-NEXT:    ret
  %v.0 = insertelement <16 x i8> <i8 undef, i8 undef, i8 undef, i8 undef, i8 undef, i8 0, i8 undef, i8 undef, i8 undef, i8 0, i8 undef, i8 undef, i8 undef, i8 undef, i8 undef, i8 undef>  , i8 %a, i32 0
  %v.1 = insertelement <16 x i8> %v.0, i8 %a, i32 1
  %v.2 = insertelement <16 x i8> %v.1, i8 %b, i32 2
  %v.3 = insertelement <16 x i8> %v.2, i8 %a, i32 3
  %v.4 = insertelement <16 x i8> %v.3, i8 %a, i32 4
  %v.6 = insertelement <16 x i8> %v.4, i8 %a, i32 6
  %v.7 = insertelement <16 x i8> %v.6, i8 %b, i32 7
  %v.8 = insertelement <16 x i8> %v.7, i8 %a, i32 8
  %v.10 = insertelement <16 x i8> %v.7, i8 %a, i32 10
  %v.11 = insertelement <16 x i8> %v.10, i8 %a, i32 11
  %v.12 = insertelement <16 x i8> %v.11, i8 %b, i32 12
  %v.13 = insertelement <16 x i8> %v.12, i8 %a, i32 13
  %v.14 = insertelement <16 x i8> %v.13, i8 %a, i32 14
  %v.15 = insertelement <16 x i8> %v.14, i8 %b, i32 15
  ret <16 x i8> %v.15
}

define <8 x half> @test_insert_v8f16_insert_1(half %a) {
; CHECK-LABEL: test_insert_v8f16_insert_1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $h0 killed $h0 def $q0
; CHECK-NEXT:    dup.8h v0, v0[0]
; CHECK-NEXT:    mov.h v0[7], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x half> <half undef, half undef, half undef, half undef, half undef, half undef, half undef, half 0.0>, half %a, i32 0
  %v.1 = insertelement <8 x half> %v.0, half %a, i32 1
  %v.2 = insertelement <8 x half> %v.1, half %a, i32 2
  %v.3 = insertelement <8 x half> %v.2, half %a, i32 3
  %v.4 = insertelement <8 x half> %v.3, half %a, i32 4
  %v.5 = insertelement <8 x half> %v.4, half %a, i32 5
  %v.6 = insertelement <8 x half> %v.5, half %a, i32 6
  ret <8 x half> %v.6
}


define <8 x half> @test_insert_v8f16_insert_2(half %a) {
; CHECK-LABEL: test_insert_v8f16_insert_2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v1, #0000000000000000
; CHECK-NEXT:    // kill: def $h0 killed $h0 def $q0
; CHECK-NEXT:    mov.h v1[1], v0[0]
; CHECK-NEXT:    mov.h v1[2], v0[0]
; CHECK-NEXT:    mov.16b v0, v1
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x half> zeroinitializer, half %a, i32 2
  %v.1 = insertelement <8 x half> %v.0, half %a, i32 1
  ret <8 x half> %v.1
}

define <8 x i16> @test_insert_v8i16_insert_2(i16 %a) {
; CHECK-LABEL: test_insert_v8i16_insert_2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup.8h v0, w0
; CHECK-NEXT:    mov.h v0[3], wzr
; CHECK-NEXT:    mov.h v0[7], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x i16> <i16 undef, i16 undef, i16 undef, i16 0, i16 undef, i16 undef, i16 undef, i16 0>, i16 %a, i32 0
  %v.1 = insertelement <8 x i16> %v.0, i16 %a, i32 1
  %v.2 = insertelement <8 x i16> %v.1, i16 %a, i32 2
  %v.3 = insertelement <8 x i16> %v.2, i16 %a, i32 4
  %v.4 = insertelement <8 x i16> %v.3, i16 %a, i32 5
  %v.5 = insertelement <8 x i16> %v.4, i16 %a, i32 6
  ret <8 x i16> %v.5
}

define <8 x i16> @test_insert_v8i16_insert_3(i16 %a) {
; CHECK-LABEL: test_insert_v8i16_insert_3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    dup.8h v0, w0
; CHECK-NEXT:    mov.h v0[1], wzr
; CHECK-NEXT:    mov.h v0[3], wzr
; CHECK-NEXT:    mov.h v0[7], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x i16> <i16 undef, i16 0, i16 undef, i16 0, i16 undef, i16 undef, i16 undef, i16 0>, i16 %a, i32 0
  %v.2 = insertelement <8 x i16> %v.0, i16 %a, i32 2
  %v.3 = insertelement <8 x i16> %v.2, i16 %a, i32 4
  %v.4 = insertelement <8 x i16> %v.3, i16 %a, i32 5
  %v.5 = insertelement <8 x i16> %v.4, i16 %a, i32 6
  ret <8 x i16> %v.5
}

define <8 x i16> @test_insert_v8i16_insert_4(i16 %a) {
; CHECK-LABEL: test_insert_v8i16_insert_4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v0, #0000000000000000
; CHECK-NEXT:    mov.h v0[0], w0
; CHECK-NEXT:    mov.h v0[2], w0
; CHECK-NEXT:    mov.h v0[4], w0
; CHECK-NEXT:    mov.h v0[5], w0
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x i16> <i16 undef, i16 0, i16 undef, i16 0, i16 undef, i16 undef, i16 0, i16 0>, i16 %a, i32 0
  %v.2 = insertelement <8 x i16> %v.0, i16 %a, i32 2
  %v.3 = insertelement <8 x i16> %v.2, i16 %a, i32 4
  %v.4 = insertelement <8 x i16> %v.3, i16 %a, i32 5
  ret <8 x i16> %v.4
}

define <8 x i16> @test_insert_v8i16_insert_5(i16 %a) {
; CHECK-LABEL: test_insert_v8i16_insert_5:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v0, #0000000000000000
; CHECK-NEXT:    mov.h v0[0], w0
; CHECK-NEXT:    mov.h v0[4], w0
; CHECK-NEXT:    mov.h v0[5], w0
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x i16> <i16 undef, i16 0, i16 0, i16 0, i16 undef, i16 undef, i16 0, i16 0>, i16 %a, i32 0
  %v.3 = insertelement <8 x i16> %v.0, i16 %a, i32 4
  %v.4 = insertelement <8 x i16> %v.3, i16 %a, i32 5
  ret <8 x i16> %v.4
}

define <2 x float> @test_insert_v2f32_undef_zero_vector(float %a) {
; CHECK-LABEL: test_insert_v2f32_undef_zero_vector:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi d1, #0000000000000000
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov.s v1[1], v0[0]
; CHECK-NEXT:    fmov d0, d1
; CHECK-NEXT:    ret
  %v.0 = insertelement <2 x float> <float 0.000000e+00, float undef>, float %a, i32 1
  ret <2 x float> %v.0
}

define <4 x float> @test_insert_3_f32_undef_zero_vector(float %a) {
; CHECK-LABEL: test_insert_3_f32_undef_zero_vector:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    dup.4s v0, v0[0]
; CHECK-NEXT:    mov.s v0[3], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x float> <float undef, float undef, float undef, float 0.000000e+00>, float %a, i32 0
  %v.1 = insertelement <4 x float> %v.0, float %a, i32 1
  %v.2 = insertelement <4 x float> %v.1, float %a, i32 2
  ret <4 x float> %v.2
}

define <4 x float> @test_insert_3_f32_undef(float %a) {
; CHECK-LABEL: test_insert_3_f32_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    dup.4s v0, v0[0]
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x float> <float undef, float undef, float undef, float undef>, float %a, i32 0
  %v.1 = insertelement <4 x float> %v.0, float %a, i32 1
  %v.2 = insertelement <4 x float> %v.1, float %a, i32 2
  ret <4 x float> %v.2
}

define <4 x float> @test_insert_2_f32_undef_zero(float %a) {
; CHECK-LABEL: test_insert_2_f32_undef_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v1, #0000000000000000
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov.s v1[0], v0[0]
; CHECK-NEXT:    mov.s v1[2], v0[0]
; CHECK-NEXT:    mov.16b v0, v1
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x float> <float undef, float 0.000000e+00, float undef, float 0.000000e+00>, float %a, i32 0
  %v.1 = insertelement <4 x float> %v.0, float %a, i32 2
  ret <4 x float> %v.1
}

define <2 x double> @test_insert_v2f64_undef_insert1(double %a) {
; CHECK-LABEL: test_insert_v2f64_undef_insert1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    movi.2d v1, #0000000000000000
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    mov.d v1[0], v0[0]
; CHECK-NEXT:    mov.16b v0, v1
; CHECK-NEXT:    ret
  %v.0 = insertelement <2 x double > <double undef, double 0.000000e+00>, double %a, i32 0
  ret <2 x double> %v.0
}

define <4 x float> @test_insert_2_f32_var(float %a, <4 x float> %b) {
; CHECK-LABEL: test_insert_2_f32_var:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $s0 killed $s0 def $q0
; CHECK-NEXT:    mov.s v1[0], v0[0]
; CHECK-NEXT:    mov.s v1[2], v0[0]
; CHECK-NEXT:    mov.16b v0, v1
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x float> %b, float %a, i32 0
  %v.1 = insertelement <4 x float> %v.0, float %a, i32 2
  ret <4 x float> %v.1
}

define <8 x i16> @test_insert_v8i16_i16_zero(<8 x i16> %a) {
; CHECK-LABEL: test_insert_v8i16_i16_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov.h v0[5], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x i16> %a, i16 0, i32 5
  ret <8 x i16> %v.0
}

; TODO: This should jsut be a mov.s v0[3], wzr
define <4 x half> @test_insert_v4f16_f16_zero(<4 x half> %a) {
; CHECK-LABEL: test_insert_v4f16_f16_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    mov.h v0[0], wzr
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x half> %a, half 0.000000e+00, i32 0
  ret <4 x half> %v.0
}

define <8 x half> @test_insert_v8f16_f16_zero(<8 x half> %a) {
; CHECK-LABEL: test_insert_v8f16_f16_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov.h v0[6], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <8 x half> %a, half 0.000000e+00, i32 6
  ret <8 x half> %v.0
}

define <2 x float> @test_insert_v2f32_f32_zero(<2 x float> %a) {
; CHECK-LABEL: test_insert_v2f32_f32_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    // kill: def $d0 killed $d0 def $q0
; CHECK-NEXT:    mov.s v0[0], wzr
; CHECK-NEXT:    // kill: def $d0 killed $d0 killed $q0
; CHECK-NEXT:    ret
  %v.0 = insertelement <2 x float> %a, float 0.000000e+00, i32 0
  ret <2 x float> %v.0
}

define <4 x float> @test_insert_v4f32_f32_zero(<4 x float> %a) {
; CHECK-LABEL: test_insert_v4f32_f32_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov.s v0[3], wzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <4 x float> %a, float 0.000000e+00, i32 3
  ret <4 x float> %v.0
}

define <2 x double> @test_insert_v2f64_f64_zero(<2 x double> %a) {
; CHECK-LABEL: test_insert_v2f64_f64_zero:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov.d v0[1], xzr
; CHECK-NEXT:    ret
  %v.0 = insertelement <2 x double> %a, double 0.000000e+00, i32 1
  ret <2 x double> %v.0
}