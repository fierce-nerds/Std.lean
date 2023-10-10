import FierceNerdsUtil.FierceNerds.Util.Scaffold

namespace FierceNerds.OptParse

open FierceNerds Util

abbrev ParseV1 (ε : Type u) (α : Type v) := String → Except ε α

namespace ParseV1
