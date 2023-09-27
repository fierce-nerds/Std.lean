import Std.Data.List.Basic
import FierceNerds.Util.PairwiseBy

namespace FierceNerds.Util

abbrev UniqueBy {α β} := @PairwiseBy α β Ne

namespace UniqueBy

instance instDecidableUniqueBy
  [DecidableEq β]
  (f : α → β)
  (l : List α)
  : Decidable (UniqueBy f l) :=
    let lf := l.map f
    let i : Decidable (PairwiseBy Ne f l) := PairwiseBy.instDecidablePairwiseBy Ne f l
    i

instance (f : α → β) : Inhabited (UniqueBy f []) := ⟨List.Pairwise.nil⟩

section Examples

-- a list with unique numbers is unique
def numbers := [1, 2, 3]
example : UniqueBy id numbers := by decide

-- a list with repeating zeros is not unique
def zeros := [0, 0, 0]
example : ¬UniqueBy id zeros := by decide

def mul2 := (· * 2)
example : UniqueBy mul2 numbers := by decide

def mul0 := (· * 0)
example : ¬UniqueBy mul0 numbers := by decide
