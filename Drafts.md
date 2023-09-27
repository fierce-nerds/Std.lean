# Drafts

## Decisions

### Get filesystem layout

#### Declaration brand

* Type
  * Regular
  * Subtype
  * Field of a regular type
* Typeclass
* Typeclass instance
* Function on a type
* Coercion
* Data

#### Filters

* Must allow adding funs to the namespaces
* Should use the "Def" keyword, not "Type" keyword (because some types are Props)

### Estimators

* Time to find the declaration via search
* Time to find the file via search
* Time to find the right tab in the list
* Count of import commands
* How closely the file name matches the namespace

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
      * ListUniqueBy/Coe.lean
      * ListUniqueBy/Fun.lean
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

#### Decision

* Use BrandTypeV2
  * VSCode would show the 
