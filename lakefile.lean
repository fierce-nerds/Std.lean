import Lake
open Lake DSL

-- mathlib brings std, aesop, doc-gen4, Qq as dependencies
require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "e70f8800f70f89b102ad7469128ace674213e1e5"

package FierceNerds.Util where
  -- add package configuration options here

@[default_target]
lean_lib FierceNerds.Util where
  -- srcDir := "./FierceNerds"
  -- add library configuration options here
