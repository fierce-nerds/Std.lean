import Std.Data.Rat.Basic
import Mathlib.Init.ZeroOne

namespace FierceNerds.Util

structure Bag (α : Type u) where
  value : Rat
  unit : α
deriving Repr, Inhabited 

namespace Bag

variable (bag : Bag α)

instance [One α] : Zero (Bag α) := ⟨⟨0, 1⟩⟩

instance [One α] : One (Bag α) := ⟨⟨1, 1⟩⟩

abbrev Rate (α : Type u) := Coe α Rat 

def add [Rate α] (a b : Bag α) : Bag α :=
  let a_rate : Rat := a.unit
  let b_rate : Rat := b.unit
  let a_value := a.value
  let b_value := (a_rate / b_rate) * b.value
  let value := a_value + b_value
  let unit := a.unit
  ⟨value, unit⟩

instance [Rate α] : Add (Bag α) := ⟨add⟩

def mulRat (r : Rat) : Bag α := ⟨bag.value * r, bag.unit⟩

instance : HMul (Bag α) Rat (Bag α) := ⟨mulRat⟩
