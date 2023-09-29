namespace FierceNerdsUtil

namespace Action

variable {State Error Input Output : Type u}

abbrev M1 := StateT State (ExceptT Error Id)

abbrev M1.Action := {m : Type u → Type u} → [Monad m] → [MonadState State m] → [MonadExcept Error m] → Input → m Output
