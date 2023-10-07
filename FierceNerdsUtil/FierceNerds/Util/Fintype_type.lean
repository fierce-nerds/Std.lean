import Std.Data.List.Basic

namespace FierceNerds.Util

/--
A simpler version of Fintype from mathlib
-/
class Fintype (α : Type u) where
  elems : List α
  nodup : List.Nodup elems := by decide -- requires [DecidableEq α]
  complete : (x : α) → x ∈ elems -- := fun x => by cases x <;> simp
deriving Repr, DecidableEq

namespace Fintype
