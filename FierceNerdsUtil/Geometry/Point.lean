import Mathlib.Data.Vector
import FierceNerdsUtil.Data.Vector

namespace FierceNerdsUtil.Geometry

abbrev Point (Num : Type u) (dims : Nat) := Vector Num dims

abbrev Point.Nat2D := Point Nat 2

abbrev Point.Nat3D := Point Nat 3
