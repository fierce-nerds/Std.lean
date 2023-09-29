namespace FierceNerdsUtil

namespace List

theorem eq_head (a_head b_head : α) (a_tail b_tail : List α) (h : a_head :: a_tail = b_head :: b_tail) : a_head = b_head :=
  let A := List α
  let a' : A := a_head :: a_tail
  let motive : (a : A) → a' = a → Prop := fun a h => 
    match a with
    | [] => nomatch h
    | na_head :: na_tail => a_head = na_head
  let refl : motive a' rfl := by simp
  let a'1 : A := b_head :: b_tail
  @Eq.rec A a' motive refl a'1 h

theorem eq_tail {α : Type u} (a_head b_head : α) (a_tail b_tail : List α) (h : a_head :: a_tail = b_head :: b_tail) : a_tail = b_tail :=
  let A := List α
  let a' : A := a_head :: a_tail
  let motive : (a : List α) → a' = a → Prop := fun a h => 
    match a with
    | [] => nomatch h
    | na_head :: na_tail => a_tail = na_tail
  Eq.rec (motive := motive) (by simp) h
