// generated by SMACK version 2.6.3 for corral
// via /usr/local/bin/smack ../svcomp/MemSafety-LinkedLists-C//dll2c_remove_all_reverse.c -ll ../svcomp/MemSafety-LinkedLists-C//dll2c_remove_all_reverse_IR.ll --bpl ../svcomp/MemSafety-LinkedLists-C//dll2c_remove_all_reverse.bpl -t --sh-mem-leak

const reach_error: ref;
axiom (reach_error == $sub.ref(0, 1032));
procedure  reach_error()
{
$bb0:
  return;
}
const myexit: ref;
axiom (myexit == $sub.ref(0, 2064));
procedure  myexit($i0: i32)
{
$bb0:
  call {:cexpr "myexit:arg:s"} boogie_si_record_i32($i0);
  goto $bb1;
$bb1:
  assume true;
  goto $bb1;
}
const llvm.dbg.declare: ref;
axiom (llvm.dbg.declare == $sub.ref(0, 3096));
procedure  llvm.dbg.declare($p0: ref, $p1: ref, $p2: ref);
const llvm.dbg.label: ref;
axiom (llvm.dbg.label == $sub.ref(0, 4128));
procedure  llvm.dbg.label($p0: ref);
const node_create: ref;
axiom (node_create == $sub.ref(0, 5160));
procedure  node_create($i0: i32)
  returns ($r: ref)
{
  var $p1: ref8;
  var $p2: ref;
  var $i3: i1;
  var $p4: ref;
  var $p5: ref;
  var $p6: ref32;
$bb0:
  call {:cexpr "node_create:arg:data"} boogie_si_record_i32($i0);
  call $p1 := malloc(24);
  $p2 := $bitcast.ref.ref($p1);
  $i3 := $eq.ref($0.ref, $p2);
  assume {:branchcond $i3} true;
  goto $bb1, $bb2;
$bb1:
  assume ($i3 == 1);
  call myexit(1);
  goto $bb3;
$bb2:
  assume !(($i3 == 1));
  goto $bb3;
$bb3:
  $p4 := $add.ref($add.ref($p2, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.0 := $store.ref($M.0, $p4, $0.ref);
  $p5 := $add.ref($add.ref($p2, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p5, $0.ref);
  $p6 := $add.ref($add.ref($p2, $mul.ref(0, 24)), $mul.ref(16, 1));
  $M.2 := $store.i32($M.2, $p6, $i0);
  $r := $p2;
  return;
}
const malloc: ref;
axiom (malloc == $sub.ref(0, 6192));
procedure  malloc($i0: i64)
  returns ($r: ref)
{
  call $r := $malloc($i0);
}
const dll_circular_create: ref;
axiom (dll_circular_create == $sub.ref(0, 7224));
procedure  dll_circular_create($i0: i32, $i1: i32)
  returns ($r: ref)
{
  var $p2: ref;
  var $i3: i1;
  var $i5: i32;
  var $p6: ref;
  var $p7: ref;
  var $p8: ref;
  var $i9: i1;
  var $p10: ref;
  var $i11: i32;
  var $i12: i1;
  var $p13: ref;
  var $p4: ref;
  var $p14: ref;
  var $p15: ref;
$bb0:
  call {:cexpr "dll_circular_create:arg:len"} boogie_si_record_i32($i0);
  call {:cexpr "dll_circular_create:arg:data"} boogie_si_record_i32($i1);
  call $p2 := node_create($i1);
  call {:cexpr "dll_circular_create:arg:len"} boogie_si_record_i32($i0);
  $i3 := $sgt.i32($i0, 1);
  $p4 := $p2;
  assume {:branchcond $i3} true;
  goto $bb1, $bb2;
$bb1:
  assume ($i3 == 1);
  $i5, $p6 := $i0, $p2;
  goto $bb4;
$bb2:
  assume !(($i3 == 1));
  goto $bb3;
$bb3:
  $p14 := $add.ref($add.ref($p2, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.0 := $store.ref($M.0, $p14, $p4);
  $p15 := $add.ref($add.ref($p4, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p15, $p2);
  $r := $p4;
  return;
$bb4:
  call $p7 := node_create($i1);
  $p8 := $add.ref($add.ref($p7, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.0 := $store.ref($M.0, $p8, $p6);
  $i9 := $ne.ref($p6, $0.ref);
  assume {:branchcond $i9} true;
  goto $bb5, $bb6;
$bb5:
  assume ($i9 == 1);
  $p10 := $add.ref($add.ref($p6, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p10, $p7);
  goto $bb7;
$bb6:
  assume !(($i9 == 1));
  goto $bb7;
$bb7:
  $i11 := $add.i32($i5, $sub.i32(0, 1));
  call {:cexpr "len"} boogie_si_record_i32($i11);
  $i12 := $sgt.i32($i11, 1);
  $p13 := $p7;
  assume {:branchcond $i12} true;
  goto $bb8, $bb9;
$bb8:
  assume ($i12 == 1);
  $i5, $p6 := $i11, $p7;
  goto $bb4;
$bb9:
  assume !(($i12 == 1));
  $p4 := $p13;
  goto $bb3;
}
const dll_circular_remove_last: ref;
axiom (dll_circular_remove_last == $sub.ref(0, 8256));
procedure  dll_circular_remove_last($p0: ref)
{
  var $p1: ref;
  var $p2: ref;
  var $p3: ref;
  var $p4: ref;
  var $i5: i1;
  var $p6: ref;
  var $p7: ref8;
  var $p8: ref;
  var $p9: ref;
  var $p10: ref8;
  var $p11: ref;
  var $p12: ref;
  var $p13: ref;
  var $p14: ref;
$bb0:
  $p1 := $load.ref($M.3, $p0);
  $p2 := $add.ref($add.ref($p1, $mul.ref(0, 24)), $mul.ref(8, 1));
  $p3 := $load.ref($M.1, $p2);
  $p4 := $load.ref($M.3, $p0);
  $i5 := $eq.ref($p3, $p4);
  assume {:branchcond $i5} true;
  goto $bb1, $bb2;
$bb1:
  assume ($i5 == 1);
  $p6 := $load.ref($M.3, $p0);
  $p7 := $bitcast.ref.ref($p6);
  call free_($p7);
  $M.3 := $store.ref($M.3, $p0, $0.ref);
  goto $bb3;
$bb2:
  assume !(($i5 == 1));
  $p8 := $add.ref($add.ref($p3, $mul.ref(0, 24)), $mul.ref(8, 1));
  $p9 := $load.ref($M.1, $p8);
  $p10 := $bitcast.ref.ref($p3);
  call free_($p10);
  $p11 := $load.ref($M.3, $p0);
  $p12 := $add.ref($add.ref($p11, $mul.ref(0, 24)), $mul.ref(8, 1));
  $M.1 := $store.ref($M.1, $p12, $p9);
  $p13 := $load.ref($M.3, $p0);
  $p14 := $add.ref($add.ref($p9, $mul.ref(0, 24)), $mul.ref(0, 1));
  $M.0 := $store.ref($M.0, $p14, $p13);
  goto $bb3;
$bb3:
  return;
}
const free_: ref;
axiom (free_ == $sub.ref(0, 9288));
procedure  free_($p0: ref)
{
  call $free($p0);
}
const main: ref;
axiom (main == $sub.ref(0, 10320));
procedure {:entrypoint} main()
  returns ($r: i32)
{
  var $p0: ref;
  var $p1: ref;
  var $p2: ref;
  var $i3: i1;
$bb0:
  call {:cexpr "smack:entry:main"} boogie_si_record_ref(main);
  call $p0 := $alloc($mul.ref(8, $zext.i32.i64(1)));
  assume true;
  call $p1 := dll_circular_create(2, 1);
  $M.3 := $store.ref($M.3, $p0, $p1);
  goto $bb1;
$bb1:
  call dll_circular_remove_last($p0);
  goto $bb2;
$bb2:
  call dll_circular_remove_last($p0);
  goto $bb3;
$bb3:
  $p2 := $load.ref($M.3, $p0);
  $i3 := $ne.ref($0.ref, $p2);
  assume {:branchcond $i3} true;
  goto $bb4, $bb6;
$bb4:
  assume ($i3 == 1);
  goto $bb5;
$bb5:
  assume true;
  call reach_error();
  call abort();
  assume false;
$bb6:
  assume !(($i3 == 1));
  $r := 0;
  return;
}
const abort: ref;
axiom (abort == $sub.ref(0, 11352));
procedure  abort();
const llvm.dbg.value: ref;
axiom (llvm.dbg.value == $sub.ref(0, 12384));
procedure  llvm.dbg.value($p0: ref, $p1: ref, $p2: ref);
const __SMACK_static_init: ref;
axiom (__SMACK_static_init == $sub.ref(0, 13416));
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
