namespace FierceNerds.Util

/--
A natural number n ∈ [1; max-1]
-/
abbrev FinNZ (max : Nat) := Subtype fun fin : Fin max => fin.val ≠ 0
