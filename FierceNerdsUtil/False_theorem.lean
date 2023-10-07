namespace False

theorem congr {a b : α} (f : α → β) (nh : f a ≠ f b) : a ≠ b := fun (h : a = b) =>
  let hca := congrArg f h
  absurd hca nh
