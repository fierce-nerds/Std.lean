import FierceNerds.Util.PairwiseBy

namespace FierceNerds.Util

namespace PairwiseByExample

namespace Example

def empty : List Nat := []
def all_different : List Nat := [1, 2, 3]
def all_same : List Nat := [1, 1, 1]

abbrev Rel := @PairwiseBy Nat Nat Ne id

def empty_pairwise_by : Decidable (Rel empty) := inferInstance
def all_different_pairwise_by : Decidable (Rel all_different) := inferInstance
def all_same_pairwise_by : Decidable (Rel all_same) := inferInstance

example : empty_pairwise_by.decide = true := by decide
example : all_different_pairwise_by.decide = true := by decide
example : all_same_pairwise_by.decide = false := by decide
