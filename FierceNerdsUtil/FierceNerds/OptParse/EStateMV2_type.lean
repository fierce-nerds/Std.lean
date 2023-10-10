import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.StateV2_type

namespace FierceNerds.OptParse

open FierceNerds Util

abbrev EStateMV2 (ε α : Type u) := EStateM ε (StateV2 α) PUnit

namespace EStateMV2
