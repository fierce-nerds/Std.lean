# Drafts

## Decisions

### Filesystem layout

#### Declaration brand

* Type (`Type`)
  * Regular
    * Generic
      * `inductive`
      * `structure`
      * `def` | `abbrev`
    * Subtype
      * `def` | `abbrev`
    * Specialization (concrete type of a type family)
      * Examples
        * `abbrev Point := Nat × Nat`
  * Field of a regular structure
* Typeclass (`Class`)
* Typeclass instance (`Instance`)
* Function on a type (`Fun`)
* Coercion (`Coe`)
* Data (`Data`)
* Theorem (`Theorem`)
* Macro (`Macro`)
* Other (`Other`)

#### Filters

* Must allow adding funs to the namespaces
* May use the "Type" keyword (because every `inductive` declaration is called "inductive type")
* Must not pollute the native namespaces
  * Examples
    * `def singleton (c : Char) : String := ⟨[c]⟩` must be in `FierceNerdsUtil.String` namespace, not `String` namespace
* Must determine the namespace of the function according to the type family of the output (not the type of any of the inputs)
  * Examples
    * `def singleton (c : Char) : String := ⟨[c]⟩` must belong to `FierceNerdsUtil.String` namespace, not `FierceNerdsUtil.Char` namespace
* Must determine the namespace of the `Coe`-like instance by the 
* Must place the typeclasses into their own namespaces (because they are actually types)

#### Estimators

* Time to find the declaration via search
* Time to find the file via search
* Time to find the right tab in the list
* Count of import commands
* How closely the file name matches the namespace
* Whether file name contains non-ASCII characters
  * May need to be escaped in the shell
  * Makes it more difficult to write code that manipulates them

#### Outline

* In search, VSCode shows the filename first, followed by directory
* In tab title, VSCode shows only the filename

#### Questions

* How granular the files should be?
  * Outline
    * If every declaration is in each own file, then the list of imports becomes too large
      * The build time increases
      * The navigation time increases
    * The user can control the typeclass resolution (including coercions) by setting priorities
  * Options
    * Extreme: one declaration per 
* How to deal with "child types"?
  * Examples
    * ListUniqueBy
  * Options
    * Place them at the same level

#### Options

* Brand-first
  * Examples
    * BrandFirstV1
      * Type/ListUniqueBy.lean
      * Coe/ListUniqueBy_List.lean
* Type-first
  * Examples
    * TypeFirstV1
      * ListUniqueBy.lean
        * Contains import commands for each file in subdirectory
      * ListUniqueBy/Type.lean
      * ListUniqueBy/Instance/Coe.lean
      * ListUniqueBy/Instance.lean
      * ListUniqueBy/Fun/Basic.lean
* Type-forward
  * Examples
    * TypeForwardV1
      * ListUniqueBy.lean
        * Contains type declaration
        * Does not contain import commands for each file in subdirectory
      * ListUniqueBy/Coe.lean
      * ListUniqueBy/Fun.lean
* Brand-type
  * Options
    * "{brand}_{type}.lean"
    * "{brand}'{type}.lean"
    * "{brand}∘{type}.lean"
    * "{brand}·{type}.lean"
    * "{brand}⟩{type}.lean"
    * "{brand}†{type}.lean"
    * "{brand}▸{type}.lean"
    * "{brand}✦{type}.lean"
    * "{brand}★{type}.lean"
    * "{brand}{type}.lean"
    * "{type}{brand}.lean"
  * Examples
    * BrandTypeV1
      * ListUniqueBy.lean
        * Contains import commands for each file in subdirectory
      * ListUniqueByType.lean
      * ListUniqueByCoe.lean
      * ListUniqueByFun.lean
    * BrandTypeV2
      * ListUniqueBy.lean
        * Contains import commands for each file in subdirectory
      * ListUniqueByDef.lean
      * ListUniqueByCoe.lean
      * ListUniqueByFun.lean
    * BrandTypeV3
      * ListUniqueBy.lean
        * Contains import commands for each file in subdirectory
      * TypeListUniqueBy.lean
      * CoeListUniqueBy.lean
      * FunListUniqueBy.lean
  * Notes
    * Compound brands can be created with `∘` (example: `Char∘String`)
    * Imports need to be quoted: `import FierceNerdsUtil.«Char∘String·Coe»`

#### Decision

* Use BrandTypeV2

### Code sharing setup

#### Projections

* canEditFilesInMultiplePackagesFromSingleWorkspace
  * Can update the [parent repo](./Definitions.md#parent-repo) while working on the child repo
* canSharePackagesWithOtherDevelopers
* canUseCodeActionsInParentPackages

#### Options

* Develop in separate repos
  * Write the initial code in a single repo
  * Use the same namespace (e.g. `FierceNerdsUtil`)
  * Maybe: use a special lib to indicate definitions that should be extracted (e.g. `Extract`, `Addon`)
  * Move the files to intended repos
    * Options
      * Manually
      * Automatically via script
        * Merge existing files
* Conditional definition in lakefile
  * `let source : Source := if getEnvVar s!"{pkgName}_USE_LOCAL_DEPS" then .path _ else .git _ _ _`
* Submodules
* Hack in pre-commit
  * Replace the `.path` dep with the `.git` dep before commit
  * Restore it after commit
* Ask lurk-lab devs
* Ask on Zulip

#### Decision

* Develop in separate repos
  * It's the only one that supports `canUseCodeActionsInParentPackages`
