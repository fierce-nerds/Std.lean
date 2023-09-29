namespace FierceNerdsUtil

structure SIUnit (α : Type u) where
  value : Nat
  exponent : Int
deriving Repr, Inhabited, BEq, DecidableEq
