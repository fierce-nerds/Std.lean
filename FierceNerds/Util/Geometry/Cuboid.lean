import FierceNerds.Util.Geometry.Line
import FierceNerds.Util.Geometry.Typeclass.Intersects

namespace FierceNerds.Util.Geometry

/--
A cuboid is just a line with volume (which can be calculated from the line itself)
-/
abbrev Cuboid := @Line

namespace Cuboid

variable {Num : Type u} {dims : Nat}
variable [LE Num] [LT Num]
variable (c : Cuboid Num dims)
variable [iLEPoint : LE (Point Num dims)]
abbrev ThePoint := Point Num dims
abbrev TheCuboid := Cuboid Num dims

def Contains := @Line.Contains

def Intersects (parent : Cuboid Num dims) (child : Cuboid Num dims) : Prop := sorry

instance iIntersects : Typeclass.Intersects (Cuboid Num dims) := ⟨Intersects⟩
