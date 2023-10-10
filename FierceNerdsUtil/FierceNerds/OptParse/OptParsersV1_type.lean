import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.OptParsersLawsV1_type

namespace FierceNerds.OptParse

open FierceNerds Util

abbrev OptParsersV1 := Subtype OptParsersLawsV1

namespace OptParsersV1

variable {ε : Type u} {α : Type v}
variable [Inhabited α]

def get (s : String) (opts : OptParsersV1) : Option OptParserV1 := sorry
