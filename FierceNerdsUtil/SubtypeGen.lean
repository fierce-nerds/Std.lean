namespace FierceNerdsUtil

structure SubtypeSort (f : α → Sort u) where
  value : α
  type : f value

namespace SubtypeSort

-- instance [Repr α] (f : α → Sort u) : Repr (SubtypeSort (α := α) f) where
--   reprPrec a n := sorry
