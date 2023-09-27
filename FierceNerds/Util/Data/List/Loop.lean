import FierceNerds.Util.ListFun

namespace FierceNerds.Util.Data.List

def Loop (big : List α) (small : List α) :=
  Exists fun (count : Nat) => Eq big (List.appendN small [] count)

namespace Loop

class GetLongest where
  run : (xs : List α) → List α
  run_returns_a_loop : Loop xs (run xs)
  run_returns_the_longest_loop : (big : List α) → (small : List α) → (h : Loop big small) → small.length = (run xs).length
