import FierceNerdsUtil.FierceNerds.Util.Issue_type

namespace FierceNerds.Util

namespace Issue

variable (issue : Issue)

def toThought : Thought :=
  let { name, steps, expected, actual } := issue
  .mk name [
    .mk "Steps" steps,
    .mk "Expected" expected,
    .mk "Actual" actual
  ]
