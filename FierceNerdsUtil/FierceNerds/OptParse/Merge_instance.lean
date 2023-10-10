import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.MergeV1_type

namespace FierceNerds.OptParse.Merge

open FierceNerds Util

variable {ε : Type u} {α : Type v}
variable [Inhabited α]

def first : MergeV1 ε α := fun a b => .ok a

def last : MergeV1 ε α := fun a b => .ok b

/--
Allow the user to override the previously provided options
-/
instance : Inhabited (MergeV1 ε α) := ⟨last⟩
