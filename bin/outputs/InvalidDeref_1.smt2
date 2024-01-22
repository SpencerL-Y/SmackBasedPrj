(set-logic SLHV)
(declare-hvar emp IntHeap)
(declare-locvar nil IntLoc)
(declare-datatype pt_record_0 ((Pt_R_0 (loc IntLoc))))
(declare-datatype pt_record_1 ((Pt_R_1 (data Int))))
(declare-const invalidDeref_1 Bool)
(declare-const loc_1 Int)
(declare-const invalidDeref2_1 Bool)
(declare-hvar H4_1 IntHeap)
(declare-hvar H_1 IntHeap)
(declare-hvar AH2_1 IntHeap)
(declare-hvar AH_1 IntHeap)
(declare-const $r_main01_1 Int)
(declare-const $r_main0_1 Int)
(declare-locvar $p5_main01_1 IntLoc)
(declare-locvar $p5_main0_1 IntLoc)
(declare-locvar $p4_main01_1 IntLoc)
(declare-locvar $p4_main0_1 IntLoc)
(declare-locvar $p3_main01_1 IntLoc)
(declare-locvar $p3_main0_1 IntLoc)
(declare-locvar $p2_main01_1 IntLoc)
(declare-locvar $p2_main0_1 IntLoc)
(declare-locvar $p1_main01_1 IntLoc)
(declare-locvar $p1_main0_1 IntLoc)
(declare-locvar $p0_main01_1 IntLoc)
(declare-locvar $p0_main0_1 IntLoc)
(declare-const invalidDeref1_1 Bool)
(declare-hvar h3_1 IntHeap)
(declare-const d2_1 Int)
(declare-hvar H3_1 IntHeap)
(declare-const d3_1 Int)
(declare-hvar h4 IntHeap)
(declare-const invalidDeref_0 Bool)
(declare-hvar h1_1 IntHeap)
(declare-locvar l4_1 IntLoc)
(declare-hvar H2_1 IntHeap)
(declare-locvar l5_1 IntLoc)
(declare-hvar h2 IntHeap)
(declare-locvar l3_1 IntLoc)
(declare-hvar AH1_1 IntHeap)
(declare-const d1_1 Int)
(declare-hvar H1_1 IntHeap)
(declare-locvar l1_1 IntLoc)
(declare-hvar AH_0 IntHeap)
(declare-locvar l2_1 IntLoc)
(declare-hvar H_0 IntHeap)
(declare-const loc_0 Int)
(assert
 (let (($x302 (= loc_1 2)))
 (let (($x298 (= invalidDeref_1 invalidDeref2_1)))
 (let (($x295 (= H_1 H4_1)))
 (let (($x292 (= AH_1 AH2_1)))
 (let (($x289 (= $r_main0_1 $r_main01_1)))
 (let (($x286 (= $p5_main0_1 $p5_main01_1)))
 (let (($x283 (= $p4_main0_1 $p4_main01_1)))
 (let (($x280 (= $p3_main0_1 $p3_main01_1)))
 (let (($x277 (= $p2_main0_1 $p2_main01_1)))
 (let (($x278 (and (and (= $p0_main0_1 $p0_main01_1) (= $p1_main0_1 $p1_main01_1)) $x277)))
 (let (($x296 (and (and (and (and (and (and $x278 $x280) $x283) $x286) $x289) $x292) $x295)))
 (let (($x192 (= invalidDeref2_1 invalidDeref1_1)))
 (let (($x193 (and invalidDeref1_1 $x192)))
 (let (($x196 (= H4_1 (uplus h3_1 (pt $p5_main01_1 (Pt_R_1 10))))))
 (let (($x200 (= H3_1 (uplus h3_1 (pt $p5_main01_1 (Pt_R_1 d2_1))))))
 (let (($x201 (and $x200 $x196)))
 (let (($x203 (= $p5_main01_1 nil)))
 (let (($x207 (= h4 (uplus H3_1 (pt $p5_main01_1 (Pt_R_1 d3_1))))))
 (let (($x216 (= invalidDeref1_1 invalidDeref_0)))
 (let (($x217 (and invalidDeref_0 $x216)))
 (let (($x221 (= H3_1 (uplus h1_1 (pt $p3_main01_1 (Pt_R_0 $p1_main01_1))))))
 (let (($x225 (= H2_1 (uplus h1_1 (pt $p3_main01_1 (Pt_R_0 l4_1))))))
 (let (($x226 (and $x225 $x221)))
 (let (($x228 (= $p3_main01_1 nil)))
 (let (($x232 (= h2 (uplus H2_1 (pt $p3_main01_1 (Pt_R_0 l5_1))))))
 (let (($x243 (= AH2_1 (uplus AH1_1 (pt l3_1 (Pt_R_1 3))))))
 (let (($x244 (= $p1_main01_1 l3_1)))
 (let (($x248 (= H2_1 (uplus H1_1 (pt l3_1 (Pt_R_1 d1_1))))))
 (let (($x250 (and (and $x248 $x244) $x243)))
 (let (($x254 (= AH1_1 (uplus AH_0 (pt l1_1 (Pt_R_1 2))))))
 (let (($x255 (= $p0_main01_1 l1_1)))
 (let (($x259 (= H1_1 (uplus H_0 (pt l1_1 (Pt_R_0 l2_1))))))
 (let (($x261 (and (and $x259 $x255) $x254)))
 (let (($x264 (and (and (or $x261 invalidDeref_0) (or $x250 invalidDeref_0)) (or (= $p2_main01_1 $p1_main01_1) invalidDeref_0))))
 (let (($x266 (and (and $x264 (or (= $p3_main01_1 $p0_main01_1) invalidDeref_0)) (or (or (and (or $x232 $x228) invalidDeref1_1) (and $x226 $x216)) $x217))))
 (let (($x268 (and (and $x266 (or (= $p4_main01_1 $p0_main01_1) invalidDeref1_1)) (or (= $p5_main01_1 $p1_main01_1) invalidDeref1_1))))
 (let (($x269 (and $x268 (or (or (and (or $x207 $x203) invalidDeref2_1) (and $x201 $x192)) $x193))))
 (let (($x300 (and (and $x269 (or (= $r_main01_1 0) invalidDeref2_1)) (and $x296 $x298))))
 (let (($x159 (= loc_0 1)))
 (let (($x163 (not invalidDeref_0)))
 (let (($x161 (and (and (= H_0 emp) (= AH_0 emp)) $x159)))
 (and (and (and $x161 $x163) (=> $x159 (and $x300 $x302))) invalidDeref_1)))))))))))))))))))))))))))))))))))))))))))
(check-sat)
