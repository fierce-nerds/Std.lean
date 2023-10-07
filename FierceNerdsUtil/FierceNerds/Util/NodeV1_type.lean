namespace FierceNerds.Util

inductive NodeV1 (Data : Type u) where
  | mk : (data : Data) → (children : List (NodeV1 Data)) → NodeV1 Data
deriving Repr, Inhabited, BEq

namespace NodeV1

variable (Data : Type u)
variable (nodev1 : NodeV1 Data)

def data := match nodev1 with | mk data children => data

def children := match nodev1 with | mk data children => children
