namespace FierceNerds.Util

namespace Except

def panic {ε : Type u} {α : Type v} [ToString ε] [Inhabited α] : Except ε α → α
  | .ok value => value
  | .error error => panic! (toString error)

instance : Coe α (Except ε α) := ⟨(.ok ·)⟩

instance : Coe ε (Except ε α) := ⟨(.error ·)⟩

namespace Example
