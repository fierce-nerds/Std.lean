import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.MergeV1_type
import FierceNerdsUtil.FierceNerds.OptParse.ParseV1_type
import FierceNerdsUtil.FierceNerds.OptParse.Names_type

namespace FierceNerds.OptParse

open FierceNerds Util

structure ArgParserV1 where
  {ε : Type u}
  {α : Type v}
  [iInhabitedA : Inhabited α]
  names : Names
  parse? : Option $ ParseV1 ε α := none
  merge? : Option $ MergeV1 ε α := none -- called if the user provides the same option two times (e.g. -v -v)
-- deriving Repr, Inhabited

namespace ArgParserV1
