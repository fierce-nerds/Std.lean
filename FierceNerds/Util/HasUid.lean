import Playbook.Std.Uid

namespace FierceNerds.Util

class HasUid (α : Type u) where
  uid : α → Uid
