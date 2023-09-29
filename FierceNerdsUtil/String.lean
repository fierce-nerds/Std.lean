import FierceNerdsUtil.Char
import FierceNerdsUtil.ListFun

namespace FierceNerdsUtil

namespace String

variable (s : String)

def isAscii := s.data.allSatisfy Char.isAscii
