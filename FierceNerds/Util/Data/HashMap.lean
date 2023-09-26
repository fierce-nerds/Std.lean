import Std.Data.HashMap
import Mathlib.Data.HashMap
import Mathlib.Init.ZeroOne
import Playbook.Std.Data.List.UniqueBy

open Std

namespace Std.HashMap

variable [beq_α : BEq α] [beq_β : BEq β] [iHashableA : Hashable α]

def containsValue [BEq β] (self : HashMap α β) (v : β) : Bool := self.values.contains v

def isSubOf (a b : HashMap α β) : Bool := a.fold (init := true) fun r k v => r && b[k] == some v

def modifyD (self : HashMap α β) (a : α) (default : β) (f : α → β → β) : HashMap α β :=
  let value := self.findD a default
  self.insert a (f a value)

/--
NOTE: for some reason, beq_β could not be synthesized
-/
def beq [beq_β : BEq β] (a b : HashMap α β) : Bool :=
  @isSubOf _ _ _ beq_β _ a b
    &&
  @isSubOf _ _ _ beq_β _ b a

def sum [Add β] [Zero β] (self : HashMap α β) : β := self.values.sum

def ofListEvery (value : β) (keys : List α) : HashMap α β := keys |>.map (⟨·, value⟩) |> .ofList

def countListElems (xs : List α) : HashMap α Nat :=
  loop xs HashMap.empty
where
  loop : List α → HashMap α Nat → HashMap α Nat
    | [], map => map
    | x :: xs, map => map.modifyD x 0 (fun key value => value + 1)

def findZ [Zero β] (self : HashMap α β) (a : α) : β := self.findD a Zero.zero

instance [Repr α] [Repr β] : Repr (HashMap α β) where
  reprPrec hashmap prec := hashmap.toList.repr prec

instance : CoeOut (HashMap α β) (List α) := ⟨keys⟩

instance : CoeOut (HashMap α β) (List β) := ⟨values⟩

instance [BEq β] : BEq (HashMap α β) := ⟨beq⟩

theorem for_every_hashmap_there_is_a_permutation_which_is_not_equal_to_it
  (a : HashMap α β)
  (a_length_gt_1 : a.size > 1)
  : Exists fun (b : HashMap α β) => 
    (a == b) ∧ (Not (a.toList == b.toList))
  := sorry

instance : DecidableEq (HashMap α β) := fun a b => sorry

instance : Lean.FromJson (HashMap α β) := ⟨fun json => sorry⟩

instance : Lean.ToJson (HashMap α β) := ⟨fun h => sorry⟩
