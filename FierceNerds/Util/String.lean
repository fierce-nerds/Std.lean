import FierceNerds.Util.Char
import FierceNerds.Util.ListFun

namespace FierceNerds.Util

namespace String

variable (s : String)

def isAscii := s.data.allSatisfy Char.isAscii
