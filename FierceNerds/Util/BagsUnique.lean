import FierceNerds.Util.Data.ListUniqueBy
import FierceNerds.Util.Bag

namespace FierceNerds.Util

abbrev BagsUnique (Unit : Type u) := Data.ListUniqueBy (@Bag.unit Unit)

namespace BagsUnique
