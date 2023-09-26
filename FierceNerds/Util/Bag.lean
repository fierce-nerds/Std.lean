import Std.Data.Rat.Basic

namespace FierceNerds.Util

structure Bag (Unit : Type u) where
  value : Rat
  unit : Unit
deriving Inhabited

namespace Bag

instance {Unit : Type u} [Repr Unit] : Repr (Bag Unit) := ⟨fun a prec => "instance Repr for Bag not implemented"⟩
