import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.Input_type

namespace FierceNerds.OptParse

open FierceNerds Util

structure StateV2 (α : Type v) where
  input : Input
  output : α

namespace StateV2
