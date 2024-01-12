(set-logic SLHV)
(declare-hvar emp IntHeap)
(declare-locvar nil IntLoc)
(declare-datatype pt_record_0 ((Pt_R_0 (loc IntLoc))))
(declare-datatype pt_record_1 ((Pt_R_1 (data Int))))
(declare-const invalidFree_4 Bool)
(declare-const loc_4 Int)
(declare-const invalidFree_3 Bool)
(declare-hvar H_4 IntHeap)
(declare-hvar H_3 IntHeap)
(declare-hvar AH_4 IntHeap)
(declare-hvar AH_3 IntHeap)
(declare-const $r_main0_4 Int)
(declare-const $r_main0_3 Int)
(declare-const $i7_main0_4 Int)
(declare-const $i7_main0_3 Int)
(declare-const $i6_main0_4 Int)
(declare-const $i6_main0_3 Int)
(declare-const $i2_main0_4 Int)
(declare-const $i2_main0_3 Int)
(declare-locvar $p9_main0_4 IntLoc)
(declare-locvar $p9_main0_3 IntLoc)
(declare-locvar $p8_main0_4 IntLoc)
(declare-locvar $p8_main0_3 IntLoc)
(declare-locvar $p5_main0_4 IntLoc)
(declare-locvar $p5_main0_3 IntLoc)
(declare-locvar $p4_main0_4 IntLoc)
(declare-locvar $p4_main0_3 IntLoc)
(declare-locvar $p3_main0_4 IntLoc)
(declare-locvar $p3_main0_3 IntLoc)
(declare-locvar $p1_main0_4 IntLoc)
(declare-locvar $p1_main0_3 IntLoc)
(declare-locvar $p0_main0_4 IntLoc)
(declare-locvar $p0_main0_3 IntLoc)
(declare-const loc_3 Int)
(declare-const $i7_main0_2 Int)
(declare-const $i6_main0_2 Int)
(declare-const $i2_main0_2 Int)
(declare-locvar $p8_main0_2 IntLoc)
(declare-locvar $p5_main0_2 IntLoc)
(declare-locvar $p4_main0_2 IntLoc)
(declare-locvar $p3_main0_2 IntLoc)
(declare-locvar $p1_main0_2 IntLoc)
(declare-locvar $p0_main0_2 IntLoc)
(declare-const invalidFree3_3 Bool)
(declare-hvar H5_3 IntHeap)
(declare-hvar AH5_3 IntHeap)
(declare-const $r_main01_3 Int)
(declare-locvar $p9_main01_3 IntLoc)
(declare-const invalidFree_2 Bool)
(declare-hvar h3_3 IntHeap)
(declare-locvar l13_3 IntLoc)
(declare-const d8_3 Int)
(declare-hvar H_2 IntHeap)
(declare-const d7_3 Int)
(declare-locvar l11_3 IntLoc)
(declare-locvar l12_3 IntLoc)
(declare-hvar ah5 IntHeap)
(declare-hvar AH_2 IntHeap)
(declare-const d9_3 Int)
(declare-hvar ah6_3 IntHeap)
(declare-const loc_2 Int)
(declare-const invalidFree_1 Bool)
(declare-hvar H_1 IntHeap)
(declare-hvar AH_1 IntHeap)
(declare-const $r_main0_2 Int)
(declare-const $r_main0_1 Int)
(declare-const $i7_main0_1 Int)
(declare-const $i6_main0_1 Int)
(declare-const $i2_main0_1 Int)
(declare-locvar $p9_main0_2 IntLoc)
(declare-locvar $p9_main0_1 IntLoc)
(declare-locvar $p8_main0_1 IntLoc)
(declare-locvar $p5_main0_1 IntLoc)
(declare-locvar $p4_main0_1 IntLoc)
(declare-locvar $p3_main0_1 IntLoc)
(declare-locvar $p1_main0_1 IntLoc)
(declare-locvar $p0_main0_1 IntLoc)
(declare-const loc_1 Int)
(declare-const invalidFree2_2 Bool)
(declare-hvar H4_2 IntHeap)
(declare-hvar AH4_2 IntHeap)
(declare-locvar $p8_main01_2 IntLoc)
(declare-hvar h2_2 IntHeap)
(declare-locvar l10_2 IntLoc)
(declare-const d5_2 Int)
(declare-const d4_2 Int)
(declare-locvar l8_2 IntLoc)
(declare-locvar l9_2 IntLoc)
(declare-hvar ah3 IntHeap)
(declare-const d6_2 Int)
(declare-hvar ah4_2 IntHeap)
(declare-const $r_main0_0 Int)
(declare-const $i6_main0_0 Int)
(declare-const $i2_main0_0 Int)
(declare-locvar $p9_main0_0 IntLoc)
(declare-locvar $p8_main0_0 IntLoc)
(declare-const invalidFree1_1 Bool)
(declare-hvar H3_1 IntHeap)
(declare-hvar AH3_1 IntHeap)
(declare-locvar $p5_main01_1 IntLoc)
(declare-locvar $p4_main01_1 IntLoc)
(declare-locvar $p3_main01_1 IntLoc)
(declare-locvar $p1_main01_1 IntLoc)
(declare-locvar $p0_main01_1 IntLoc)
(declare-const $i7_main01_1 Int)
(declare-locvar l6_1 IntLoc)
(declare-hvar AH2_1 IntHeap)
(declare-locvar l7_1 IntLoc)
(declare-hvar H2_1 IntHeap)
(declare-const invalidFree_0 Bool)
(declare-hvar h1_1 IntHeap)
(declare-locvar l5_1 IntLoc)
(declare-const d2_1 Int)
(declare-hvar H1_1 IntHeap)
(declare-const d1_1 Int)
(declare-locvar l3_1 IntLoc)
(declare-locvar l4_1 IntLoc)
(declare-hvar ah1 IntHeap)
(declare-hvar AH1_1 IntHeap)
(declare-const d3_1 Int)
(declare-hvar ah2_1 IntHeap)
(declare-locvar l1_1 IntLoc)
(declare-hvar AH_0 IntHeap)
(declare-locvar l2_1 IntLoc)
(declare-hvar H_0 IntHeap)
(declare-const loc_0 Int)
(assert
 (let (($x675 (= loc_4 4)))
 (let (($x773 (= invalidFree_3 invalidFree_4)))
 (let (($x661 (= $r_main0_3 $r_main0_4)))
 (let (($x658 (= $i7_main0_3 $i7_main0_4)))
 (let (($x655 (= $i6_main0_3 $i6_main0_4)))
 (let (($x662 (and (and (and (and true (= $i2_main0_3 $i2_main0_4)) $x655) $x658) $x661)))
 (let (($x648 (= $p9_main0_3 $p9_main0_4)))
 (let (($x645 (= $p8_main0_3 $p8_main0_4)))
 (let (($x642 (= $p5_main0_3 $p5_main0_4)))
 (let (($x639 (= $p4_main0_3 $p4_main0_4)))
 (let (($x636 (= $p3_main0_3 $p3_main0_4)))
 (let (($x633 (= $p1_main0_3 $p1_main0_4)))
 (let (($x640 (and (and (and (and true (= $p0_main0_3 $p0_main0_4)) $x633) $x636) $x639)))
 (let (($x518 (and true true)))
 (let (($x670 (and (and (and $x518 (and (and (and $x640 $x642) $x645) $x648)) $x662) (and (and true (= AH_3 AH_4)) (= H_3 H_4)))))
 (let (($x625 (= loc_3 4)))
 (let (($x617 (= $i7_main0_2 $i7_main0_3)))
 (let (($x614 (= $i6_main0_2 $i6_main0_3)))
 (let (($x618 (and (and (and true (= $i2_main0_2 $i2_main0_3)) $x614) $x617)))
 (let (($x607 (= $p8_main0_2 $p8_main0_3)))
 (let (($x604 (= $p5_main0_2 $p5_main0_3)))
 (let (($x601 (= $p4_main0_2 $p4_main0_3)))
 (let (($x598 (= $p3_main0_2 $p3_main0_3)))
 (let (($x595 (= $p1_main0_2 $p1_main0_3)))
 (let (($x602 (and (and (and (and true (= $p0_main0_2 $p0_main0_3)) $x595) $x598) $x601)))
 (let (($x608 (and (and $x602 $x604) $x607)))
 (let (($x764 (= invalidFree_3 invalidFree3_3)))
 (let (($x587 (= H_3 H5_3)))
 (let (($x584 (= AH_3 AH5_3)))
 (let (($x585 (and (and (= $p9_main0_3 $p9_main01_3) (= $r_main0_3 $r_main01_3)) $x584)))
 (let (($x588 (and $x585 $x587)))
 (let (($x544 (= $r_main01_3 0)))
 (let (($x749 (or $x544 invalidFree3_3)))
 (let (($x750 (= invalidFree3_3 invalidFree_2)))
 (let (($x751 (and invalidFree_2 $x750)))
 (let (($x546 (= H5_3 h3_3)))
 (let (($x547 (= $p9_main01_3 l13_3)))
 (let (($x551 (= H_2 (uplus h3_3 (pt l13_3 (Pt_R_1 d8_3))))))
 (let (($x554 (= d7_3 1)))
 (let (($x556 (= $p9_main01_3 l11_3)))
 (let (($x560 (= H_2 (uplus h3_3 (pt l11_3 (Pt_R_0 l12_3))))))
 (let (($x563 (= d7_3 2)))
 (let (($x565 (and (=> $x563 (and (and $x560 $x556) $x546)) (=> $x554 (and (and $x551 $x547) $x546)))))
 (let (($x566 (= AH5_3 ah5)))
 (let (($x570 (= AH_2 (uplus ah5 (pt $p9_main01_3 (Pt_R_1 d7_3))))))
 (let (($x572 (and (and $x570 $x566) $x565)))
 (let (($x757 (and (= ah6_3 (uplus AH_2 (pt $p9_main01_3 (Pt_R_1 d9_3)))) invalidFree3_3)))
 (let (($x574 (= $p9_main01_3 $p5_main0_2)))
 (let (($x760 (or $x574 invalidFree_2)))
 (let (($x766 (and (and (and $x760 (or (or $x757 (and $x572 $x750)) $x751)) $x749) (and $x588 $x764))))
 (let (($x513 (= loc_2 3)))
 (let (($x740 (= invalidFree_1 invalidFree_2)))
 (let (($x505 (= $r_main0_1 $r_main0_2)))
 (let (($x502 (= $i7_main0_1 $i7_main0_2)))
 (let (($x499 (= $i6_main0_1 $i6_main0_2)))
 (let (($x506 (and (and (and (and true (= $i2_main0_1 $i2_main0_2)) $x499) $x502) $x505)))
 (let (($x492 (= $p9_main0_1 $p9_main0_2)))
 (let (($x519 (= $p8_main0_1 $p8_main0_2)))
 (let (($x489 (= $p5_main0_1 $p5_main0_2)))
 (let (($x486 (= $p4_main0_1 $p4_main0_2)))
 (let (($x483 (= $p3_main0_1 $p3_main0_2)))
 (let (($x480 (= $p1_main0_1 $p1_main0_2)))
 (let (($x487 (and (and (and (and true (= $p0_main0_1 $p0_main0_2)) $x480) $x483) $x486)))
 (let (($x490 (and $x487 $x489)))
 (let (($x528 (and (and (and $x518 (and (and $x490 $x519) $x492)) $x506) (and (and true (= AH_1 AH_2)) (= H_1 H_2)))))
 (let (($x420 (= loc_1 2)))
 (let (($x517 (and $x420 (not (= $i7_main0_1 1)))))
 (let (($x493 (and $x490 $x492)))
 (let (($x733 (= invalidFree_2 invalidFree2_2)))
 (let (($x472 (= H_2 H4_2)))
 (let (($x473 (and (and (= $p8_main0_2 $p8_main01_2) (= AH_2 AH4_2)) $x472)))
 (let (($x720 (= invalidFree2_2 invalidFree_1)))
 (let (($x721 (and invalidFree_1 $x720)))
 (let (($x435 (= H4_2 h2_2)))
 (let (($x436 (= $p8_main01_2 l10_2)))
 (let (($x440 (= H_1 (uplus h2_2 (pt l10_2 (Pt_R_1 d5_2))))))
 (let (($x443 (= d4_2 1)))
 (let (($x445 (= $p8_main01_2 l8_2)))
 (let (($x449 (= H_1 (uplus h2_2 (pt l8_2 (Pt_R_0 l9_2))))))
 (let (($x452 (= d4_2 2)))
 (let (($x454 (and (=> $x452 (and (and $x449 $x445) $x435)) (=> $x443 (and (and $x440 $x436) $x435)))))
 (let (($x455 (= AH4_2 ah3)))
 (let (($x459 (= AH_1 (uplus ah3 (pt $p8_main01_2 (Pt_R_1 d4_2))))))
 (let (($x461 (and (and $x459 $x455) $x454)))
 (let (($x727 (and (= ah4_2 (uplus AH_1 (pt $p8_main01_2 (Pt_R_1 d6_2)))) invalidFree2_2)))
 (let (($x463 (= $p8_main01_2 $p5_main0_1)))
 (let (($x730 (or $x463 invalidFree_1)))
 (let (($x735 (and (and $x730 (or (or $x727 (and $x461 $x720)) $x721)) (and $x473 $x733))))
 (let (($x433 (= $i7_main0_1 1)))
 (let (($x434 (and $x420 $x433)))
 (let (($x744 (and (=> $x434 (and (and (and $x735 $x493) $x506) $x513)) (=> $x517 (and (and $x528 $x740) $x513)))))
 (let (($x413 (= $r_main0_0 $r_main0_1)))
 (let (($x409 (= $i6_main0_0 $i6_main0_1)))
 (let (($x414 (and (and (and true (= $i2_main0_0 $i2_main0_1)) $x409) $x413)))
 (let (($x402 (= $p9_main0_0 $p9_main0_1)))
 (let (($x403 (and (and true (= $p8_main0_0 $p8_main0_1)) $x402)))
 (let (($x709 (= invalidFree_1 invalidFree1_1)))
 (let (($x392 (= H_1 H3_1)))
 (let (($x389 (= AH_1 AH3_1)))
 (let (($x386 (= $p5_main0_1 $p5_main01_1)))
 (let (($x383 (= $p4_main0_1 $p4_main01_1)))
 (let (($x380 (= $p3_main0_1 $p3_main01_1)))
 (let (($x377 (= $p1_main0_1 $p1_main01_1)))
 (let (($x378 (and (and (= $i7_main0_1 $i7_main01_1) (= $p0_main0_1 $p0_main01_1)) $x377)))
 (let (($x393 (and (and (and (and (and $x378 $x380) $x383) $x386) $x389) $x392)))
 (let (($x304 (and (not (= $i6_main0_0 $i2_main0_0)) (= $i7_main01_1 0))))
 (let (($x302 (= $i6_main0_0 $i2_main0_0)))
 (let (($x306 (and $x302 (= $i7_main01_1 1))))
 (let (($x307 (or $x306 $x304)))
 (let (($x309 (= $p5_main01_1 $p4_main01_1)))
 (let (($x687 (or $x309 invalidFree1_1)))
 (let (($x313 (= AH3_1 (uplus AH2_1 (pt l6_1 (Pt_R_1 2))))))
 (let (($x314 (= $p4_main01_1 l6_1)))
 (let (($x318 (= H3_1 (uplus H2_1 (pt l6_1 (Pt_R_0 l7_1))))))
 (let (($x320 (and (and $x318 $x314) $x313)))
 (let (($x689 (= invalidFree1_1 invalidFree_0)))
 (let (($x690 (and invalidFree_0 $x689)))
 (let (($x322 (= H2_1 h1_1)))
 (let (($x323 (= $p3_main01_1 l5_1)))
 (let (($x327 (= H1_1 (uplus h1_1 (pt l5_1 (Pt_R_1 d2_1))))))
 (let (($x330 (= d1_1 1)))
 (let (($x332 (= $p3_main01_1 l3_1)))
 (let (($x336 (= H1_1 (uplus h1_1 (pt l3_1 (Pt_R_0 l4_1))))))
 (let (($x339 (= d1_1 2)))
 (let (($x341 (and (=> $x339 (and (and $x336 $x332) $x322)) (=> $x330 (and (and $x327 $x323) $x322)))))
 (let (($x342 (= AH2_1 ah1)))
 (let (($x346 (= AH1_1 (uplus ah1 (pt $p3_main01_1 (Pt_R_1 d1_1))))))
 (let (($x348 (and (and $x346 $x342) $x341)))
 (let (($x696 (and (= ah2_1 (uplus AH1_1 (pt $p3_main01_1 (Pt_R_1 d3_1)))) invalidFree1_1)))
 (let (($x350 (= $p3_main01_1 $p1_main01_1)))
 (let (($x699 (or $x350 invalidFree_0)))
 (let (($x352 (= $p1_main01_1 $p0_main01_1)))
 (let (($x700 (or $x352 invalidFree_0)))
 (let (($x356 (= AH1_1 (uplus AH_0 (pt l1_1 (Pt_R_1 2))))))
 (let (($x357 (= $p0_main01_1 l1_1)))
 (let (($x361 (= H1_1 (uplus H_0 (pt l1_1 (Pt_R_0 l2_1))))))
 (let (($x363 (and (and $x361 $x357) $x356)))
 (let (($x704 (and (and (and (or $x363 invalidFree_0) $x700) $x699) (or (or $x696 (and $x348 $x689)) $x690))))
 (let (($x707 (and (and (and $x704 (or $x320 invalidFree1_1)) $x687) (or $x307 invalidFree1_1))))
 (let (($x271 (= loc_0 1)))
 (let (($x715 (=> $x271 (and (and (and (and $x707 (and $x393 $x709)) $x403) $x414) $x420))))
 (let (($x681 (not invalidFree_0)))
 (let (($x273 (and (and (= H_0 emp) (= AH_0 emp)) $x271)))
 (let (($x771 (and (and (and (and $x273 $x681) $x715) $x744) (=> $x513 (and (and (and $x766 $x608) $x618) $x625)))))
 (and (and $x771 (=> $x625 (and (and $x670 $x773) $x675))) invalidFree_4))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
