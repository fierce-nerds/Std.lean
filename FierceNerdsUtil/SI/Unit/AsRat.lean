import Std.Data.Rat.Basic

namespace FierceNerdsUtil

def SI.Unit.AsRat (α : Type u) := Rat

namespace SI.Unit.AsRat

variable (α : Type u)

instance : IntCast (SI.Unit.AsRat α) := ⟨Rat.ofInt⟩

instance : OfNat (SI.Unit.AsRat α) n := ⟨n⟩

namespace Example

inductive Distance.Placeholder where

abbrev Distance := SI.Unit.AsRat Distance.Placeholder

inductive Duration.Placeholder where

abbrev Duration := SI.Unit.AsRat Duration.Placeholder

def a : Distance := 1
def b : Duration := 1
def c : String := "1"
def f : Nat → Nat := fun x => 1

def h : a = b := sorry

namespace AsDefRat

  def Distance := Rat
  def Energy := Rat
  deriving instance DecidableEq for Distance

  def d : Distance := Rat.ofInt 1
  def e : Energy := Rat.ofInt 1
  #check d = e -- unexpected
  -- def d_eq_e : d = e := by decide

end AsDefRat

namespace AsStructure

  structure Distance where
    value : Rat

  structure Energy where
    value : Rat

  def d : Distance := ⟨Rat.ofInt 1⟩
  def e : Energy := ⟨Rat.ofInt 1⟩
  #check_failure d = e -- expected
  -- example : True := by
  --   fail_if_success (have : d = e := by admit)
  --   constructor
end AsStructure

namespace AsDifferentTermsReducingToSameType

  -- The type class resolution does not unfold "def", so `(a : Distance) + (b : Energy)` will fail

  def Distance := Rat
  def Energy := Rat

  def d : Distance := Rat.ofInt 1
  def e : Energy := Rat.ofInt 1
  #check_failure d + e
  #check d = e
  #check_failure ((fun x => by decide) : (u : Unit) →  d = e) -- failed to synthesize `Decidable (d = e)`

end AsDifferentTermsReducingToSameType
