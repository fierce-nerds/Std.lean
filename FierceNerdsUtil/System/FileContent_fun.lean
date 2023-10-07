import FierceNerdsUtil.System.FileContent_type
import FierceNerdsUtil.System.FilePath_fun
import FierceNerdsUtil.Array_fun_sep

namespace System.FileContent

open Lean System FilePath

def getUmbrellaFileContent (dir : FilePath) : IO FileContent := do
  let paths ← getLeanFilePaths dir
  let imports := paths.map (· |> FilePath.moduleNameOfFileName dir |> (s!"import {·}"))
  return imports.joinWith "\n"
