// generated by SMACK version 1.0.2 for corral
// via /usr/local/bin/sesl ../testcases/printtest/exec.c -ll ../testcases/printtest/exec_IR.ll --bpl ../testcases/printtest/exec.bpl -t --sh-mem-leak --add-line-info -bw 32 --svcomp-property ../../sv-benchmarks/c/properties/valid-memsafety.prp

const main: ref;
axiom (main == $sub.ref(0, 1032));
procedure {:entrypoint} main()
  returns ($r: i32)
{
  var $p0: ref8;
  var $p1: ref32;
$bb0:
  assume {:sourceloc "../testcases/printtest/exec.c", 5, 14} true;
  call {:cexpr "smack:entry:main"} boogie_si_record_ref(main);
  assume {:sourceloc "../testcases/printtest/exec.c", 5, 14} true;
  call $p0 := malloc(4);
  assume {:sourceloc "../testcases/printtest/exec.c", 5, 14} true;
  $p1 := $bitcast.ref.ref($p0);
  assume {:sourceloc "../testcases/printtest/exec.c", 7, 5} true;
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
const llvm.dbg.value: ref;
axiom (llvm.dbg.value == $sub.ref(0, 4128));
procedure  llvm.dbg.value($p0: ref, $p1: ref, $p2: ref);
const __SMACK_static_init: ref;
axiom (__SMACK_static_init == $sub.ref(0, 5160));
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
