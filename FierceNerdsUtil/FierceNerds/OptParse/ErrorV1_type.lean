import FierceNerdsUtil.FierceNerds.Util.Scaffold

namespace FierceNerds.OptParse

open FierceNerds Util

inductive ErrorV1 where
  | unexpectedArgs (args : List String)
deriving Repr, Inhabited

namespace ErrorV1
