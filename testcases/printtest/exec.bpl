// generated by SMACK version 2.6.3 for corral
// via /usr/local/bin/smack ../testcases/printtest/exec.c -ll ../testcases/printtest/exec_IR.ll --bpl ../testcases/printtest/exec.bpl -t --sh-mem-leak

const main: ref;
axiom (main == $sub.ref(0, 1032));
procedure {:entrypoint} main()
  returns ($r: i32)
{
  var $p0: ref8;
  var $p1: ref32;
  var $i2: i32;
  var $i3: i1;
  var $p4: ref8;
$bb0:
  call {:cexpr "smack:entry:main"} boogie_si_record_ref(main);
  call $p0 := malloc(4);
  $p1 := $bitcast.ref.ref($p0);
  $M.0 := $store.i32($M.0, $p1, 9);
  $M.0 := $store.i32($M.0, $p1, 10);
  $M.0 := $store.i32($M.0, $p1, 11);
  $M.0 := $store.i32($M.0, $p1, 12);
  $i2 := $load.i32($M.0, $p1);
  $i3 := $sgt.i32($i2, 10);
  assume {:branchcond $i3} true;
  goto $bb1, $bb2;
$bb1:
  assume ($i3 == 1);
  $p4 := $bitcast.ref.ref($p1);
  call free_($p4);
  goto $bb3;
$bb2:
  assume !(($i3 == 1));
  goto $bb3;
$bb3:
  $r := 0;
  return;
}
const llvm.dbg.declare: ref;
axiom (llvm.dbg.declare == $sub.ref(0, 2064));
procedure  llvm.dbg.declare($p0: ref, $p1: ref, $p2: ref);
const malloc: ref;
axiom (malloc == $sub.ref(0, 3096));
procedure  malloc($i0: i64)
  returns ($r: ref)
{
  call $r := $malloc($i0);
}
const free_: ref;
axiom (free_ == $sub.ref(0, 4128));
procedure  free_($p0: ref)
{
  call $free($p0);
}
const llvm.dbg.value: ref;
axiom (llvm.dbg.value == $sub.ref(0, 5160));
procedure  llvm.dbg.value($p0: ref, $p1: ref, $p2: ref);
const __SMACK_static_init: ref;
axiom (__SMACK_static_init == $sub.ref(0, 6192));
procedure  __SMACK_static_init()
{
$bb0:
  return;
}
procedure  boogie_si_record_ref(x: ref);
procedure  $initialize()
{
  call __SMACK_static_init();
  return;
}
