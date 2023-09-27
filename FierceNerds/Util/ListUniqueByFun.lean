import FierceNerds.Util.ListUniqueByDef
import FierceNerds.Util.UniqueByTheorem

namespace FierceNerds.Util.ListUniqueBy

open FierceNerds Util

variable {α β : Type u} {f : α → β}
variable [iBEqA : BEq α] [iReprListA : Repr (List α)] [iBEqListA : BEq (List α)]
variable [iDecidableEqOfβ : DecidableEq β]
variable (l a b : ListUniqueBy f)

def replaceByKey (x y : α) (h : f x = f y) : ListUniqueBy f := 
  let list := l.list.replace x y
  let isUnique : UniqueBy f list := UniqueBy.replaceByKeyPreservesUniqueness x y h l.list l.isUnique
  { list, isUnique }

def reprPrec (n : Nat) := iReprListA.reprPrec l.list n

def beq := a.list == b.list

def cons? (l : ListUniqueBy f) (x : α) : Option (ListUniqueBy f) :=
  let list := x :: l.list
  let type := UniqueBy f list
  if h : UniqueBy f list then
    .some ⟨list, h⟩
  else
    .none
