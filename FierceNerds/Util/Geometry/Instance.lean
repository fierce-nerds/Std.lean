import FierceNerds.Util.Geometry.Cuboid
import FierceNerds.Util.Geometry.Typeclass.Intersect

open FierceNerds.Util.Geometry.Typeclass

namespace FierceNerds.Util.Geometry

namespace Instance

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]

instance : Intersect (Cuboid Num dims) (Cuboid Num dims) where
  intersect a b := sorry
