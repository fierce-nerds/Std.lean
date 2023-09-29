import Lean.Elab

open Lean
open Lean.Elab

def task {α : Type u} [Inhabited α] (desc : String) (a : α) : α := sorry
  -- match desc with
  -- | "" => a
  -- | _ => panic! desc

def impl (message := "Please implement me") {α : Type u} [Inhabited α] : α := panic! message

def implLazy {α : Type u} [Inhabited α] : Unit → α := fun u => panic! "Unimplemented"

initialize todoAttr : ParametricAttribute String ←
  registerParametricAttribute {
    name := `todo
    descr := "Mark the declaration as a work-in-progress."
    getParam := fun declName stx => do
      let args := stx[1].getArgs
      -- TODO: return the actual param
      return "todo"
  }

initialize incompleteAttr : ParametricAttribute String ←
  registerParametricAttribute {
    name := `incomplete
    descr := "Mark the declaration as incomplete."
    getParam := fun declName stx => do
      let args := stx[1].getArgs
      -- TODO: return the actual param
      return "incomplete"
  }

initialize factAttr : ParametricAttribute String ←
  registerParametricAttribute {
    name := `fact
    descr := "Mark the declaration as a fact (a theorem that must be correct)."
    getParam := fun declName stx => do
      let args := stx[1].getArgs
      -- TODO: return the actual param
      return "fact"
  }

initialize hypothesisAttr : ParametricAttribute String ←
  registerParametricAttribute {
    name := `hypothesis
    descr := "Mark the declaration as a hypothesis (may be either: true, false, undecidable)."
    getParam := fun declName stx => do
      let args := stx[1].getArgs
      -- TODO: return the actual param
      return "hypothesis"
  }
