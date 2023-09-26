import Mathlib.Data.List.Basic
import Mathlib.Init.ZeroOne
import Playbook.Std.Data.List.Util
import Playbook.Std.UniqueBy
import Playbook.Std.Example.Library
import Std.Data.List.Basic
import Std.Data.List.Init.Lemmas

open Playbook Std

namespace FierceNerds.Util.Data

structure List.UniqueBy {α : Type u} {β : Type v} (f : α → β) where
  list : List α
  isUnique : Playbook.Std.UniqueBy f list := by decide
deriving Repr

namespace List.UniqueBy

variable {α β : Type u} {f : α → β}
variable [iBEq : BEq α] [iReprList : Repr (List α)] [iBEqList : BEq (List α)]
variable [iDecidableEqOfβ : DecidableEq β]
variable (l a b : List.UniqueBy f)

theorem replaceByKey.preservesUniqueness
  (x y : α)
  (h1 : f x = f y)
  (input : List α)
  (h3 : Playbook.Std.UniqueBy f input)
  : Playbook.Std.UniqueBy f (input.replace x y)
  := by
    unfold Playbook.Std.UniqueBy
    unfold Playbook.Std.PairwiseBy
    cases input
    . -- nil 
      simp
    . -- cons
      rename_i head tail
      simp
      have h : List.Pairwise Ne (List.map f ((head :: tail).replace x y)) := sorry
      exact h
      -- cases output 
      -- . -- nil
      --   conv at h2 =>
      --     unfold List.replace
      --     -- exact nomatch h2
      --   -- exact nomatch h2
      --   done
      -- . -- cons
      --   rename_i output_head output_tail
      --   admit


    -- cases input
    -- . -- nil
    --   cases output
    --     . -- nil
    --       admit
    --     . -- cons
    --       admit
    --   -- have h : @List.Pairwise α Ne [] := List.Pairwise.nil
    --   -- simp at h2
    --   -- have h4 := @List.map_nil α β f
    --   -- rw [←h2] at h4
    --   -- have h5 := h2.symm ▸ (h2.symm ▸ h4.symm)
    --   -- have h6 := h2.symm ▸ h5
    --   -- unfold List.map
    --   -- rw [←h2]
    --   -- rw [h6] at h
    --   -- exact h

def replaceByKey (x y : α) (h : f x = f y) : List.UniqueBy f := 
  let list := l.list.replace x y
  let isUnique : Playbook.Std.UniqueBy f list := replaceByKey.preservesUniqueness x y h l.list l.isUnique
  { list, isUnique }

def reprPrec (n : Nat) := iReprList.reprPrec l.list n

def beq := a.list == b.list

def cons? (l : UniqueBy f) (x : α) : Option (UniqueBy f) :=
  let list := x :: l.list
  let type := Playbook.Std.UniqueBy f list
  if h : Playbook.Std.UniqueBy f list then
    .some ⟨list, h⟩
  else
    .none
  -- let sheet_existing := report.sheets.list.find? (·.kind == kind)
  -- match sheet_existing with
  -- | .some sheet => 
  -- | .none => do

instance : CoeOut (List.UniqueBy f) (List α) := ⟨List.UniqueBy.list⟩

instance : Repr (List.UniqueBy f) := ⟨reprPrec⟩

instance : BEq (List.UniqueBy f) := ⟨beq⟩

instance : Inhabited (List.UniqueBy f) := ⟨{
  list := [],
  isUnique := PairwiseBy.empty_list_is_pairwise_by Ne f
}⟩

instance : DecidableEq (List.UniqueBy f) := fun a b => (sorry : Decidable (Eq a b))

namespace Examples

open Playbook.Std.Example.Library

-- a type for a list of books unique by name
abbrev Items := List.UniqueBy Book.name
-- the type of an element of a list is inferred automatically

-- an empty list is a unique list
def empty : Items := {
  list := []
  isUnique := by decide
}

-- a non-empty list where each book's name is unique
def unique : Items := {
  list := [
    ⟨"Around the World in Eighty Days", [⟨"Jules Verne"⟩]⟩,
    ⟨"The Mysterious Island", [⟨"Jules Verne"⟩]⟩
  ]
  isUnique := by decide
}
