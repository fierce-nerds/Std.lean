import Mathlib.Order.Interval

namespace NonemptyInterval

variable {α : Type u}
variable [LE α]
variable [Sub α]
variable (interval : NonemptyInterval α)

def length := interval.snd - interval.fst
