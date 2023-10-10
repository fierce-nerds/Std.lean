import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.ArgParsersLawsV1_type

namespace FierceNerds.OptParse

open FierceNerds Util

abbrev ArgParsersV1 := Subtype ArgParsersLawsV1

namespace ArgParsersV1

variable {ε : Type u} {α : Type v}
variable [Inhabited α]

def get (s : String) (opts : Opts) : Option Opt := sorry
