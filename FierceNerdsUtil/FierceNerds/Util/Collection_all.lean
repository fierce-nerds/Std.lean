import FierceNerdsUtil.FierceNerds.Util.ListPredWithEmptyPass_type
import FierceNerdsUtil.List_fun_basic

namespace FierceNerds.Util

variable (α : Type u)
variable (elementPredicates : List (Pred α) := []) 
variable (listPredicates : List (ListPredWithEmptyPass α) := [])

structure Collection.Valid (xs : List α) : Prop where
  xs_all_satisfy_all_predicates : List.allSatisfyAll elementPredicates xs
  xs_all_satisfied : List.allSatisfied xs listPredicates 

abbrev Collection := Subtype (Collection.Valid α elementPredicates listPredicates)

namespace Collection

instance : Inhabited (Collection α elementPredicates listPredicates) := ⟨[], by 
  apply Collection.Valid.mk
  with_unfolding_all simp_all!
  simp_all [List.allSatisfyAll, List.toAnd]
  unfold List.allSatisfied
  unfold List.toAnd
  unfold List.foldr
  simp_all
  induction listPredicates
  simp_all
  rename_i head tail tail_ih
  induction head
  unfold Lean.Internal.coeM
  unfold List.map
  simp_all
  unfold CoeT.coe
  unfold instCoeT
  unfold CoeHTCT.coe instCoeHTCT_1
  unfold CoeHTC.coe instCoeHTC_1
  unfold CoeOTC.coe instCoeOTC
  simp_all
  rename_i val property
  simp_all
  admit
  done⟩

-- instance [Repr α] : Repr (Collection α elementPredicates listPredicates) where
--   reprPrec a n := reprPrec a.val n
