namespace Except

instance : Coe α (Except ε α) := ⟨(.ok ·)⟩

instance : Coe ε (Except ε α) := ⟨(.error ·)⟩
