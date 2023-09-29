import FierceNerdsUtil.Uid

namespace FierceNerdsUtil

class HasUid (α : Type u) where
  uid : α → Uid
