namespace FierceNerdsUtil

/--
Taken from Lean code
-/
def Injective (f : α → β) := (a b : α) → (f a = f b) → (a = b)
