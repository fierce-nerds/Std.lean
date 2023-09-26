namespace FierceNerds.Util

def Filter (α : Type u) := α → Bool

namespace Filter

variable {α : Type u}

def mk (f : α → List Bool) : Filter α := fun a => a |> f |>.all id

section Examples

def even : Filter Nat := fun x => x / 2 == 0

end Examples

def Filter.ofOptionMapper (mapper : α → Option β) := Option.toBool ∘ mapper

def Filter.ofExceptMapper (mapper : α → Except ε β) := Except.toBool ∘ mapper

-- Not sure why CoeOut is necessary
instance : CoeOut (α → Option β) (Filter α) := ⟨Filter.ofOptionMapper⟩

instance : CoeOut (α → Except ε β) (Filter α) := ⟨Filter.ofExceptMapper⟩
