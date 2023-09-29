import FierceNerdsUtil.Data.List.UniqueBy
import FierceNerdsUtil.HasUid

namespace FierceNerdsUtil

abbrev UniqueByUid [i : HasUid α] := Data.List.UniqueBy i.uid
