namespace Except

def panic [ToString ε] [Inhabited α] : Except ε α → α
  | .ok val => val
  | .error err => panic! (toString err)
