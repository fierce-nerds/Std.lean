namespace FierceNerds.Util

-- Couldn't find it in [lean4, std4, mathlib4]
structure NonEmptyList (α : Type u) where
  head : α
  tail : List α

instance (α : Type u) : Coe (NonEmptyList α) (List α) where
  coe l := l.head :: l.tail
