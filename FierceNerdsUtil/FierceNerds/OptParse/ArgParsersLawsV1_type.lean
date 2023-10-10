import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.ArgParserV1_type

namespace FierceNerds.OptParse

open FierceNerds Util

structure ArgParsersLawsV1 (args : List ArgParserV1) : Prop where
  
-- deriving Repr, Inhabited

namespace ArgParsersLawsV1
