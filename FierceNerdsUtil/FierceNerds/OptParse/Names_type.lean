import FierceNerdsUtil.FierceNerds.Util.Scaffold

namespace FierceNerds.OptParse

open FierceNerds Util

/--
Full names, including "--" or "-"
-/
structure Names where
  long : String
  short : String
deriving Repr, Inhabited

namespace Names
