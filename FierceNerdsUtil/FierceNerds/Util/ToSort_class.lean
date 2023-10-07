namespace FierceNerds.Util

/--
- This is different from CoeSort
-/
class ToSort (α : Sort u) where
  toSort : α → Sort u
