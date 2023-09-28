# Definitions

## Importal

A file that contains imports of all files in the subordinate directory

## Subordinate directory of a file

```lean
def Subordinate (file : File) (dir : Directory) := And
  (dir.basename = file.basename)
  (String.startsWith file dir)
```

### Parent repo

A repo that is listed as a dependency in the [child repo](#child-repo) lakefile.

```lean
def Parent [Coe Repo Url] [Coe Repo Package] [Coe Package (Array Dependency)] (child : Repo) (parent : Repo) := 
  let childPkg : Package := ↑child
  let parentPkg : Package := ↑parent
  let childDeps : Array Dependency := ↑childPkg
  childDeps.contains (
    match ·.src with
      | .path dir => false
      | .git url rev subDir => url == ↑parent
  )
```

### Child repo

A repo that lists the [parent repo](#parent-repo) as a dependency in the lakefile.
