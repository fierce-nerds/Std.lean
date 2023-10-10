import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.ParseV1_type

namespace FierceNerds.OptParse.Parse

open FierceNerds Util

variable {ε : Type u} {α : Type v}
variable [Inhabited α]

instance : Inhabited (ParseV1 ε α) := ⟨fun s => .ok default⟩
