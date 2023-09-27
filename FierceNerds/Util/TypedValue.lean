import FierceNerds.Util.ToSort

namespace FierceNerds.Util

structure TypedValue (α : Type u) [CoeSort α (Sort v)] where
  type : α
  value : CoeSort.coe type
