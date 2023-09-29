import FierceNerdsUtil.Char

namespace System.FilePath

/--
Level is the distance from the root of the filesystem hierarchy
-/
def level (path : System.FilePath) : Nat :=
  path
  |>.normalize
  |>.toString
  |>.splitOn pathSeparator.toString
  |>.filter (·.length ≠ 0)
  |>.length

namespace Level

section Examples

-- root folder level is zero
def root : FilePath := "/"
example : level root = 0 := sorry

-- /var folder level is 1
def var : FilePath := "/var"
example : level var = 1 := sorry

-- trailing slash doesn't change the level
def varWithTrailingSlash : FilePath := var.toString ++ "/"
example : level var = level varWithTrailingSlash := sorry

-- file level is folder level
def file : FilePath := "/var/file.lean"
def folder : FilePath := "/var/bin"
example : level file = level folder := sorry
