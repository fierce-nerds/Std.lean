import FierceNerds.Util
import FierceNerds.Generic

open FierceNerds Util Generic

namespace FierceNerds.Util

/--
A natural number n ∈ [1; max-1]
-/
abbrev FinNe0 (max : Nat) := Subtype fun fin : Fin max => fin.val ≠ 0

namespace FinNe0
