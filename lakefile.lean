import Lake
open Lake DSL

-- mathlib brings std, aesop, doc-gen4, Qq as dependencies
require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "b86770a38f6ee8d4a7f64cebcf388fb8b8cef89b"

package FierceNerdsUtil where
  -- add package configuration options here

@[default_target]
lean_lib FierceNerdsUtil where
  -- add library configuration options here
