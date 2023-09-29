namespace FierceNerdsUtil.Data

structure Position2D (α : Type u) where
  x : α
  y : α
deriving Repr, BEq
