import Playbook.Std.Data.List.UniqueBy
import Playbook.Std.Bag

namespace FierceNerds.Util

abbrev BagsUnique (Unit : Type u) := Data.List.UniqueBy (@Bag.unit Unit)

namespace BagsUnique
