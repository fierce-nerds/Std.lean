import Std.Data.Rat
import FierceNerds.Util.Rel

structure FierceNerds.Util.Data.Limited {α : Type u} [LE α] [LT α] (min : α) (max : α) (h : min ≤ max := by decide) where
  value  : α
  valueIsLeMin : value ≥ min := by decide
  valueIsLtMax : value < max := by decide
deriving Repr

namespace FierceNerds.Util.Data.Fin

open FierceNerds.Util.Data

-- instance {α : Type u} [LE α] [LT α] (min : α) (max : α) (h : min ≤ max) : OfScientific (Fin min max h) where
--   ofScientific mantissa exponentSign decimalExponent := 
--     let r := Rat.ofScientific mantissa exponentSign decimalExponent
--     if (valueIsLeMin : value ≥ min) then
--       if (valueIsLtMax : value < max) then
--         { value: }

def example1 : Limited 1 10 := { value := 5 }

def example2 : Limited (α := Rat) 0.5 1.5 (by admit) := { value := 1.0, valueIsLeMin := by admit, valueIsLtMax := by admit }
