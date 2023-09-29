import FierceNerdsUtil.UniqueBy

namespace FierceNerdsUtil

structure ListUniqueBy {α : Type u} {β : Type v} (f : α → β) where
  list : List α
  isUnique : UniqueBy f list := by decide
deriving Repr
