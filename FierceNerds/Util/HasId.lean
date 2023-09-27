import FierceNerds.Util.Id

namespace FierceNerds.Util

class HasId (α : Type u) where
  id : α → Id

namespace HasId
