import Std.Data.Rat

open Lean (ToJson FromJson RBMap)

instance : ToJson Rat where
  toJson a :=
  --   let obj := (RBMap.ofList [
  --   ⟨"num", ToJson.toJson a.num⟩,
  --   ⟨"den", ToJson.toJson a.den⟩
  -- ]).val
    .obj sorry 
  

instance : FromJson Rat where
  fromJson? j := sorry

