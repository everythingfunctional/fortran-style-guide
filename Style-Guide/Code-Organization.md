# Code Organization

## Ordering

The ordering of executable statements is obviously important for the correctness of code,
but there are other things for which the order does not matter to the compiler or for the correctness of the code,
but a good convention can still make things easier to find.
Also, the language defines that all use statements come before any declarations,
and all declarations come before any executable statements.
But there may be many of each of these statements, and they may contain many pieces.
So let's talk about how to order them and their parts.

### Use Statements

Alphabetize the `use` statements by module name.
Always use the `only` clause to explicitly declare what you are importing from the module.
Group the items imported by type(s), then procedure(s), then variable(s), and alphabetize within each group.
Follow the last `use` statement with a blank line.

### Declarations

Declare one variable per statement.
Group the declarations by argument(s), then parameter(s), then local variable(s), separated by blank lines.
Declare the arguments in the same order that they appear in the argument list.
Declare the parameters and local variables in alphabetic order.
Follow the last declaration with a blank line.

### Procedures

Order procedures alphabetically with blank lines separating them.
There may be other, more logical orderings, but generally,
the frequency that you need to find a specific procedure far exceeds the frequency that you want to read them in a specific order.

### Type Declarations

There are frequently inter-dependencies between types such that strictly alphabetic ordering is not possible,
because a type must be declared before another type can have it as a component.
Order type declarations as necessary to satisfy this requirement, but alphabetic otherwise, with blank lines between them.

## Module Contents

A module should generally serve one of the following purposes:
contain a single type declaration and its type bound procedures,
contain a collection of related types, operators and procedures for a specific domain,
or simply a collection of procedures within a specific category.
The module should then be named for the type, domain or category respectively.

Additionally, to the extent that you can, you should limit the scope of any procedures.
Any type bound procedures should be private, and only callable via instances of the type (i. e. `object%procedure(args)`).
Procedures which are semantically the same, but with slightly different arguments, should be combined in an interface, with only the interface being made public.
Any procedures which are not needed outside the module should be private.
Any procedures which are used only from a single procedure should be contained in that procedure.


## Files

A file should contain a single module or a single program, and should be named the same as the module or program.
For small to medium sized projects, keeping all the source files in a single folder works just fine.
When projects start to grow larger and more complex, a more elaborate organization becomes necessary.
While Fortran does not support namespaces (yet), one could emulate the idea by simply using the following convention.
Simply prefix module names with the namespace, and put all modules with a common namespace in a folder with that name.
The file names then only need to include the last part of the module name.
For example, a collection of operators for a vector type might be in a module `vector_operators_m`, in a file `operators_m.f90` in the folder `vector`.
