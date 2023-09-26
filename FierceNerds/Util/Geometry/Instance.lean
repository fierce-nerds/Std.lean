import Playbook.Std.Geometry.Cuboid
import Playbook.Std.Geometry.Typeclass.Intersect

open Playbook.Std.Geometry.Typeclass

namespace FierceNerds.Util.Geometry

namespace Instance

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]

instance : Intersect (Cuboid Num dims) (Cuboid Num dims) where
  intersect a b := sorry
