import Playbook.Std.ToRat
import Mathlib.Init.ZeroOne

namespace FierceNerds.Util

class ToRatId (α : Type u) extends (ToRat α), (One α) where
  one_eq_1 : ToRat.toRat one = 1
  
namespace ToRatId
