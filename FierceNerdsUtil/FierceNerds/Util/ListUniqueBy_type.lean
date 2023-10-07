import FierceNerdsUtil.FierceNerds.Util.UniqueBy_type

namespace FierceNerds.Util

structure ListUniqueBy {α : Type u} {β : Type v} (f : α → β) where
  list : List α
  isUnique : UniqueBy f list := by decide
deriving Repr
