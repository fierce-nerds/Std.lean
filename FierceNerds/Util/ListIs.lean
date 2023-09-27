namespace FierceNerds.Util

namespace List

def isNil : List α → Bool
  | .nil => true
  | _ => false

def isCons : List α → Bool
  | .nil => false
  | _ => true

