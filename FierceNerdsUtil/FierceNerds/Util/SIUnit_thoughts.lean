import FierceNerdsUtil.FierceNerds.Util.Scaffold

namespace FierceNerds.Util.SIUnit

def spec : Thoughts := [
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

-- def options : Implementations := [
--   {
--     title := "As structure of value : Nat"
--     status := .blocked
--     code := "
--       structure SIUnit [ToExponent α] (unit : α) where
--         value : Nat
      
--       def add [ToExponent α] {unit : α} (a b : SIUnit unit) := sorry

--       ---

--       inductive Duration where
--         | second
--         | microsecond
--     "
--     thoughts := [
--       "But it doesn't allow to use only a fixed number of exponents"
--     ]
--   },
--   {
--     title := "As structure of value and exponent",
--     status := .done,
--     code := " -- implemented --
--       structure SIUnit (α : Type u) where
--         value : Nat
--         exponent : Int
      
--       def add (a b : SIUnit α) := sorry

--       ---

--       inductive Duration.Placeholder where

--       def Duration := SIUnit Duration.Placeholder
--       def meter : Duration := ⟨1, 0⟩
--       def kilometer : Duration := ⟨1, 3⟩
--       abbrev meters := meter
--       abbrev km := kilometer
--       abbrev kilometers := kilometer
--       def two_meters := 2 * meters
--       def two_kilometers := 2 * kilometers

--       inductive Distance where
--     "
--   },
--   {
--     title := "As Rat, but with a dummy type argument to simulate nominal typing",
--     status := .blocked
--     code := "
--       def SIUnit (α : Type u) := Rat
--     ",
--     thoughts := [
--       "Lean still thinks that nominally different types are equal" ♢ [
--         "Because they reduce to the same term"
--       ]
--     ]
--   }
-- ]

def SIUnit.todo : Thoughts := [
  "Implement instance : Coe (SIUnit α) Rat"
]
