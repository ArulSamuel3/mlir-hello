; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -indvars -opaque-pointers < %s | FileCheck %s

target datalayout = "n8:16:32:64"

@data = common global [240 x i8] zeroinitializer, align 16

; Based on the test from lftr.ll
define void @test_zext(ptr %a) {
; CHECK-LABEL: @test_zext(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[P_0:%.*]] = phi ptr [ @data, [[ENTRY:%.*]] ], [ [[T3:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[DOT0:%.*]] = phi ptr [ [[A:%.*]], [[ENTRY]] ], [ [[T:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[T]] = getelementptr inbounds i8, ptr [[DOT0]], i64 1
; CHECK-NEXT:    [[T2:%.*]] = load i8, ptr [[DOT0]], align 1
; CHECK-NEXT:    [[T3]] = getelementptr inbounds i8, ptr [[P_0]], i64 1
; CHECK-NEXT:    store i8 [[T2]], ptr [[P_0]], align 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp ne ptr [[P_0]], getelementptr (i8, ptr @data, i64 239)
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[LOOP]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop

loop:
  %i.0 = phi i8 [ 0, %entry ], [ %t4, %loop ]
  %p.0 = phi ptr [ getelementptr inbounds ([240 x i8], [240 x i8]* @data, i64 0, i64 0), %entry ], [ %t3, %loop ]
  %.0 = phi ptr [ %a, %entry ], [ %t, %loop ]
  %t = getelementptr inbounds i8, ptr %.0, i64 1
  %t2 = load i8, ptr %.0, align 1
  %t3 = getelementptr inbounds i8, ptr %p.0, i64 1
  store i8 %t2, ptr %p.0, align 1
  %t4 = add i8 %i.0, 1
  %t5 = icmp ult i8 %t4, -16
  br i1 %t5, label %loop, label %exit

exit:
  ret void
}