// generated by SMACK version 2.6.3 for corral
// via /usr/local/bin/smack ../svcomp/MemSafety-LinkedLists-C//sll-buckets-2.c -ll ../svcomp/MemSafety-LinkedLists-C//sll-buckets-2_IR.ll --bpl ../svcomp/MemSafety-LinkedLists-C//sll-buckets-2.bpl -t --sh-mem-leak

const reach_error: ref;
axiom (reach_error == $sub.ref(0, 1032));
procedure  reach_error()
{
$bb0:
  return;
}
const main: ref;
axiom (main == $sub.ref(0, 2064));
procedure {:entrypoint} main()
  returns ($r: i32)
{
  var $p0: ref8;
  var $p1: ref;
  var $p2: ref32;
  var $p3: ref;
  var $p4: ref8;
  var $p5: ref;
  var $p6: ref;
  var $p7: ref;
  var $p8: ref;
  var $p9: ref32;
  var $p10: ref;
  var $p11: ref8;
  var $p12: ref;
  var $p13: ref;
  var $p14: ref;
  var $p15: ref;
  var $p16: ref32;
  var $p17: ref;
  var $p18: ref;
  var $i19: i32;
  var $i20: i1;
  var $p21: ref8;
  var $p22: ref;
  var $p23: ref;
  var $i24: i32;
  var $i25: i1;
  var $p26: ref32;
  var $i27: i32;
  var $i28: i1;
  var $p29: ref32;
  var $p30: ref32;
  var $i31: i1;
  var $i32: i1;
  var $p33: ref32;
  var $i34: i32;
  var $p35: ref32;
  var $i36: i32;
  var $i37: i1;
  var $p39: ref;
  var $p40: ref;
  var $p41: ref;
  var $p42: ref32;
  var $i43: i32;
  var $i44: i32;
  var $i45: i1;
  var $p46: ref;
  var $p38: ref;
  var $i47: i1;
  var $p48: ref;
  var $p49: ref;
  var $i50: i1;
  var $p51: ref;
  var $p52: ref;
  var $p53: ref;
  var $p54: ref;
  var $p55: ref;
  var $i56: i1;
  var $p58: ref;
  var $p59: ref;
  var $p60: ref;
  var $p61: ref;
  var $p62: ref;
  var $i63: i1;
  var $p64: ref;
  var $p57: ref;
  var $p65: ref;
  var $i66: i32;
  var $i67: i1;
  var $i68: i1;
  var $p69: ref;
  var $p70: ref;
  var $p71: ref;
  var $p72: ref;
  var $i73: i1;
  var $p75: ref;
  var $p76: ref;
  var $p77: ref;
  var $p78: ref32;
  var $i79: i32;
  var $p80: ref32;
  var $i81: i32;
  var $i82: i1;
  var $p83: ref8;
  var $i84: i1;
  var $p85: ref;
  var $p74: ref;
  var $i86: i1;
  var $p87: ref;
  var $p88: ref;
  var $p89: ref8;
  var $i90: i1;
$bb0:
  call {:cexpr "smack:entry:main"} boogie_si_record_ref(main);
  call $p0 := malloc(24);
  $p1 := $bitcast.ref.ref($p0);
  $p2 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(16, 1));
  $M.0 := $store.i32($M.0, $p2, 0);
  $p3 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p3, $0.ref);
  call $p4 := malloc(24);
  $p5 := $bitcast.ref.ref($p4);
  $p6 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.2 := $store.ref($M.2, $p6, $p4);
  $p7 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(0, 1));
  $p8 := $load.ref($M.2, $p7);
  $p9 := $add.ref($add.ref($p8, $mul.ref(0, 24)), $mul.ref(16, 1));
  $M.0 := $store.i32($M.0, $p9, 1);
  $p10 := $add.ref($add.ref($p8, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p10, $0.ref);
  call $p11 := malloc(24);
  $p12 := $bitcast.ref.ref($p11);
  $p13 := $add.ref($add.ref($p8, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.2 := $store.ref($M.2, $p13, $p11);
  $p14 := $add.ref($add.ref($p8, $mul.ref(0, 24)), $mul.ref(0, 1));
  $p15 := $load.ref($M.2, $p14);
  $p16 := $add.ref($add.ref($p15, $mul.ref(0, 24)), $mul.ref(16, 1));
  $M.0 := $store.i32($M.0, $p16, 2);
  $p17 := $add.ref($add.ref($p15, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p17, $0.ref);
  $p18 := $add.ref($add.ref($p15, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.2 := $store.ref($M.2, $p18, $0.ref);
  call $i19 := __VERIFIER_nondet_int();
  call {:cexpr "smack:ext:__VERIFIER_nondet_int"} boogie_si_record_i32($i19);
  $i20 := $ne.i32($i19, 0);
  assume {:branchcond $i20} true;
  goto $bb1, $bb2;
$bb1:
  assume ($i20 == 1);
  goto $bb4;
$bb2:
  assume !(($i20 == 1));
  goto $bb3;
$bb3:
  $i68 := $ne.ref($p1, $0.ref);
  assume {:branchcond $i68} true;
  goto $bb40, $bb41;
$bb4:
  call $p21 := malloc(16);
  $p22 := $bitcast.ref.ref($p21);
  $p23 := $add.ref($add.ref($p22, $mul.ref(0, 16)), $mul.ref(0, 1));
  $M.3 := $store.ref($M.3, $p23, $0.ref);
  call $i24 := __VERIFIER_nondet_int();
  call {:cexpr "smack:ext:__VERIFIER_nondet_int"} boogie_si_record_i32($i24);
  $i25 := $ne.i32($i24, 0);
  assume {:branchcond $i25} true;
  goto $bb5, $bb6;
$bb5:
  assume ($i25 == 1);
  $p26 := $add.ref($add.ref($p22, $mul.ref(0, 16)), $mul.ref(8, 1));
  $M.4 := $store.i32($M.4, $p26, 0);
  goto $bb7;
$bb6:
  assume !(($i25 == 1));
  call $i27 := __VERIFIER_nondet_int();
  call {:cexpr "smack:ext:__VERIFIER_nondet_int"} boogie_si_record_i32($i27);
  $i28 := $ne.i32($i27, 0);
  assume {:branchcond $i28} true;
  goto $bb8, $bb9;
$bb7:
  goto $bb11;
$bb8:
  assume ($i28 == 1);
  $p29 := $add.ref($add.ref($p22, $mul.ref(0, 16)), $mul.ref(8, 1));
  $M.4 := $store.i32($M.4, $p29, 1);
  goto $bb10;
$bb9:
  assume !(($i28 == 1));
  $p30 := $add.ref($add.ref($p22, $mul.ref(0, 16)), $mul.ref(8, 1));
  $M.4 := $store.i32($M.4, $p30, 2);
  goto $bb10;
$bb10:
  goto $bb7;
$bb11:
  $i31 := $ne.ref($p1, $0.ref);
  assume {:branchcond $i31} true;
  goto $bb12, $bb13;
$bb12:
  assume ($i31 == 1);
  goto $bb14;
$bb13:
  assume !(($i31 == 1));
  call reach_error();
  call abort();
  assume false;
$bb14:
  goto $bb15;
$bb15:
  $i32 := $ne.ref($p22, $0.ref);
  assume {:branchcond $i32} true;
  goto $bb16, $bb17;
$bb16:
  assume ($i32 == 1);
  goto $bb18;
$bb17:
  assume !(($i32 == 1));
  call reach_error();
  call abort();
  assume false;
$bb18:
  $p33 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(16, 1));
  $i34 := $load.i32($M.0, $p33);
  $p35 := $add.ref($add.ref($p22, $mul.ref(0, 16)), $mul.ref(8, 1));
  $i36 := $load.i32($M.4, $p35);
  $i37 := $ne.i32($i34, $i36);
  $p38 := $p0;
  assume {:branchcond $i37} true;
  goto $bb19, $bb20;
$bb19:
  assume ($i37 == 1);
  $p39 := $p0;
  goto $bb22;
$bb20:
  assume !(($i37 == 1));
  goto $bb21;
$bb21:
  goto $bb25;
$bb22:
  $p40 := $add.ref($add.ref($p39, $mul.ref(0, 24)), $mul.ref(0, 1));
  $p41 := $load.ref($M.2, $p40);
  $p42 := $add.ref($add.ref($p41, $mul.ref(0, 24)), $mul.ref(16, 1));
  $i43 := $load.i32($M.0, $p42);
  $i44 := $load.i32($M.4, $p35);
  $i45 := $ne.i32($i43, $i44);
  $p46 := $p41;
  assume {:branchcond $i45} true;
  goto $bb23, $bb24;
$bb23:
  assume ($i45 == 1);
  $p39 := $p41;
  goto $bb22;
$bb24:
  assume !(($i45 == 1));
  $p38 := $p46;
  goto $bb21;
$bb25:
  $i47 := $ne.ref($p38, $0.ref);
  assume {:branchcond $i47} true;
  goto $bb26, $bb27;
$bb26:
  assume ($i47 == 1);
  goto $bb28;
$bb27:
  assume !(($i47 == 1));
  call reach_error();
  call abort();
  assume false;
$bb28:
  $p48 := $add.ref($add.ref($p38, $mul.ref(0, 24)), $mul.ref(8, 1));
  $p49 := $load.ref($M.1, $p48);
  $i50 := $eq.ref($p49, $0.ref);
  assume {:branchcond $i50} true;
  goto $bb29, $bb30;
$bb29:
  assume ($i50 == 1);
  $p51 := $add.ref($add.ref($p38, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p51, $p21);
  goto $bb31;
$bb30:
  assume !(($i50 == 1));
  $p52 := $add.ref($add.ref($p38, $mul.ref(0, 24)), $mul.ref(8, 1));
  $p53 := $load.ref($M.1, $p52);
  $p54 := $add.ref($add.ref($p53, $mul.ref(0, 16)), $mul.ref(0, 1));
  $p55 := $load.ref($M.3, $p54);
  $i56 := $ne.ref($p55, $0.ref);
  $p57 := $p53;
  assume {:branchcond $i56} true;
  goto $bb32, $bb33;
$bb31:
  call $i66 := __VERIFIER_nondet_int();
  call {:cexpr "smack:ext:__VERIFIER_nondet_int"} boogie_si_record_i32($i66);
  $i67 := $ne.i32($i66, 0);
  assume {:branchcond $i67} true;
  goto $bb38, $bb39;
$bb32:
  assume ($i56 == 1);
  $p58 := $p53;
  goto $bb35;
$bb33:
  assume !(($i56 == 1));
  goto $bb34;
$bb34:
  $p65 := $add.ref($add.ref($p57, $mul.ref(0, 16)), $mul.ref(0, 1));
  $M.3 := $store.ref($M.3, $p65, $p21);
  goto $bb31;
$bb35:
  $p59 := $add.ref($add.ref($p58, $mul.ref(0, 16)), $mul.ref(0, 1));
  $p60 := $load.ref($M.3, $p59);
  $p61 := $add.ref($add.ref($p60, $mul.ref(0, 16)), $mul.ref(0, 1));
  $p62 := $load.ref($M.3, $p61);
  $i63 := $ne.ref($p62, $0.ref);
  $p64 := $p60;
  assume {:branchcond $i63} true;
  goto $bb36, $bb37;
$bb36:
  assume ($i63 == 1);
  $p58 := $p60;
  goto $bb35;
$bb37:
  assume !(($i63 == 1));
  $p57 := $p64;
  goto $bb34;
$bb38:
  assume ($i67 == 1);
  goto $bb4;
$bb39:
  assume !(($i67 == 1));
  goto $bb3;
$bb40:
  assume ($i68 == 1);
  $p69 := $p0;
  goto $bb43;
$bb41:
  assume !(($i68 == 1));
  goto $bb42;
$bb42:
  $r := 0;
  return;
$bb43:
  $p70 := $add.ref($add.ref($p69, $mul.ref(0, 24)), $mul.ref(8, 1));
  $p71 := $load.ref($M.1, $p70);
  $p72 := $add.ref($add.ref($p69, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p72, $0.ref);
  $i73 := $ne.ref($p71, $0.ref);
  $p74 := $p71;
  assume {:branchcond $i73} true;
  goto $bb44, $bb45;
$bb44:
  assume ($i73 == 1);
  $p75 := $p71;
  goto $bb47;
$bb45:
  assume !(($i73 == 1));
  goto $bb46;
$bb46:
  goto $bb54;
$bb47:
  $p76 := $add.ref($add.ref($p75, $mul.ref(0, 16)), $mul.ref(0, 1));
  $p77 := $load.ref($M.3, $p76);
  goto $bb48;
$bb48:
  $p78 := $add.ref($add.ref($p75, $mul.ref(0, 16)), $mul.ref(8, 1));
  $i79 := $load.i32($M.4, $p78);
  $p80 := $add.ref($add.ref($p69, $mul.ref(0, 24)), $mul.ref(16, 1));
  $i81 := $load.i32($M.0, $p80);
  $i82 := $ne.i32($i79, $i81);
  assume {:branchcond $i82} true;
  goto $bb49, $bb50;
$bb49:
  assume ($i82 == 1);
  goto $bb51;
$bb50:
  assume !(($i82 == 1));
  call reach_error();
  call abort();
  assume false;
$bb51:
  $p83 := $bitcast.ref.ref($p75);
  call free_($p83);
  $i84 := $ne.ref($p77, $0.ref);
  $p85 := $p77;
  assume {:branchcond $i84} true;
  goto $bb52, $bb53;
$bb52:
  assume ($i84 == 1);
  $p75 := $p77;
  goto $bb47;
$bb53:
  assume !(($i84 == 1));
  $p74 := $p85;
  goto $bb46;
$bb54:
  $i86 := $eq.ref($p74, $0.ref);
  assume {:branchcond $i86} true;
  goto $bb55, $bb56;
$bb55:
  assume ($i86 == 1);
  goto $bb57;
$bb56:
  assume !(($i86 == 1));
  call reach_error();
  call abort();
  assume false;
$bb57:
  $p87 := $add.ref($add.ref($p69, $mul.ref(0, 24)), $mul.ref(0, 1));
  $p88 := $load.ref($M.2, $p87);
  $p89 := $bitcast.ref.ref($p69);
  call free_($p89);
  $i90 := $ne.ref($p88, $0.ref);
  assume {:branchcond $i90} true;
  goto $bb58, $bb59;
$bb58:
  assume ($i90 == 1);
  $p69 := $p88;
  goto $bb43;
$bb59:
  assume !(($i90 == 1));
  goto $bb42;
}
const llvm.dbg.declare: ref;
axiom (llvm.dbg.declare == $sub.ref(0, 3096));
procedure  llvm.dbg.declare($p0: ref, $p1: ref, $p2: ref);
const malloc: ref;
axiom (malloc == $sub.ref(0, 4128));
procedure  malloc($i0: i64)
  returns ($r: ref)
{
  call $r := $malloc($i0);
}
const __VERIFIER_nondet_int: ref;
axiom (__VERIFIER_nondet_int == $sub.ref(0, 5160));
procedure  __VERIFIER_nondet_int()
  returns ($r: i32);
const abort: ref;
axiom (abort == $sub.ref(0, 6192));
procedure  abort();
const free_: ref;
axiom (free_ == $sub.ref(0, 7224));
procedure  free_($p0: ref)
{
  call $free($p0);
}
const llvm.dbg.value: ref;
axiom (llvm.dbg.value == $sub.ref(0, 8256));
procedure  llvm.dbg.value($p0: ref, $p1: ref, $p2: ref);
const __SMACK_static_init: ref;
axiom (__SMACK_static_init == $sub.ref(0, 9288));
procedure  __SMACK_static_init()
{
$bb0:
  return;
}
procedure  boogie_si_record_i32(x: i32);
procedure  boogie_si_record_ref(x: ref);
procedure  $initialize()
{
  call __SMACK_static_init();
  return;
}
