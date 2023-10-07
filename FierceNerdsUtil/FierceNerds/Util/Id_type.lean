namespace FierceNerds.Util

abbrev Id := String

namespace Id

abbrev ids (getId : α → Id) (as : List α) := as.map getId
