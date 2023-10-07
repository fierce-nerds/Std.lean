import FierceNerdsUtil.FierceNerds.Util.ChainwiseList_type

namespace FierceNerds.Util

abbrev ChainwiseLists (R : α → List α → Prop) (as bs : List α) := Exists fun a : α => And
  (a :: as = bs)
  (ChainwiseList R a as)
