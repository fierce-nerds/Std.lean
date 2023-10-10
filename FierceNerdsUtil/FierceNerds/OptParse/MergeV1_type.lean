import FierceNerdsUtil.FierceNerds.Util.Scaffold

namespace FierceNerds.OptParse

open FierceNerds Util

abbrev MergeV1 (ε : Type u) (α : Type v) := α → α → Except ε α

namespace MergeV1
