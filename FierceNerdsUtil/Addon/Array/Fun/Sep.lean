namespace Array

def foldlSep (separator : String) (l : Array String) : String :=
  l.foldl (fun r s => r ++ separator ++ s) ""

def joinWith (separator : String) (l : Array String) : String :=
  let result := foldlSep separator l
  result.drop separator.length
