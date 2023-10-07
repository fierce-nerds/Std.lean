import Mathlib.Data.List.Basic
import Mathlib.Init.ZeroOne
import Mathlib.Data.List.Sort

namespace List

def flatten (xs : List (List α)) := xs.foldr .append []

def toAnd (xs : List Prop) := xs.foldr And True

def allSatisfy (p : α → Prop) (xs : List α) : Prop := xs |>.map p |> toAnd

def allSatisfied {α : Type u} (x : α) (ps : List (α → Prop)) : Prop := ps |>.map (· x) |> toAnd

def allSatisfyAll (ps : List (α → Prop)) (xs : List α) : Prop := xs |>.map (fun x => ps |>.map (· x) |> toAnd) |> toAnd

def allTrue (xs : List Bool) := xs.all id

def allTruthy [Coe α Bool] (xs : List α) := xs.all (· = true)

def filterBy [BEq β] (xs : List α) (f : α → β) (b : β) := xs.filter fun l => (f l) == b

def appendN (target : List α) (init : List α) (n : Nat) : List α :=
  match n with
  | 0 => target
  | n' + 1 => appendN target (target ++ init) n'

/--
- TODO: Search for an Applicative instance that does the same; replace if found
-/
def apply {α : Type u} {β : Type v} (fs : List (α → β)) (a : α) : List β := fs.map (· a)

-- def sortByWith (sorter : List (α × β) → List (α × β)) (mapper : α → β) (xs : List α) : List α :=
--   let pairsRaw := xs.map fun x => (x, mapper x)
--   let pairsSorted := sorter pairsRaw
--   pairsSorted.map (·.1)

-- def sortByWithMergeSort := sortByWith List.mergeSort
