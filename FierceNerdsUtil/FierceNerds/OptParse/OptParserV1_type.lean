import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.Names_type
import FierceNerdsUtil.FierceNerds.OptParse.ParseV1_type
import FierceNerdsUtil.FierceNerds.OptParse.MergeV1_type
import FierceNerdsUtil.FierceNerds.OptParse.Parse_instance
import FierceNerdsUtil.FierceNerds.OptParse.Merge_instance

namespace FierceNerds.OptParse

open FierceNerds Util

universe u v w

structure OptParserV1 where
  {ε : Type u}
  {α : Type v}
  [iInhabitedA : Inhabited α]
  names : Names
  parse? : Option $ ParseV1 ε α := none
  merge? : Option $ MergeV1 ε α := none -- called if the user provides the same option two times (e.g. -v -v)

namespace OptParserV1

variable {ε : Type u} {α : Type v}
variable [Inhabited α]

def mkBool (names : Names) : OptParserV1 := OptParserV1.mk (ε := Unit) (α := Bool) names none none

def mkString (names : Names) : OptParserV1 := OptParserV1.mk (ε := Unit) (α := String) names (.some default) (.some default)
