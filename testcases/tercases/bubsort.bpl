// generated by SMACK version 2.6.3 for corral
// via /usr/local/bin/smack ../testcases/tercases/bubsort.c -ll ../testcases/tercases/bubsort_IR.ll --bpl ../testcases/tercases/bubsort.bpl -t

const main: ref;
axiom (main == $sub.ref(0, 1032));
procedure {:entrypoint} main()
  returns ($r: i32)
{
  var $i0: i32;
  var $i1: i1;
  var $i2: i32;
  var $i3: i1;
  var $i4: i32;
  var $i5: i32;
$bb0:
  SymbHeap(true|emp)
  call {:cexpr "smack:entry:main"} boogie_si_record_ref(main);
  SymbHeap(true|emp)
  $i0 := 5;
  goto $bb1;
$bb1:
  SymbHeap(true|emp)
  SymbHeap(true|emp)
  $i1 := $sgt.i32($i0, 0);
  assume {:branchcond $i1} true;
  goto $bb2, $bb3;
$bb2:
  assume ($i1 == 1);
  SymbHeap(true|emp)
  SymbHeap(true|emp)
  $i2 := 1;
  goto $bb4;
$bb3:
  assume !(($i1 == 1));
  SymbHeap(true|emp)
  $r := 0;
  return;
$bb4:
  SymbHeap(true|emp)
  SymbHeap(true|emp)
  $i3 := $slt.i32($i2, $i0);
  assume {:branchcond $i3} true;
  goto $bb5, $bb6;
$bb5:
  assume ($i3 == 1);
  SymbHeap(true|emp)
  $i4 := $add.i32($i2, 1);
  SymbHeap(true|emp)
  call {:cexpr "j"} boogie_si_record_i32($i4);
  $i2 := $i4;
  goto $bb4;
$bb6:
  assume !(($i3 == 1));
  SymbHeap(true|emp)
  $i5 := $add.i32($i0, $sub.i32(0, 1));
  SymbHeap(true|emp)
  call {:cexpr "i"} boogie_si_record_i32($i5);
  $i0 := $i5;
  goto $bb1;
}
const llvm.dbg.declare: ref;
axiom (llvm.dbg.declare == $sub.ref(0, 2064));
procedure  llvm.dbg.declare($p0: ref, $p1: ref, $p2: ref);
const llvm.dbg.value: ref;
axiom (llvm.dbg.value == $sub.ref(0, 3096));
procedure  llvm.dbg.value($p0: ref, $p1: ref, $p2: ref);
const __SMACK_static_init: ref;
axiom (__SMACK_static_init == $sub.ref(0, 4128));
procedure  __SMACK_static_init()
{
$bb0:
  SymbHeap(true|emp)
  return;
}
procedure  boogie_si_record_i32(x: i32);
procedure  boogie_si_record_ref(x: ref);
procedure  $initialize()
{
  call __SMACK_static_init();
  return;
}
