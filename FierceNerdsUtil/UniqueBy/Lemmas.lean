import FierceNerdsUtil.UniqueBy
import FierceNerdsUtil.SortedBy

namespace FierceNerdsUtil.UniqueBy

namespace Lemmas

variable {α β}

theorem sorted_ascending_hard__implies__unique_by
  (xs : List α)
  (f : α → β)
  [LT β]
  (h : SortedAscendingHardBy f xs)
  : UniqueBy f xs
  := by admit

theorem sorted_descending_hard__implies__unique_by
  (xs : List α)
  (f : α → β)
  [LT β]
  (h : SortedDescendingHardBy f xs)
  : UniqueBy f xs
  := by admit