import Mathlib.Init.Logic

namespace FierceNerdsUtil

class LawfulLE (α : Type u) where
  le : α → α → Prop
  le_is_reflexive : Reflexive le
  le_is_transitive : Transitive le
  le_is_antisymmetric : AntiSymmetric le

namespace LawfulLE

instance : LawfulLE Nat where
  le := Nat.le
  le_is_reflexive := @Nat.le_refl
  le_is_transitive := @Nat.le_trans
  le_is_antisymmetric := @Nat.le_antisymm

instance [i : LawfulLE α] : LE α where
  le := i.le

instance : Repr (LawfulLE α) := ⟨fun value precedence => "(structure does not have any fields of Type u, only fields of Prop)"⟩
