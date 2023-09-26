import Playbook.Std
import Playbook.Generic
import Playbook.Std.Data.List.Chainwise

open Playbook Std Generic

namespace FierceNerds.Util.Data.List.Extension

def Chainwise (R : α → List α → Prop) (as bs : List α) :=
  Exists fun a : α =>
    And
      (a :: as = bs)
      (List.Chainwise R a as)

namespace Chainwise
