
namespace FierceNerds.Util

/--
 - Laws taken from https://hackage.haskell.org/package/lens-5.2.2/docs/Control-Lens-Lens.html
 -/
class Lens (Source : Type u) (Target : Type v) where
  get : Source → Target
  set : Target → Source → Source
  get_set_law : (s : Source) → (t : Target) → get (set t s) = t
  set_get_law : (s : Source) → (t : Target) → set (get s) s = s
  set_set_law : (s : Source) → (t1 t2 : Target) → set t2 (set t1 s) = set t2 s

namespace Lens
