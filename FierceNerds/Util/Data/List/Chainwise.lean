import Playbook.Std
import Playbook.Generic

open Playbook Std Generic

namespace FierceNerds.Util.Data.List

inductive Chainwise : (R : α → List α → Prop) → (a : α) → (l : List α) → Prop where
  | nil {a : α} : Chainwise R a []
  | cons {a : α} (c : Chainwise R b l) (h : R a (b :: l)) : Chainwise R a (b :: l)

namespace Chainwise
