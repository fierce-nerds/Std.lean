import FierceNerdsUtil.Interval
import Std.Data.Nat.Basic

namespace FierceNerdsUtil

structure Point where
  interval : Interval Nat
  value : Nat
  valueIsBound : value.BoundBy interval
deriving Repr

instance : BEq Point where
  beq a b := a.interval == b.interval && a.value == b.value

abbrev Points := List Point

def Points.sum : Points → Nat := Nat.sum ∘ List.map Point.value
