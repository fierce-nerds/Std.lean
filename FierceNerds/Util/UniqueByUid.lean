import FierceNerds.Util.Data.ListUniqueBy
import FierceNerds.Util.HasUid

namespace FierceNerds.Util

def UniqueByUid [i : HasUid α] := Data.ListUniqueBy i.uid
