import Std.Data.Rat.Basic
import FierceNerdsUtil.ListFun

namespace FierceNerdsUtil

class Projections (Target : Type u) (α : Type v) where
  list : List (α → Target)
  list_is_complete : (a b : α) → (list.apply a = list.apply b) ↔ a = b

namespace Projections
