module Hacl.Spec.BignumQ.Mul.Lemmas_3

open FStar.Mul
open FStar.UInt64
open Hacl.Spec.BignumQ.Eval

#reset-options "--max_fuel 0 --max_ifuel 0 --z3rlimit 5"

private
let u56 = x:t{v x < 0x100000000000000}

private
let lemma_distr_4 x a b c d : Lemma (x * (a + b + c + d) = x * a + x * b + x * c + x * d)
  = ()

val lemma_mod_264:
  x0:u56 -> x1:u56 -> x2:u56 -> x3:u56 -> x4:u56 -> x5:u56 -> x6:u56 -> x7:u56 -> x8:t ->
  Lemma ((v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * v x4
         + p5 * v x5 + p6 * v x6 + p7 * v x7 + p8 * v x8) % pow2 264
         = v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * (v x4 % 0x10000000000))
let lemma_mod_264 x0 x1 x2 x3 x4 x5 x6 x7 x8 =
  assert_norm(pow2 40 = 0x10000000000);
  assert_norm(pow2 16 = 0x10000);
  assert_norm(pow2 72 = 0x1000000000000000000);
  assert_norm(pow2 128 = 0x100000000000000000000000000000000);
  assert_norm(pow2 184 = 0x10000000000000000000000000000000000000000000000);
  assert_norm(pow2 264 = 0x1000000000000000000000000000000000000000000000000000000000000000000);
  lemma_distr_4 0x1000000000000000000000000000000000000000000000000000000000000000000
               (0x10000 * v x5) (0x1000000000000000000 * v x6) (0x100000000000000000000000000000000 * v x7) (0x10000000000000000000000000000000000000000000000 * v x8);
  Math.Lemmas.lemma_mod_plus (v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * v x4) (0x10000 * v x5 + 0x1000000000000000000 * v x6 + 0x100000000000000000000000000000000 * v x7 + 0x10000000000000000000000000000000000000000000000 * v x8) 0x1000000000000000000000000000000000000000000000000000000000000000000;
  assert((v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * v x4
         + p5 * v x5 + p6 * v x6 + p7 * v x7 + p8 * v x8) % pow2 264
         = (v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * v x4) % pow2 264);
  Math.Lemmas.lemma_mod_plus_distr_l (p4 * v x4) (v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3) 0x1000000000000000000000000000000000000000000000000000000000000000000;
  assert_norm(p4 = pow2 224);
  Math.Lemmas.pow2_multiplication_modulo_lemma_2 (v x4) 264 224;
  Math.Lemmas.modulo_lemma (v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * (v x4 % 0x10000000000)) (pow2 264)

val lemma_div_224:
  x0:u56 -> x1:u56 -> x2:u56 -> x3:u56 -> x4:u56 -> x5:u56 -> x6:u56 -> x7:u56 -> x8:t ->
  Lemma ((v x0 + p1 * v x1 + p2 * v x2 + p3 * v x3 + p4 * v x4
         + p5 * v x5 + p6 * v x6 + p7 * v x7 + p8 * v x8) / pow2 224
         = v x4 + p1 * v x5 + p2 * v x6 + p3 * v x7 + p4 * v x8)
let lemma_div_224 x0 x1 x2 x3 x4 x5 x6 x7 x8 =
  assert_norm(pow2 56  = 0x100000000000000);
  assert_norm(pow2 112 = 0x10000000000000000000000000000);
  assert_norm(pow2 168 = 0x1000000000000000000000000000000000000000000);
  assert_norm(pow2 224 = 0x100000000000000000000000000000000000000000000000000000000);
  assert_norm(pow2 280 = 0x10000000000000000000000000000000000000000000000000000000000000000000000);
  assert_norm(pow2 336 = 0x1000000000000000000000000000000000000000000000000000000000000000000000000000000000000);
  assert_norm(pow2 392 = 0x100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000);
  assert_norm(pow2 448 = 0x10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
