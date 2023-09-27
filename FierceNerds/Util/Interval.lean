import FierceNerds.Util.LawfulLE

namespace FierceNerds.Util

structure Interval (α : Type u) [LawfulLE α] where
  min : α
  max : α
  min_le_max : min ≤ max
deriving Repr

namespace Interval

variable {α : Type u}
variable [iLE : LawfulLE α] [iBEq : BEq α] [iHSub : HSub α α α]
variable (i : Interval α)

def length := i.max - i.min

abbrev Reflexive := (x : α) → x ≤ x

abbrev Bound (x : α) := x ≥ i.min ∧ x ≤ i.max

-- instance : Decidable (Bound i x) :=
--   if h1 : x ≥ i.min then
--     if h2 : x ≤ i.max then
--       -- let a1 : x ≥ i.min
--       let h : Bound i x := And.intro h1 h2
--       .isTrue h
--     else
--       let h : ¬Bound i x := fun (z : Bound i x) =>
--         let ⟨nh1, nh2⟩ := z
--         absurd nh2 h2
--       .isFalse h
--   else
--     let h : ¬Bound i x := fun (z : Bound i x) =>
--       let ⟨nh1, nh2⟩ := z
--       absurd nh1 h1
--     .isFalse h


theorem Bound.min : Bound i i.min :=
  let i_min := iLE.le_is_reflexive i.min
  ⟨i_min, i.min_le_max⟩

theorem Bound.max : Bound i i.max :=
  let i_max := iLE.le_is_reflexive i.max
  ⟨i.min_le_max, i_max⟩

instance [i : Inhabited α] : Inhabited (Interval α) where
  default := ⟨i.default, i.default, iLE.le_is_reflexive i.default⟩

instance [BEq α] : BEq (Interval α) where
  beq a b := a.min == b.min && a.max == b.max

instance [DecidableEq α] : DecidableEq (Interval α) := fun a b =>
  if h_min : a.min = b.min then
    sorry
  else
    sorry

-- instance Bound.dec (n : @& Nat) : Decidable (Bound i n) := inferInstance
--   dite (Eq (Nat.ble n m) true) (fun h => isTrue (Nat.le_of_ble_eq_true h)) (fun h => isFalse (Nat.not_le_of_not_ble_eq_true h))

-- deriving Repr, Inhabited, BEq, DecidableEq for Period

end Interval

abbrev _root_.Nat.BoundBy (x : Nat) := Interval.Bound (x := x)
