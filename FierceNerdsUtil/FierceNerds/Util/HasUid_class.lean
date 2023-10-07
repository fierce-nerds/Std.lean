import FierceNerdsUtil.FierceNerds.Util.Uid_type

namespace FierceNerds.Util

class HasUid (α : Type u) where
  uid : α → Uid
