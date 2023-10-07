namespace FierceNerds.Util

abbrev Pos := Subtype fun n : Nat => n ≠ 0

namespace Pos

instance (n : Nat) : OfNat Pos (Nat.succ n) := ⟨⟨Nat.succ n, Nat.succ_ne_zero n⟩⟩
