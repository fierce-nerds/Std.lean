import FierceNerdsUtil.FierceNerds.Util.HasUid_class
import FierceNerdsUtil.FierceNerds.Util.ListUniqueBy_type

namespace FierceNerds.Util

abbrev UniqueByUid [i : HasUid α] := ListUniqueBy i.uid
