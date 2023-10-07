import FierceNerdsUtil.Data.ListUniqueBy
import FierceNerdsUtil.FierceNerds.Util.Bag_all

namespace FierceNerds.Util

abbrev BagsUnique (Unit : Type u) := Data.ListUniqueBy (@Bag.unit Unit)

namespace BagsUnique
