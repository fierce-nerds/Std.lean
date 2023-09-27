import FierceNerds.Util
import FierceNerds.Generic

open FierceNerds Util Generic

namespace FierceNerds.Util.Data.List

namespace String

def foldlSep (separator : String) (l : List String) : String :=
  l.foldl (fun r s => r ++ separator ++ s) ""

def joinWith (separator : String) (l : List String) : String :=
  let result := foldlSep separator l
  result.drop separator.length
