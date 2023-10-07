namespace FierceNerds.Util

def BEqBy {α β} [BEq β] (f : α → β) (a b : α) := BEq.beq (f a) (f b)
