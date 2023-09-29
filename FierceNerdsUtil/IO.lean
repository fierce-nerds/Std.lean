namespace FierceNerdsUtil.IO

def halt [ToString α] (errorCode : UInt32) (messages : List α) : IO UInt32 := do
  let out := if errorCode = 0 then (← IO.getStdout) else (← IO.getStderr)
  for message in messages do
    message |> toString |>.push '\n' |> out.putStr
  pure errorCode
