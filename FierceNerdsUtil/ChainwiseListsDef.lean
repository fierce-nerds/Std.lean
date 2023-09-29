import FierceNerdsUtil.ChainwiseListDef

namespace FierceNerdsUtil

abbrev ChainwiseLists (R : α → List α → Prop) (as bs : List α) := Exists fun a : α => And
  (a :: as = bs)
  (ChainwiseList R a as)
