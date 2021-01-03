# Names

Names are incredibly important.
They are the best - if not only - way of communicating intent to readers.
Take the time to pick good, descriptive names for things.
Don't use uncommon or difficult to read abbreviations.
Don't use the same words to describe things which are semantically different,
and be consistent about using the same word to describe things which are semantically the same.
My favorite guidance for selecting names comes from Chapter 2 of Clean Code [@Martin2009].

Fortran has a few interesting characteristics which drive towards a more “noisy” naming convention.
First, Fortran is case insensitive.
Meaning `some_thing`, `Some_Thing`, `SoMe_ThInG`, and `SOME_THING` would all refer to the same thing.
So while you can use capitalization to signify certain things to the reader,
they are generally avoided because compilers and other tools generally convert everything to upper or lower case anyways,
so any error messages may not necessarily match your code.

Secondly, all names live in the same “space”.
Meaning modules, programs, procedures, types and variables must all have different names.
Scope still exists, so one module may have a type with some name, and a different module may have a variable with the same name,
but within the same scope, a type may not have the same name as a variable.

Lastly, keywords in Fortran are not reserved words.
Meaning it is possible (but not recommended) to have a variable named `if`.
So something like the following would be horrible, but valid code.

```Fortran
if (if) then
    then = else
else
    else = end
end if
```

## Naming Convention

All names should be lowercase, with words separated with underscores.
However, variables declared as `parameter` should be all caps.
This is the one case where location, context and syntax don't quite sufficiently disambiguate,
and the added clarity can be quite significant.
Module names should be suffixed with `_m`, as it is quite frequent to have a procedure with the same name, or a type with the same name as the module.
Type names should be suffixed with `_t`, as it is quite frequent to have a variable with the same name as the type.

There are three main roles of a module

1. define a type and its type bound procedures
2. define a collection of procedures within some category
3. define a collection of types and procedures sufficient for constructing a grammar and model of some domain

For modules in role 1, the module should have the same name as the type it defines.
For modules in role 2, the module should have the name of the category,
and for role 3, the module should have the name of the domain.

Derived types are generally used as a way to represent some quantity or entity.
The name of a type should be a noun or noun phrase that describes the quantity or entity to be represented by the type.

Variables store a specific value or instance of a quantity or entity.
The name of a variable should be a noun or noun phrase that describes the specific quantity or entity stored.

Procedures operate on and/or create quantities and/or entities.
Procedure names should be a verb or verb phrase describing the operation performed, or the quantity/entity created.
