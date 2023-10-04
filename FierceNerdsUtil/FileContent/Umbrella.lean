import FierceNerdsUtil.FileContent.Basic
import Init.System.FilePath
import FierceNerdsUtil.Addon.System.FilePath.Fun
import FierceNerdsUtil.Addon.Array.Fun.Sep

namespace FierceNerdsUtil

open Lean System FilePath

def getUmbrellaFileContent (dir : FilePath) : IO FileContent := do
  let paths ← getLeanFilePaths dir
  let imports := paths.map (· |> FilePath.moduleNameOfFileName dir |> (s!"import {·}"))
  return imports.joinWith "\n"
