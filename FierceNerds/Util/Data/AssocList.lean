import Std.Data.AssocList

open Std

instance {α β} [Repr α] [Repr β] : Repr (AssocList α β) where
  reprPrec list prec := list.toList.repr prec

