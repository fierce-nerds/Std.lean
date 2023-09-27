namespace FierceNerds.Util

/--
This definition is different from List.Chain (index R is different)
-/
inductive ChainwiseList : (R : α → List α → Prop) → (a : α) → (l : List α) → Prop where
  | nil {a : α} : ChainwiseList R a []
  | cons {a : α} (c : ChainwiseList R b l) (h : R a (b :: l)) : ChainwiseList R a (b :: l)
