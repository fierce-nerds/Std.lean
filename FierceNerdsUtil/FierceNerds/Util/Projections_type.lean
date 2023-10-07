import Std.Data.Rat.Basic
import FierceNerdsUtil.List_fun_basic

namespace FierceNerds.Util

class Projections (Target : Type u) (α : Type v) where
  list : List (α → Target)
  list_is_complete : (a b : α) → (list.apply a = list.apply b) ↔ a = b

namespace Projections
