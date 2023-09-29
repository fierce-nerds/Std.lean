namespace FierceNerdsUtil

namespace ExceptBool

instance (ε : Type u) (α : Type v) : CoeOut (Except ε α) Bool where
  coe a := match a with
    | .error _ => false
    | .ok _ => true
