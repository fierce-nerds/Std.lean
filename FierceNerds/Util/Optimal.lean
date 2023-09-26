namespace FierceNerds.Util

structure Optimal {α : Type u} [LE α] (options : List α) where
  value : α
  isOptimal : (candidate : α) → (h1 : candidate ∈ options) → candidate ≤ value
