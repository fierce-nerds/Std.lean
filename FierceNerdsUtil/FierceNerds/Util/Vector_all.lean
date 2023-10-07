import Mathlib.Data.Vector

namespace FierceNerds.Util.Data

namespace Vector

abbrev len_eq_n (n : Nat) (xs : List α) : Prop := xs.length = n

/--
This is different from the regular Vector because it's an abbrev, not def, so it is reducible
-/
abbrev VectorAsSubtype (α : Type u) (n : Nat) := @Subtype (List α) (len_eq_n n)

instance (α : Type u) (n : Nat) [Repr α] : Repr (Vector α n) := inferInstanceAs (Repr (VectorAsSubtype α n))

instance (α : Type u) (n : Nat) [Inhabited α] : Inhabited (Vector α n) := ⟨⟨List.replicate n default, by simp⟩⟩
