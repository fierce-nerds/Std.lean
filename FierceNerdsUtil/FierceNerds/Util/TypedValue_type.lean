import FierceNerdsUtil.FierceNerds.Util.ToSort_class

namespace FierceNerds.Util

structure TypedValue (α : Type u) [CoeSort α (Sort v)] where
  type : α
  value : CoeSort.coe type
