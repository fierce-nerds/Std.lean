import Std.Data.List.Basic
import FierceNerdsUtil.FierceNerds.Util.PairwiseBy_type

namespace FierceNerds.Util

section SortedByDefs

variable {α : Type u} {β : Type v} (f : α → β) (as : List α)

abbrev SortedAscendingSoftBy [LE β] := @PairwiseBy α β LE.le
abbrev SortedAscendingHardBy [LT β] := @PairwiseBy α β LT.lt
abbrev SortedDescendingSoftBy [LE β] := @PairwiseBy α β GE.ge
abbrev SortedDescendingHardBy [LT β] := @PairwiseBy α β GT.gt

end SortedByDefs

namespace SortedBy

section Examples

def numbers := [1, 2, 3]
example : SortedAscendingSoftBy id numbers := by decide
example : SortedAscendingHardBy id numbers := by decide
example : ¬SortedDescendingSoftBy id numbers := by decide
example : ¬SortedDescendingHardBy id numbers := by decide

def numbers_reverse := numbers.reverse
example : ¬SortedAscendingSoftBy id numbers_reverse := by decide
example : ¬SortedAscendingHardBy id numbers_reverse := by decide
example : SortedDescendingSoftBy id numbers_reverse := by decide
example : SortedDescendingHardBy id numbers_reverse := by decide

def mul2 := (· * 2)
example : SortedAscendingSoftBy mul2 numbers := by decide
example : SortedAscendingHardBy mul2 numbers := by decide
example : ¬SortedDescendingSoftBy mul2 numbers := by decide
example : ¬SortedDescendingHardBy mul2 numbers := by decide
