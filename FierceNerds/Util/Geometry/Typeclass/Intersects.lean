import Std.Data.List.Basic

namespace FierceNerds.Util.Geometry.Typeclass

class Intersects (α : Type u) where
  intersects : α → α → Prop

namespace Intersects

variable {α : Type u}
variable [iIntersects : Intersects α]

def WithoutIntersections (xs : List α) := List.Pairwise (iIntersects.intersects · · → False) xs
