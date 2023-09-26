import Playbook.Std.Char
import Playbook.Std.Data.List.Util

namespace FierceNerds.Util

namespace String

variable (s : String)

def isAscii := s.data.allSatisfy Char.isAscii
