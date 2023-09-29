import FierceNerdsUtil.ListUniqueByDef
import FierceNerdsUtil.ListUniqueByFun

namespace FierceNerdsUtil.ListUniqueBy

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
