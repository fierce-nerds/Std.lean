import FierceNerdsUtil.FierceNerds.Util.ChainwiseList_type

namespace FierceNerds.Util.Data.List.Chainwise

namespace Example

namespace E1

def as := [3, 2, 1]

def R (a : Nat) (as : List Nat) : Prop := as.allSatisfy (· ≤ a)

theorem chainwise_4 : Chainwise R 4 as := by
  repeat (first | apply Chainwise.cons | apply Chainwise.nil )
  repeat (
    unfold R List.allSatisfy List.toAnd
    simp
  )
  done

theorem not_chainwise_0 : Chainwise R 0 as → False := by
  intro c
  cases c with
  | cons c h =>
    unfold R List.allSatisfy List.toAnd at h
    simp at h
    done
  done
