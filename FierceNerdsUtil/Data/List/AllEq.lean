import Mathlib.Data.List.Basic

namespace FierceNerdsUtil.Data.List

inductive AllEq : List α → Prop where
  | zero : AllEq []
  | one (x : α) : AllEq [x]
  | two (x : α) (h : AllEq (x :: xs)) : AllEq (x :: x :: xs)

example : AllEq ([] : List Nat) := AllEq.zero
example : AllEq [1] := AllEq.one 1
example : AllEq [1, 1] := AllEq.one 1 |>.two 1
example : (AllEq [1, 2]) → False := fun allEq => nomatch allEq

def AllEq_equiv_Chain.{u} := {α : Type u} → (xs : List α) → (AllEq xs ↔ xs.Chain' Eq)

