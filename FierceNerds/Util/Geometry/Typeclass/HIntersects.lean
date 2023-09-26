namespace FierceNerds.Util.Geometry.Typeclass

class HIntersects (α : Type u) (β : Type u) where
  hIntersects : α → β → Prop
