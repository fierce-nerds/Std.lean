import FierceNerdsUtil.ToRat
import Mathlib.Init.ZeroOne

namespace FierceNerdsUtil

class ToRatId (α : Type u) extends (ToRat α), (One α) where
  one_eq_1 : ToRat.toRat one = 1
  
namespace ToRatId
