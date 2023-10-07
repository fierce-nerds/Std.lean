import Std.Data.List.Basic

namespace FierceNerds.Util

abbrev PairwiseBy
  {α : Type u}
  {β : Type v}
  (R : β → β → Prop)
  (f : α → β)
  (as : List α)
  : Prop
  := as |>.map f |>.Pairwise R

namespace PairwiseBy

variable {α : Type u} {β : Type v}
variable (R : β → β → Prop)
variable (f : α → β)
variable (as : List α)

theorem empty_list_is_pairwise_by
  : PairwiseBy R f []
  := by
    unfold PairwiseBy
    simp

instance instDecidablePairwiseBy
  [DecidableRel R]
  (f : α → β)
  (l : List α)
  : Decidable (PairwiseBy R f l) :=
    let lf := l.map f
    let i : Decidable (List.Pairwise R lf) := inferInstance
    i
