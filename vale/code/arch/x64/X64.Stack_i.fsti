module X64.Stack_i

open X64.Machine_s

val stack: Type u#1

val valid_src_stack64 : ptr:int -> h:stack -> GTot bool
val valid_dst_stack64 : ptr:int -> h:stack -> GTot bool
val load_stack64 : ptr:int -> h:stack -> GTot nat64
val store_stack64 : ptr:int -> v:nat64 -> h:stack -> GTot stack
