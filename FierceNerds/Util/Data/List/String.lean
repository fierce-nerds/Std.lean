import Playbook.Std
import Playbook.Generic

open Playbook Std Generic

namespace FierceNerds.Util.Data.List

namespace String

def foldlSep (separator : String) (l : List String) : String :=
  l.foldl (fun r s => r ++ separator ++ s) ""

def joinWith (separator : String) (l : List String) : String :=
  let result := foldlSep separator l
  result.drop separator.length
