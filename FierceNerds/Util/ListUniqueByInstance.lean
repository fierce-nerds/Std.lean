import FierceNerds.Util.ListUniqueByDef
import FierceNerds.Util.ListUniqueByFun

namespace FierceNerds.Util.ListUniqueBy

open FierceNerds Util

variable {α β : Type u} {f : α → β}
variable [iBEqA : BEq α] [iReprListA : Repr (List α)] [iBEqListA : BEq (List α)]
variable [iDecidableEqOfβ : DecidableEq β]
variable (l a b : ListUniqueBy f)

instance iCoeOutList : CoeOut (ListUniqueBy f) (List α) := ⟨ListUniqueBy.list⟩

instance iRepr : Repr (ListUniqueBy f) := ⟨reprPrec⟩

instance iBEq : BEq (ListUniqueBy f) := ⟨beq⟩

instance iInhabited : Inhabited (ListUniqueBy f) := ⟨{
  list := [],
  isUnique := PairwiseBy.empty_list_is_pairwise_by Ne f
}⟩

instance iDecidableEq : DecidableEq (ListUniqueBy f) := fun a b => (sorry : Decidable (Eq a b))

namespace Examples

open FierceNerds.Util.Example.Library

-- a type for a list of books unique by name
abbrev Items := ListUniqueBy Book.name
-- the type of an element of a list is inferred automatically

-- an empty list is a unique list
def empty : Items := {
  list := []
  isUnique := by decide
}

-- a non-empty list where each book's name is unique
def unique : Items := {
  list := [
    ⟨"Around the World in Eighty Days", [⟨"Jules Verne"⟩]⟩,
    ⟨"The Mysterious Island", [⟨"Jules Verne"⟩]⟩
  ]
  isUnique := by decide
}
