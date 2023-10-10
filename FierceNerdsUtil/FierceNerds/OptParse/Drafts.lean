import FierceNerdsUtil.FierceNerds.Util.Scaffold
import Std.Data.HashMap.Basic

namespace Parse.Drafts

open FierceNerds Util
open Std

abbrev Opts := HashMap String String

abbrev Args := List String

abbrev Params := Opts × Args

def parseArgs (args : List String) : Params :=
  go args (mkHashMap, [])
where
  go : List String → Params → Params
  | name :: value :: rest, (opts, args) =>
    let opts := opts.insert name value
    go rest (opts, args)
  | arg :: [], (opts, args) =>
    let args := arg :: args
    (opts, args)
  | [], (opts, args) => (opts, args) 
