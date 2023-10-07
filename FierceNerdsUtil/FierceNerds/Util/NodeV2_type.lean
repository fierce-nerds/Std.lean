namespace FierceNerds.Util

inductive NodeV2 (Data : Type u) where
  | leaf : Data → NodeV2 Data
  | branch : (children : List (NodeV2 Data)) → NodeV2 Data
deriving Repr, Inhabited, BEq

namespace NodeV2

variable (Data : Type u)
variable (node : NodeV2 Data)

def data? : Option Data :=
  match node with
  | leaf data => .some data
  | branch children => .none

def children : Option (List (NodeV2 Data)) :=
  match node with
  | leaf data => .none
  | branch children => .some children

