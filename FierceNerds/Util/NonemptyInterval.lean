import Playbook.Std
import Playbook.Generic
import Mathlib.Order.Interval

open Playbook Std Generic

namespace FierceNerds.Util

namespace NonemptyInterval

variable {α : Type u}
variable [LE α]
variable [Sub α]
variable (interval : NonemptyInterval α)

def length := interval.snd - interval.fst
