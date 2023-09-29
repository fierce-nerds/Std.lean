import FierceNerdsUtil.Data.ListUniqueBy
import FierceNerdsUtil.Bag

namespace FierceNerdsUtil

abbrev BagsUnique (Unit : Type u) := Data.ListUniqueBy (@Bag.unit Unit)

namespace BagsUnique
