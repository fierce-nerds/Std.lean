namespace FierceNerds.Util

structure Pos where
  n : Nat
  n_neq_zero : n ≠ Nat.zero

namespace Pos

instance (n : Nat) : OfNat Pos (Nat.succ n) := ⟨⟨Nat.succ n, Nat.succ_ne_zero n⟩⟩

namespace Example
