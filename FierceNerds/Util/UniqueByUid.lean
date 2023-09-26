import Playbook.Std.Data.List.UniqueBy
import Playbook.Std.HasUid

namespace FierceNerds.Util

def UniqueByUid [i : HasUid α] := Data.List.UniqueBy i.uid
