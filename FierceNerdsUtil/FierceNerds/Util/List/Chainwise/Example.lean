import FierceNerdsUtil.FierceNerds.Util.ChainwiseList_type
import FierceNerdsUtil.List_fun_basic
import FierceNerdsUtil.FierceNerds.Util.ChainwiseList_type

namespace FierceNerds.Util.ChainwiseList.Example

def as := [3, 2, 1]

def R (a : Nat) (as : List Nat) : Prop := as.allSatisfy (· ≤ a)

theorem chainwise_4 : ChainwiseList R 4 as := by
  repeat (first | apply ChainwiseList.cons | apply ChainwiseList.nil )
  repeat (
    unfold R List.allSatisfy List.toAnd
    simp
  )
  done

theorem not_chainwise_0 : ChainwiseList R 0 as → False := by
  intro c
  cases c with
  | cons c h =>
    unfold R List.allSatisfy List.toAnd at h
    simp at h
    done
  done
