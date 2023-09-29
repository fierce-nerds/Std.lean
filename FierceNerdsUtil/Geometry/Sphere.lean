import FierceNerdsUtil.Geometry.Point

namespace FierceNerdsUtil.Geometry

structure Sphere (Num : Type u) (dims : Nat) where
  center : Point Num dims
  radius : Num

namespace Sphere

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]
variable (s : Sphere Num dims)
variable [iHSub : HSub (Point Num dims) (Point Num dims) Num]
abbrev ThePoint := Point Num dims
abbrev TheSphere := Sphere Num dims

def Contains (p : ThePoint) := iHSub.hSub s.center p ≤ s.radius
