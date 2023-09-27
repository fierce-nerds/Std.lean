# Definitions

## Importal

A file that contains imports of all files in the subordinate directory

## Subordinate directory of a file

```lean
def Subordinate (file : File) (dir : Directory) := And
  (dir.basename = file.basename)
  (String.startsWith file dir)
```
