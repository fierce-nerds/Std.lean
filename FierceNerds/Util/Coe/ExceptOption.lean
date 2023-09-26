instance (ε : Type u) (α : Type v) : CoeOut (Except ε α) (Option α) where
  coe a := match a with
    | .error _ => .none
    | .ok val => .some val
