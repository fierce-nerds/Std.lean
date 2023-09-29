import FierceNerdsUtil.Geometry.Cuboid
import FierceNerdsUtil.Geometry.Typeclass.Intersect

open FierceNerdsUtil.Geometry.Typeclass

namespace FierceNerdsUtil.Geometry

namespace Instance

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]

instance : Intersect (Cuboid Num dims) (Cuboid Num dims) where
  intersect a b := sorry
