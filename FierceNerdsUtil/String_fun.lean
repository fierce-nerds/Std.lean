import FierceNerdsUtil.List_fun_basic
import FierceNerdsUtil.Char_fun

namespace String

variable (s : String)

def isAscii := s.data.allSatisfy Char.isAscii

/--
TODO: Move to lean4 repo (it's a more optimized version)
-/
def singleton' (c : Char) : String :=
  ⟨[c]⟩
