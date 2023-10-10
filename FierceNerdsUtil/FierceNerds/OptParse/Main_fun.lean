import FierceNerdsUtil.FierceNerds.Util.Scaffold
import FierceNerdsUtil.FierceNerds.OptParse.OptParsersV1_type
import FierceNerdsUtil.FierceNerds.OptParse.ErrorV1_type
import FierceNerdsUtil.FierceNerds.OptParse.ArgParsersV1_type
import FierceNerdsUtil.FierceNerds.OptParse.ParseV2_type
import FierceNerdsUtil.FierceNerds.OptParse.EStateMV2_type

namespace FierceNerds.OptParse.Main

open FierceNerds Util

abbrev Result (ε γ : Type u) := List ε × γ

def parseV1 {α : Type u} (optParsers : OptParsersV1) (argParsers : ArgParsersV1) (input : List String) (output : α) : Except ErrorV1 α :=
  match input with
  | head :: tail => sorry
    -- let opt? := optParsers.get head
    -- match opt? with
    -- | .some opt => sorry
    -- | .none => sorry
      -- match argParsers.val with
      -- | arg :: rest =>
      --   match arg.parse? with
      --   | .some parse => 
      --     -- let output := parse head output
      --     sorry
      --   | .none => sorry
      -- | [] => .error $ .unexpectedArgs (head :: tail)
  | [] => .ok output

def parseV2 (parsers : List (ParseV2 ε α)) : EStateM ε (StateV2 α) PUnit := do
  match parsers with
  | parser :: rest => sorry
  | [] => do
    let { input, output } ← get
    match input with
    | head :: tail => sorry
    | [] => do return ()

