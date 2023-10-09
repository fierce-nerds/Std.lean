import FierceNerdsUtil.FierceNerds.Util.ListUniqueBy_type
import FierceNerdsUtil.FierceNerds.Util.Bag_all

namespace FierceNerds.Util

abbrev BagsUnique (Unit : Type u) := ListUniqueBy (@Bag.unit Unit)

namespace BagsUnique
