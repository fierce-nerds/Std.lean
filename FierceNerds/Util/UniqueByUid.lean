import FierceNerds.Util.Data.List.UniqueBy
import FierceNerds.Util.HasUid

namespace FierceNerds.Util

abbrev UniqueByUid [i : HasUid α] := Data.List.UniqueBy i.uid
