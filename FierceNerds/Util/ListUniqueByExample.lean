import FierceNerds.Util.ListUniqueByDef
import FierceNerds.Util.Example.Library

namespace FierceNerds.Util.ListUniqueBy

open Example Library

-- a type for a list of books unique by name
abbrev Items := ListUniqueBy Book.name
-- the type of an element of a list is inferred automatically

-- an empty list is a unique list
def empty : Items := {
  list := []
  isUnique := by decide
}

-- a non-empty list where each book's name is unique
def unique : Items := {
  list := [
    ⟨"Around the World in Eighty Days", [⟨"Jules Verne"⟩]⟩,
    ⟨"The Mysterious Island", [⟨"Jules Verne"⟩]⟩
  ]
  isUnique := by decide
}
