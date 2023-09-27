import FierceNerds.Util
import FierceNerds.Generic
import FierceNerds.Util.Data.List.Chainwise

open FierceNerds Util Generic

namespace FierceNerds.Util.Data.List.Extension

def Chainwise (R : α → List α → Prop) (as bs : List α) :=
  Exists fun a : α =>
    And
      (a :: as = bs)
      (List.Chainwise R a as)

namespace Chainwise
