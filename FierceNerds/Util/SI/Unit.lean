import FierceNerds.Generic.Thought.Macro
import FierceNerds.Generic.Implementation
import Lean.Data.Json.FromToJson
import Std.Data.Rat.Basic

open Std
open Playbook.Generic

namespace FierceNerds.Util

structure SI.Unit (α : Type u) where
  value : Nat
  exponent : Int
deriving Repr, Inhabited, BEq, DecidableEq, Lean.ToJson, Lean.FromJson

def SI.Unit.spec : Thoughts := [
  "Must allow to use any exponent",
  "Must allow to operations on values with same units" ♢ [
    "Examples" ♢ [
      "It's possible to add seconds and seconds"
    ]
  ],
  "Must disallow to add values with different units" ♢ [
    "Examples" ♢ [
      "It's impossible to add seconds and meters"
    ]
  ]
]

def SI.Unit.options : Implementations := [
  {
    title := "As structure of value : Nat"
    status := .blocked
    code := "
      structure SI.Unit [ToExponent α] (unit : α) where
        value : Nat
      
      def add [ToExponent α] {unit : α} (a b : SI.Unit unit) := sorry

      ---

      inductive Duration where
        | second
        | microsecond
    "
    thoughts := [
      "But it doesn't allow to use only a fixed number of exponents"
    ]
  },
  {
    title := "As structure of value and exponent",
    status := .done,
    code := " -- implemented --
      structure SI.Unit (α : Type u) where
        value : Nat
        exponent : Int
      
      def add (a b : SI.Unit α) := sorry

      ---

      inductive Duration.Placeholder where

      def Duration := SI.Unit Duration.Placeholder
      def meter : Duration := ⟨1, 0⟩
      def kilometer : Duration := ⟨1, 3⟩
      abbrev meters := meter
      abbrev km := kilometer
      abbrev kilometers := kilometer
      def two_meters := 2 * meters
      def two_kilometers := 2 * kilometers

      inductive Distance where
    "
  },
  {
    title := "As Rat, but with a dummy type argument to simulate nominal typing",
    status := .blocked
    code := "
      def SI.Unit (α : Type u) := Rat
    ",
    thoughts := [
      "Lean still thinks that nominally different types are equal" ♢ [
        "Because they reduce to the same term"
      ]
    ]
  }
]

def SI.Unit.todo : Thoughts := [
  "Implement instance : Coe (SI.Unit α) Rat"
]

namespace SI.Unit

variable {α : Type u}
variable (u : SI.Unit α)

def toRat : Rat :=
  match u.exponent with
  | .ofNat n => ((u.value * 10 ^ n) : Nat)
  | .negSucc n => mkRat u.value (10 ^ n)

def le (a b : SI.Unit α) := a.toRat ≤ b.toRat

def lt (a b : SI.Unit α) := a.toRat < b.toRat

instance iLE : LE (SI.Unit α) := ⟨le⟩

instance iLT : LT (SI.Unit α) := ⟨lt⟩

def addAux (min max : SI.Unit α) (h : min.exponent ≤ max.exponent) : SI.Unit α :=
  let diff : Nat := sorry -- max.exponent - min.exponent
  let multiplier := 10 ^ diff
  sorry

def add (a b : SI.Unit α) : SI.Unit α :=
  if h : a.exponent ≤ b.exponent then
    addAux a b h
  else
    addAux b a sorry

def add.todo := [
  @addAux
]

def mul (a b : SI.Unit α) : SI.Unit α := sorry

def sub (a b : SI.Unit α) (h : b ≤ a) : SI.Unit α := sorry

def mulNat (nat : Nat) (unit : SI.Unit α) : SI.Unit α := { unit with value := Nat.mul nat unit.value }

def ofNat (n : Nat) : SI.Unit α := {
  value := n,
  exponent := 0
}

def ofScientific (mantissa : Nat) (exponentIsNegative : Bool) (exponent : Nat) : SI.Unit α := {
  value := mantissa,
  exponent := if exponentIsNegative then -exponent else exponent
}

-- toNat is impossible

-- fromInt is impossible (can't convert negative Int values)

-- toInt is impossible (can't convert SI.Unit values with negative exponent)

-- fromRat is impossible (can't convert negative Rat values)

-- def addNat (n : Nat) : SI.Unit := {u with value := u.value }

instance : Coe Nat (SI.Unit α) := ⟨ofNat⟩

instance : OfNat (SI.Unit α) n := ⟨ofNat n⟩

instance : OfScientific (SI.Unit α) := ⟨ofScientific⟩

instance : CoeOut (SI.Unit α) Rat := ⟨toRat⟩

instance : Add (SI.Unit α) := ⟨add⟩

-- NOTE: `instance : Mul (SI.Unit α)` is impossible to implement because it assumes that multiplying two values of the same unit gives the same unit, but actually it gives the same unit squared.

-- instance iDecidableLE (a b : SI.Unit α) : Decidable (a ≤ b) := sorry

-- instance iDecidableLT (a b : SI.Unit α) : Decidable (a < b) := sorry

instance : HMul Nat (SI.Unit α) (SI.Unit α) := ⟨mulNat⟩

instance : HMul (SI.Unit α) Nat (SI.Unit α) := ⟨flip mulNat⟩

-- instance : Pow (SI.Unit α) := ⟨pow⟩

-- instance : HAdd SI.Unit Nat SI.Unit := 

namespace Example

-- @see Playbook/Generic/Duration.lean
-- @see Playbook/Generic/Distance.lean
