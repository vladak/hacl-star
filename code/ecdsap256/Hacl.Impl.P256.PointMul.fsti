module Hacl.Impl.P256.PointMul

open FStar.Mul
open FStar.HyperStack.All
open FStar.HyperStack
module ST = FStar.HyperStack.ST

open Lib.IntTypes
open Lib.Buffer

open Hacl.Spec.P256.MontgomeryMultiplication
open Hacl.Spec.P256.Felem
open Hacl.Impl.P256.Point

module S = Spec.P256

#set-options "--z3rlimit 30 --fuel 0 --ifuel 0"

val scalarMultiplication:
    #buf_type:buftype
  -> p:point
  -> result:point
  -> scalar:lbuffer_t buf_type uint8 (size 32)
  -> tempBuffer:lbuffer uint64 (size 100) ->
  Stack unit
  (requires fun h ->
    live h p /\ live h result /\ live h scalar /\ live h tempBuffer /\
    LowStar.Monotonic.Buffer.all_disjoint [loc p; loc tempBuffer; loc scalar; loc result] /\
    as_nat h (gsub p (size 0) (size 4)) < S.prime /\
    as_nat h (gsub p (size 4) (size 4)) < S.prime /\
    as_nat h (gsub p (size 8) (size 4)) < S.prime)
  (ensures fun h0 _ h1 ->
    modifies (loc p |+| loc result |+| loc tempBuffer) h0 h1 /\
    as_nat h1 (gsub result (size 0) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 4) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 8) (size 4)) < S.prime /\
    (let x3, y3, z3 = point_x_as_nat h1 result, point_y_as_nat h1 result, point_z_as_nat h1 result in
    let (xN, yN, zN) = S.scalar_multiplication (as_seq h0 scalar) (as_point_nat (as_seq h0 p)) in
    x3 == xN /\ y3 == yN /\ z3 == zN))


val scalarMultiplicationWithoutNorm:
    p:point
  -> result:point
  -> scalar:lbuffer uint8 (size 32)
  -> tempBuffer: lbuffer uint64 (size 100) ->
  Stack unit
  (requires fun h ->
    live h p /\ live h result /\ live h scalar /\ live h tempBuffer /\
    LowStar.Monotonic.Buffer.all_disjoint [loc p; loc tempBuffer; loc scalar; loc result] /\
    as_nat h (gsub p (size 0) (size 4)) < S.prime /\
    as_nat h (gsub p (size 4) (size 4)) < S.prime /\
    as_nat h (gsub p (size 8) (size 4)) < S.prime)
  (ensures fun h0 _ h1 ->
    modifies (loc p |+| loc result |+| loc tempBuffer) h0 h1 /\
    as_nat h1 (gsub result (size 0) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 4) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 8) (size 4)) < S.prime /\
    (let p1 = fromDomainPoint(as_point_nat (as_seq h1 result)) in
    let rN, _ = S.montgomery_ladder_spec (as_seq h0 scalar) ((0, 0, 0),  as_point_nat (as_seq h0 p)) in
    rN == p1))


val secretToPublic:
    result:point
  -> scalar:lbuffer uint8 (size 32)
  -> tempBuffer:lbuffer uint64 (size 100) ->
  Stack unit
  (requires fun h ->
    live h result /\ live h scalar /\ live h tempBuffer /\
    LowStar.Monotonic.Buffer.all_disjoint [loc tempBuffer; loc scalar; loc result])
  (ensures fun h0 _ h1 ->
    modifies (loc result |+| loc tempBuffer) h0 h1 /\
    as_nat h1 (gsub result (size 0) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 4) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 8) (size 4)) < S.prime /\
    (let x3, y3, z3 = point_x_as_nat h1 result, point_y_as_nat h1 result, point_z_as_nat h1 result in
    let (xN, yN, zN) = S.secret_to_public (as_seq h0 scalar)  in
    x3 == xN /\ y3 == yN /\ z3 == zN))


val secretToPublicWithoutNorm:
    result:point
  -> scalar:lbuffer uint8 (size 32)
  -> tempBuffer:lbuffer uint64 (size 100) ->
  Stack unit
  (requires fun h ->
    live h result /\ live h scalar /\ live h tempBuffer /\
    LowStar.Monotonic.Buffer.all_disjoint [loc tempBuffer; loc scalar; loc result])
  (ensures fun h0 _ h1 -> modifies (loc result |+| loc tempBuffer) h0 h1 /\
    as_nat h1 (gsub result (size 0) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 4) (size 4)) < S.prime /\
    as_nat h1 (gsub result (size 8) (size 4)) < S.prime /\
    (let p1 = fromDomainPoint(as_point_nat (as_seq h1 result)) in
    let rN, _ = S.montgomery_ladder_spec (as_seq h0 scalar) ((0, 0, 0), S.base_point) in
    rN == p1))
