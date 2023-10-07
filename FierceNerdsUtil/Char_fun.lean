namespace Char

variable (c : Char)

def isPathSeparator := (c == System.FilePath.pathSeparator)

def isAscii := c.val ≤ 255
