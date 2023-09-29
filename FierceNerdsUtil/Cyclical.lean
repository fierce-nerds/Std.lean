namespace FierceNerdsUtil

def CyclicalNat
  (f : Nat → β)
  : Prop
  :=
    Exists fun (delta : Nat) =>
      (start : Nat) → f start = f (start + delta)

def Cyclical
  {α β γ}
  [HAdd α γ α]
  (f : α → β)
  : Prop
  :=
    Exists fun (delta : γ) =>
      (start : α) → f start = f (start + delta)
