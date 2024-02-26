(set-logic SLHV)
(declare-hvar emp IntHeap)
(declare-locvar nil IntLoc)
(declare-datatype pt_record_0 ((Pt_R_0 (loc IntLoc))))
(declare-datatype pt_record_1 ((Pt_R_1 (data Int))))
(declare-const d16 Int)
(declare-locvar l37 IntLoc)
(declare-hvar ah5 IntHeap)
(declare-hvar AH_1 IntHeap)
(declare-const d15 Int)
(declare-locvar l35 IntLoc)
(declare-hvar h23 IntHeap)
(declare-hvar H_1 IntHeap)
(declare-locvar l36 IntLoc)
(declare-const loc_1 Int)
(declare-const $r_main0_0 Int)
(declare-const $r_main0_1 Int)
(declare-locvar $p9_free_data0_0 IntLoc)
(declare-locvar $p9_free_data0_1 IntLoc)
(declare-locvar $p8_free_data0_0 IntLoc)
(declare-locvar $p8_free_data0_1 IntLoc)
(declare-locvar $p11_free_data0_0 IntLoc)
(declare-locvar $p11_free_data0_1 IntLoc)
(declare-locvar $p10_free_data0_0 IntLoc)
(declare-locvar $p10_free_data0_1 IntLoc)
(declare-hvar H7_1 IntHeap)
(declare-hvar AH3_1 IntHeap)
(declare-locvar $p9_alloc_data01_1 IntLoc)
(declare-locvar $p9_alloc_data0_1 IntLoc)
(declare-locvar $p8_alloc_data01_1 IntLoc)
(declare-locvar $p8_alloc_data0_1 IntLoc)
(declare-locvar $p7_alloc_data01_1 IntLoc)
(declare-locvar $p7_alloc_data0_1 IntLoc)
(declare-locvar $p6_alloc_data01_1 IntLoc)
(declare-locvar $p6_alloc_data0_1 IntLoc)
(declare-locvar $p5_alloc_data01_1 IntLoc)
(declare-locvar $p5_alloc_data0_1 IntLoc)
(declare-locvar $p4_free_data01_1 IntLoc)
(declare-locvar $p4_free_data0_1 IntLoc)
(declare-locvar $p4_alloc_data01_1 IntLoc)
(declare-locvar $p4_alloc_data0_1 IntLoc)
(declare-locvar $p3_free_data01_1 IntLoc)
(declare-locvar $p3_free_data0_1 IntLoc)
(declare-locvar $p3_alloc_data01_1 IntLoc)
(declare-locvar $p3_alloc_data0_1 IntLoc)
(declare-locvar $p2_free_data01_1 IntLoc)
(declare-locvar $p2_free_data0_1 IntLoc)
(declare-locvar $p2_alloc_data01_1 IntLoc)
(declare-locvar $p2_alloc_data0_1 IntLoc)
(declare-locvar $p1_free_data01_1 IntLoc)
(declare-locvar $p1_free_data0_1 IntLoc)
(declare-locvar $p1_alloc_data01_1 IntLoc)
(declare-locvar $p1_alloc_data0_1 IntLoc)
(declare-locvar $p10_alloc_data01_1 IntLoc)
(declare-locvar $p10_alloc_data0_1 IntLoc)
(declare-locvar $p0_main01_1 IntLoc)
(declare-locvar $p0_main0_1 IntLoc)
(declare-locvar $p0_free_data01_1 IntLoc)
(declare-locvar $p0_free_data0_1 IntLoc)
(declare-locvar $p0_alloc_data01_1 IntLoc)
(declare-locvar $p0_alloc_data0_1 IntLoc)
(declare-const $i7_free_data01_1 Int)
(declare-const $i7_free_data0_1 Int)
(declare-const $i6_free_data01_1 Int)
(declare-const $i6_free_data0_1 Int)
(declare-const $i5_free_data01_1 Int)
(declare-const $i5_free_data0_1 Int)
(declare-locvar l17_1 IntLoc)
(declare-hvar h15_1 IntHeap)
(declare-locvar l15_1 IntLoc)
(declare-hvar h13_1 IntHeap)
(declare-hvar h11_1 IntHeap)
(declare-const d5_1 Int)
(declare-hvar H6_1 IntHeap)
(declare-locvar l13_1 IntLoc)
(declare-hvar h9_1 IntHeap)
(declare-hvar h7_1 IntHeap)
(declare-const d3_1 Int)
(declare-hvar H5_1 IntHeap)
(declare-locvar l11_1 IntLoc)
(declare-hvar h5_1 IntHeap)
(declare-hvar h3_1 IntHeap)
(declare-locvar l9_1 IntLoc)
(declare-hvar H4_1 IntHeap)
(declare-locvar l8_1 IntLoc)
(declare-hvar AH2_1 IntHeap)
(declare-const d2_1 Int)
(declare-hvar H3_1 IntHeap)
(declare-hvar h1_1 IntHeap)
(declare-locvar l6_1 IntLoc)
(declare-hvar H2_1 IntHeap)
(declare-locvar l5_1 IntLoc)
(declare-hvar AH1_1 IntHeap)
(declare-const d1_1 Int)
(declare-hvar H1_1 IntHeap)
(declare-locvar l1_1 IntLoc)
(declare-hvar AH_0 IntHeap)
(declare-locvar l3_1 IntLoc)
(declare-locvar l4_1 IntLoc)
(declare-locvar l2_1 IntLoc)
(declare-hvar H_0 IntHeap)
(declare-const loc_0 Int)
(assert
 (let (($x1196 (or (= H_1 (uplus h23 (pt l35 (Pt_R_0 l36)))) (= H_1 (uplus h23 (pt l35 (Pt_R_1 d15)))))))
 (let (($x1205 (and (and false $x1196) (= AH_1 (uplus ah5 (pt l37 (Pt_R_1 d16)))))))
 (let (($x1089 (= loc_1 2)))
 (let (($x1085 (= $r_main0_1 $r_main0_0)))
 (let (($x1086 (and true $x1085)))
 (let (($x1080 (= $p9_free_data0_1 $p9_free_data0_0)))
 (let (($x1076 (= $p8_free_data0_1 $p8_free_data0_0)))
 (let (($x1072 (= $p11_free_data0_1 $p11_free_data0_0)))
 (let (($x1077 (and (and (and true (= $p10_free_data0_1 $p10_free_data0_0)) $x1072) $x1076)))
 (let (($x1081 (and $x1077 $x1080)))
 (let (($x1060 (= H_1 H7_1)))
 (let (($x1057 (= AH_1 AH3_1)))
 (let (($x1054 (= $p9_alloc_data0_1 $p9_alloc_data01_1)))
 (let (($x1051 (= $p8_alloc_data0_1 $p8_alloc_data01_1)))
 (let (($x1048 (= $p7_alloc_data0_1 $p7_alloc_data01_1)))
 (let (($x1045 (= $p6_alloc_data0_1 $p6_alloc_data01_1)))
 (let (($x1042 (= $p5_alloc_data0_1 $p5_alloc_data01_1)))
 (let (($x1039 (= $p4_free_data0_1 $p4_free_data01_1)))
 (let (($x1036 (= $p4_alloc_data0_1 $p4_alloc_data01_1)))
 (let (($x1033 (= $p3_free_data0_1 $p3_free_data01_1)))
 (let (($x1030 (= $p3_alloc_data0_1 $p3_alloc_data01_1)))
 (let (($x1027 (= $p2_free_data0_1 $p2_free_data01_1)))
 (let (($x1024 (= $p2_alloc_data0_1 $p2_alloc_data01_1)))
 (let (($x1021 (= $p1_free_data0_1 $p1_free_data01_1)))
 (let (($x1018 (= $p1_alloc_data0_1 $p1_alloc_data01_1)))
 (let (($x1015 (= $p10_alloc_data0_1 $p10_alloc_data01_1)))
 (let (($x1012 (= $p0_main0_1 $p0_main01_1)))
 (let (($x1009 (= $p0_free_data0_1 $p0_free_data01_1)))
 (let (($x1006 (= $p0_alloc_data0_1 $p0_alloc_data01_1)))
 (let (($x1003 (= $i7_free_data0_1 $i7_free_data01_1)))
 (let (($x1000 (= $i6_free_data0_1 $i6_free_data01_1)))
 (let (($x998 (= $i5_free_data0_1 $i5_free_data01_1)))
 (let (($x1016 (and (and (and (and (and (and $x998 $x1000) $x1003) $x1006) $x1009) $x1012) $x1015)))
 (let (($x1034 (and (and (and (and (and (and $x1016 $x1018) $x1021) $x1024) $x1027) $x1030) $x1033)))
 (let (($x1052 (and (and (and (and (and (and $x1034 $x1036) $x1039) $x1042) $x1045) $x1048) $x1051)))
 (let (($x1061 (and (and (and $x1052 $x1054) $x1057) $x1060)))
 (let (($x1144 (and $x1061 true)))
 (let (($x747 (= $i7_free_data01_1 0)))
 (let (($x751 (= $i7_free_data01_1 1)))
 (let (($x748 (>= $i5_free_data01_1 $i6_free_data01_1)))
 (let (($x753 (or (and $x748 $x751) (and (not $x748) $x747))))
 (let (($x755 (= $i6_free_data01_1 8)))
 (let (($x757 (= $i5_free_data01_1 8)))
 (let (($x766 (and (= H7_1 (uplus h15_1 (pt $p3_free_data01_1 (Pt_R_0 l17_1)))) (= $p4_free_data01_1 l17_1))))
 (let (($x778 (= $p3_free_data01_1 (locadd $p0_free_data01_1 1))))
 (let (($x787 (and (= H7_1 (uplus h13_1 (pt $p1_free_data01_1 (Pt_R_0 l15_1)))) (= $p2_free_data01_1 l15_1))))
 (let (($x798 (= $p1_free_data01_1 $p0_free_data01_1)))
 (let (($x800 (= $p0_free_data01_1 $p0_main01_1)))
 (let (($x811 (and (= H6_1 (uplus h11_1 (pt $p10_alloc_data01_1 (Pt_R_1 d5_1)))) (= H7_1 (uplus h11_1 (pt $p10_alloc_data01_1 (Pt_R_1 8)))))))
 (let (($x829 (and (= H6_1 (uplus h9_1 (pt $p9_alloc_data01_1 (Pt_R_0 l13_1)))) (= $p10_alloc_data01_1 l13_1))))
 (let ((?x840 (locadd $p0_alloc_data01_1 1)))
 (let (($x841 (= $p9_alloc_data01_1 ?x840)))
 (let (($x852 (and (= H5_1 (uplus h7_1 (pt $p8_alloc_data01_1 (Pt_R_1 d3_1)))) (= H6_1 (uplus h7_1 (pt $p8_alloc_data01_1 (Pt_R_1 4)))))))
 (let (($x870 (and (= H5_1 (uplus h5_1 (pt $p7_alloc_data01_1 (Pt_R_0 l11_1)))) (= $p8_alloc_data01_1 l11_1))))
 (let (($x881 (= $p7_alloc_data01_1 $p0_alloc_data01_1)))
 (let (($x888 (= H5_1 (uplus h3_1 (pt $p6_alloc_data01_1 (Pt_R_0 $p4_alloc_data01_1))))))
 (let (($x893 (and (= H4_1 (uplus h3_1 (pt $p6_alloc_data01_1 (Pt_R_0 l9_1)))) $x888)))
 (let (($x904 (= $p6_alloc_data01_1 ?x840)))
 (let (($x906 (= $p5_alloc_data01_1 $p4_alloc_data01_1)))
 (let (($x910 (= AH3_1 (uplus AH2_1 (pt l8_1 (Pt_R_1 4))))))
 (let (($x911 (= $p4_alloc_data01_1 l8_1)))
 (let (($x915 (= H4_1 (uplus H3_1 (pt l8_1 (Pt_R_1 d2_1))))))
 (let (($x917 (and (and $x915 $x911) $x910)))
 (let (($x924 (= H3_1 (uplus h1_1 (pt $p3_alloc_data01_1 (Pt_R_0 $p1_alloc_data01_1))))))
 (let (($x929 (and (= H2_1 (uplus h1_1 (pt $p3_alloc_data01_1 (Pt_R_0 l6_1)))) $x924)))
 (let (($x940 (= $p3_alloc_data01_1 $p0_alloc_data01_1)))
 (let (($x942 (= $p2_alloc_data01_1 $p1_alloc_data01_1)))
 (let (($x946 (= AH2_1 (uplus AH1_1 (pt l5_1 (Pt_R_1 3))))))
 (let (($x947 (= $p1_alloc_data01_1 l5_1)))
 (let (($x951 (= H2_1 (uplus H1_1 (pt l5_1 (Pt_R_1 d1_1))))))
 (let (($x953 (and (and $x951 $x947) $x946)))
 (let (($x955 (= $p0_alloc_data01_1 $p0_main01_1)))
 (let (($x959 (= AH1_1 (uplus AH_0 (pt l1_1 (Pt_R_1 2))))))
 (let (($x960 (= $p0_main01_1 l1_1)))
 (let (($x962 (= l3_1 (locadd l1_1 1))))
 (let ((?x968 (uplus H_0 (uplus (pt l1_1 (Pt_R_0 l2_1)) (pt l3_1 (Pt_R_0 l4_1))))))
 (let (($x969 (= H1_1 ?x968)))
 (let (($x972 (and (and (and $x969 $x962) $x960) $x959)))
 (let (($x1160 (and (and (and (and (and (and $x972 $x955) $x953) $x942) $x940) $x929) $x917)))
 (let (($x1166 (and (and (and (and (and (and $x1160 $x906) $x904) $x893) $x881) $x870) $x852)))
 (let (($x1172 (and (and (and (and (and (and $x1166 $x841) $x829) $x811) $x800) $x798) $x787)))
 (let (($x1178 (and (and (and (and (and (and $x1172 $x778) $x766) $x757) $x755) $x753) $x1144)))
 (let (($x667 (= loc_0 1)))
 (let (($x669 (and (and (= H_0 emp) (= AH_0 emp)) $x667)))
 (and (and $x669 (=> $x667 (and (and (and $x1178 $x1081) $x1086) $x1089))) $x1205))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
