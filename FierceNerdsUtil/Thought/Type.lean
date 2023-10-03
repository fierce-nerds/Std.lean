import Lean.Data.Json.FromToJson
import Mathlib.Data.List.Defs
import FierceNerdsUtil.FalseTheorem
import FierceNerdsUtil.ListTheorem

namespace FierceNerdsUtil

open Lean

/--
Using `inductive` instead of `structure` because `structure` doesn't support nested types
-/
inductive Thought where
  /-- sole constructor -/
  | mk : (title : String) → (children : List Thought) → Thought
deriving Repr, Inhabited, BEq

namespace Thought

variable (t : Thought)

def title := match t with | mk title children => title

def children := match t with | mk title children => children

/--
Not sure why it can't use structural recursion
-/
def size : Thought → Nat
  | mk title children =>
    let children_size := children |>.map size |>.sum
    children_size + 1
decreasing_by sorry

def toJson : Thought → Json
  | mk title children =>
    let childrenAsJson := children |>.map toJson |>.toArray
    Json.mkObj [
      ("title", title),
      ("children", Json.arr childrenAsJson)
    ]
termination_by toJson t => t.size
decreasing_by sorry

instance : ToJson Thought := ⟨toJson⟩

def fromString (s : String) : Thought := Thought.mk s []

instance : Coe String Thought := ⟨fromString⟩

instance : Coe (List String) (List Thought) := ⟨List.map fromString⟩

-- instance [ToString α] : CoeOut (Verdict α) Thought := ⟨fun v => ⟨ToString.toString v, []⟩⟩

instance (priority := low) universal {α : Sort u} : CoeOut α Thought := ⟨fun a => ⟨"{This was a link to a syntax element}", []⟩⟩

instance [ToString α] : CoeOut α Thought := ⟨fromString ∘ toString⟩

instance [Repr α] : CoeOut α Thought := ⟨fromString ∘ reprStr⟩

mutual
  def deq : (a b : Thought) → Decidable (a = b)
  | .mk a_title a_children, .mk b_title b_children => 
    if h_title : a_title = b_title then
      match deqList a_children b_children with
      | isFalse nh_children => .isFalse (False.congr Thought.children nh_children)
      | isTrue h_children => 
        let h := Eq.refl (Thought.mk a_title a_children)
        let h := h_title ▸ h
        let h := h_children ▸ h 
        .isTrue h
    else
      .isFalse (False.congr Thought.title h_title)

  def deqList : (a b : List Thought) → Decidable (a = b)
    | [], [] => .isTrue (Eq.refl [])
    -- | a_head :: a_tail, [] => .isFalse (fun h : a_head :: a_tail = [] => nomatch h)
    | a_head :: a_tail, [] => .isFalse fun.
    | [], b_head :: b_tail => .isFalse fun.
    | a_head :: a_tail, b_head :: b_tail => 
      match deq a_head b_head with
      | isFalse nh_head => .isFalse
        fun h : a_head :: a_tail = b_head :: b_tail =>
          let h_head := congrArg List.head? h
          let h_head : Option.some a_head = Option.some b_head := h_head
          let h_head : a_head = b_head := List.eq_head a_head b_head a_tail b_tail h
          nh_head h_head
      | isTrue h_head =>
        match deqList a_tail b_tail with
        | isFalse nh_tail => .isFalse
          fun h : a_head :: a_tail = b_head :: b_tail =>
            let h_tail : a_tail = b_tail := List.eq_tail a_head b_head a_tail b_tail h
            nh_tail h_tail
        | isTrue h_tail =>
          let h := Eq.refl (a_head :: a_tail)
          let h := h_head ▸ h
          let h := h_tail ▸ h
          .isTrue h

end
decreasing_by sorry
-- termination_by deq a b => sorry ; deqList a b => a.length + b.length

instance : DecidableEq Thought := deq

-- protected def reprPrec (n : Nat) : Format :=
--   match t with
--   | mk name children => sorry -- s!"Thought.mk {name} {reprPrec children}"
--   | link type => sorry

-- instance : Repr Thought := ⟨Thought.reprPrec⟩
