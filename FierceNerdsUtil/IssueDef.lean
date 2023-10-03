import FierceNerdsUtil.Thought.Type

namespace FierceNerdsUtil

structure Issue where
  name : String
  steps : List Thought
  expected : List Thought
  actual : List Thought
deriving Repr, Inhabited, BEq
