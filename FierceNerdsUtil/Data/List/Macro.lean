open Lean

namespace FierceNerdsUtil.Data.List.Macro

-- set_option pp.raw true
-- set_option pp.raw.maxDepth 10

-- set_option trace.Elab.definition true in
syntax (name := space_separated_list) "%[" withoutPosition(term*) "]"  : term

def argsD (default : Array Syntax := #[]) : Syntax → Array Syntax
  | Syntax.node info kind args => args
  | _ => default

macro_rules
  | `(%[ ]) => do `(List.nil)
  | `(%[ $elems ]) => do
    let stx : Syntax := elems.raw
    match stx with 
    | Syntax.node info kind args => do
      -- dbg_trace repr info
      -- dbg_trace repr kind
      -- dbg_trace repr args
      match kind with
      | `Lean.Parser.Term.app => do
        match args with
        | #[ el, els ] => do
          -- dbg_trace "in match `Lean.Parser.Term.app"  
          -- dbg_trace repr el
          -- dbg_trace repr els
          let els_args := els |> argsD #[]
          if els_args.size > 64 then
            throw (.error stx "Can only work with lists of less than 64 elements; if you need a longer list, build it separately")
          else
            let rec expandListLit (i : Nat) (result : TSyntax `term) : MacroM Syntax := do
              match i with
              | 0     => pure result
              | i+1  => expandListLit i  (← ``(List.cons $(⟨els_args.get! i⟩) $result))
            let result ← expandListLit els_args.size (← ``(List.nil))
            pure (← ``(List.cons $(⟨el⟩) $(⟨result⟩)))
        | _ => throw (.error stx "Can only work with #[ el, els ] here")
      | _ => do
        let first : TSyntax [`term] := ⟨args.get! 0⟩
        pure (← ``(List.cons $(⟨stx⟩) List.nil))
    | Syntax.missing => throw (.error stx "Syntax.missing is invalid here")
    | Syntax.atom .. => throw (.error stx "Syntax.atom is invalid here")
    | Syntax.ident .. => throw (.error stx "Syntax.ident is invalid here")

example : %[] = ([] : List Nat) := by decide
example : %[ 1 ] = [1] := by decide
example : %[ 1 2 ] = [1, 2] := by decide
example : %[ 1 2 3 ] = [1, 2, 3] := by decide
example : %[ 1 (1 + 1) ] = [1, 2] := by decide
