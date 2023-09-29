import FierceNerdsUtil.ToSort

namespace FierceNerdsUtil

structure TypedValue (α : Type u) [CoeSort α (Sort v)] where
  type : α
  value : CoeSort.coe type
