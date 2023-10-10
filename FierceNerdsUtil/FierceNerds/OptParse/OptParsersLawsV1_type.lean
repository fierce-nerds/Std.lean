import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.OptParserV1_type

namespace FierceNerds.OptParse

open FierceNerds Util

structure OptParsersLawsV1 (opts : List OptParserV1) : Prop where
  -- opts_names_are_unique : sorry
  -- opts_shorthands_are_unique : sorry
-- deriving Repr, Inhabited

namespace OptParsersLawsV1
