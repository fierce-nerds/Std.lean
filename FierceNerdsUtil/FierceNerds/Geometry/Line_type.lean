import FierceNerdsUtil.FierceNerds.Geometry.Point_type

namespace FierceNerds.Geometry

structure Line (Num : Type u) (dims : Nat) where
  start : Point Num dims
  finish : Point Num dims
deriving Repr, Inhabited

namespace Line

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]
variable (c : Line Num dims)
variable (sub : Point Num dims → Point Num dims → Num)
abbrev ThePoint := Point Num dims
abbrev TheSphere := Line Num dims
variable [iLEPoint : LE (Point Num dims)]

def Contains (p : ThePoint) := c.start ≤ p ∧ p ≤ c.finish
