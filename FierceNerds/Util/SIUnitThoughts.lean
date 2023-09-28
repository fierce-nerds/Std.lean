import Playbook.Generic.Thought.Macro

namespace FierceNerds.Util

structure SIUnit (α : Type u) where
  value : Nat
  exponent : Int
deriving Repr, Inhabited, BEq, DecidableEq

def SIUnit.spec : Thoughts := [
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

def SIUnit.options : Implementations := [
  {
    title := "As structure of value : Nat"
    status := .blocked
    code := "
      structure SIUnit [ToExponent α] (unit : α) where
        value : Nat
      
      def add [ToExponent α] {unit : α} (a b : SIUnit unit) := sorry

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
      structure SIUnit (α : Type u) where
        value : Nat
        exponent : Int
      
      def add (a b : SIUnit α) := sorry

      ---

      inductive Duration.Placeholder where

      def Duration := SIUnit Duration.Placeholder
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
      def SIUnit (α : Type u) := Rat
    ",
    thoughts := [
      "Lean still thinks that nominally different types are equal" ♢ [
        "Because they reduce to the same term"
      ]
    ]
  }
]

def SIUnit.todo : Thoughts := [
  "Implement instance : Coe (SIUnit α) Rat"
]

namespace SIUnit

variable {α : Type u}
variable (u : SIUnit α)

def toRat : Rat :=
  match u.exponent with
  | .ofNat n => ((u.value * 10 ^ n) : Nat)
  | .negSucc n => mkRat u.value (10 ^ n)

def le (a b : SIUnit α) := a.toRat ≤ b.toRat

def lt (a b : SIUnit α) := a.toRat < b.toRat

instance iLE : LE (SIUnit α) := ⟨le⟩

instance iLT : LT (SIUnit α) := ⟨lt⟩

def addAux (min max : SIUnit α) (h : min.exponent ≤ max.exponent) : SIUnit α :=
  let diff : Nat := sorry -- max.exponent - min.exponent
  let multiplier := 10 ^ diff
  sorry

def add (a b : SIUnit α) : SIUnit α :=
  if h : a.exponent ≤ b.exponent then
    addAux a b h
  else
    addAux b a sorry

def add.todo := [
  @addAux
]

def mul (a b : SIUnit α) : SIUnit α := sorry

def sub (a b : SIUnit α) (h : b ≤ a) : SIUnit α := sorry

def mulNat (nat : Nat) (unit : SIUnit α) : SIUnit α := { unit with value := Nat.mul nat unit.value }

def hDivRat (a b : SIUnit α) : Rat := a.toRat / b.toRat

def ofNat (n : Nat) : SIUnit α := {
  value := n,
  exponent := 0
}

def ofScientific (mantissa : Nat) (exponentIsNegative : Bool) (exponent : Nat) : SIUnit α := {
  value := mantissa,
  exponent := if exponentIsNegative then -exponent else exponent
}

-- toNat is impossible

-- fromInt is impossible (can't convert negative Int values)

-- toInt is impossible (can't convert SIUnit values with negative exponent)

-- fromRat is impossible (can't convert negative Rat values)

-- def addNat (n : Nat) : SIUnit := {u with value := u.value }

instance : Coe Nat (SIUnit α) := ⟨ofNat⟩

instance : OfNat (SIUnit α) n := ⟨ofNat n⟩

instance : OfScientific (SIUnit α) := ⟨ofScientific⟩

instance : CoeOut (SIUnit α) Rat := ⟨toRat⟩

instance : Add (SIUnit α) := ⟨add⟩

-- NOTE: `instance : Mul (SIUnit α)` is impossible to implement because it assumes that multiplying two values of the same unit gives the same unit, but actually it gives the same unit squared.

-- instance iDecidableLE (a b : SIUnit α) : Decidable (a ≤ b) := sorry

-- instance iDecidableLT (a b : SIUnit α) : Decidable (a < b) := sorry

instance : HMul Nat (SIUnit α) (SIUnit α) := ⟨mulNat⟩

instance : HMul (SIUnit α) Nat (SIUnit α) := ⟨flip mulNat⟩

instance : HDiv (SIUnit α) (SIUnit α) Rat := ⟨hDivRat⟩

-- instance : Pow (SIUnit α) := ⟨pow⟩

-- instance : HAdd SIUnit Nat SIUnit := 

namespace Example

-- @see Playbook/Generic/Duration.lean
-- @see Playbook/Generic/Distance.lean
