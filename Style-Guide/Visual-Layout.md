# Visual Layout

The visual structure of code alone can communicate a wealth of information to the reader, without even focusing on the letters or words used.
As an example, see the figure below where I’ve simply used rectangles in place of the text of the code.
It immediately becomes recognizable as a procedure, with an argument list, declarations, and the body of the code with what is likely an if/else block.
The layout communicates all this information without a single, legible character needed.

![Visual Layout Example](Style-Guide/figures/visual-layout-example.png)

## Indentation

Indentation is one of the most powerful tools available for using layout to convey the structure of code.
I use 4 spaces for each level of indentation.
This makes identifying different levels of indentation in multiply nested, or lengthy sections of code much easier.
Each statement inside a block is indented one level more than the statements that begin and end that block.
This includes the beginning and ending statements of a program or module.
This discourages the use of deeply nested code structure or overly long lines, which can be a sign of overly complicated code that should be refactored and simplified.
An example of this structure is shown bellow.

```Fortran
module something_m
    ...
contains
    ...
    function do_something(arg1)
        ...
        ...
        thing = &
                this_statement &
                is_really &
                long
        if (thing) then
            ...
        else
            ...
        end if
    end function
    ...
end module
```

Continued lines are indented two levels more than the first line of a statement.
This ensures that the statement is readily identified as being split across multiple lines,
and there is visual distinction between the continued lines and subsequent statements,
even if the following statement is indented (i. e. a long if statement is split across multiple lines as demonstrated below).

```Fortran
if ( &
        this == that &
        .and. other < another) then
    thing = doodad
    ...
```

## Blank Lines

Blank lines are a great way to delineate sections of code without adding visual clutter.
I use one blank line between procedures,
one blank line between the use statements and the declarations,
and between the declarations and the executable statements.
Strive to minimize any blank lines between executable statements,
as sections of logic inside a procedure call for breaking those sections out into their own procedures.
The following illustrates the use of blank lines in some example code.

```Fortran
module something_m
    use some_m, only: ...
    use another_m, only: ...

    implicit none
    private

    integer, parameter :: THE_ANSWER = 42

    public :: do_something
contains
    function do_something(arg1, arg2) result(answer)
        real, intent(in) :: arg1
        real, intent(in) :: arg2
        real :: answer

        answer = THE_ANSWER + arg1 - another_thing(arg2)
    end function

    function another_thing(arg3) result(another)
        real, intent(in) :: arg3
        real :: another

        another = arg3 * 2.0 / 3.0
    end function
end module
```

## Line Length

It is widely agreed upon throughout the software community that there should be some limit on the length of lines.
What that limit should be is highly debated, and usually boils down to a matter of personal preference and arguments about screen size.
Historical values are usually based on limitations of early computer equipment,
with screens only being able to display 80 characters, punch cards being limited to 72 characters, etc.
However, we can look to research in the field of typography and ease of reading for some guidance on the matter.

For printed text it is widely accepted that line length fall between 45–75 characters per line (cpl),
though the ideal is 66 cpl (including letters and spaces) [@bringhurst1996the].
For electronic text, studies have shown that optimal line length is a bit more complicated.
For example, longer lines would then be better suited for cases when the information will likely be scanned,
while shorter lines would be appropriate when the information is meant to be read thoroughly [@Ling_2006].
As source code is generally meant to be read thoroughly, it would suggest we should try and keep line lengths to a minimum.
More complicated lines also tend to be longer, and so by keeping line lengths shorter, we can keep complexity to a minimum.

I recommend setting your editor to identify column 80, and treating that as a strong suggestion.
Lines that go past 80 by a few characters may be okay,
but much more than that should be continued,
or ideally split into separate statements and simplified.

## Space Within a Line

White space used appropriately within a line can also make individual statements easier to read and understand.
The spacing on a line should be as follows:

* There should be no space between the name of a procedure and the opening parenthesis
* There should be no space between an opening bracket/parenthesis and the first item inside it, or between the last item and the closing bracket/parenthesis
* There should be no space before a comma or semicolon, and one space after
* There should be a space on either side of a binary operator, including the assignment operator (`=`) and comparison operator (i. e. `>=`). (i. e. `z = x + y`)
  – One exception would be in cases where multiple operators appear on the same line and the order of operations is important (i. e. `2*x + 3*y`).
    Be careful that the spacing is actually correct because something like `2 * x+y * 3` gives the impression to the reader that it means `2 * (x+y) * 3`, while the compiler still performs `2*x + y*3`
* There should not be a space between a unary operator and its operand (i. e. `x = -y`)

## Breaking Long Lines

While it is recommended to keep line length and complexity to a minimum, sometimes long statements are inevitable.
In those cases, a good convention can help ensure these statements are still easily understood.
For statements that do not fit on one line, use the following guidelines for breaking/wrapping the statement onto multiple lines.
The goal here is to break lines and align continued lines in such a way that related items appear together (i. e. the argument list for a function),
lists appear in a single row (i. e. all on one line, or one item per line), and renaming of any item in the statement does not disrupt the alignment.

* When the name of a procedure and its arguments do not fit on the same line,
  break the line after the opening parenthesis and indent the following line(s) two levels.
  Either put all the arguments on one line, or one argument per line.
  See the examples below.

```Fortran
function this_is_a_long_function_name( &
        with, lots, of, arguments) result(thing)
    ...

function this_is_another_really_long_name( &
        with_really_long, &
        argument_names, &
        on_multiple_lines) &
        result(thing)
    ...
```

* Break lines before operators (except the assignment operator) and indent the following line(s) two levels.
  See the examples below.

```Fortran
this_really_long_variable = &
        another_long_variable * something_else &
        + another_thing

this_variable = comes_from_a_function( &
        with, lots, of, arguments)

this_other_really_long_variable = &
        comes_from_another_function( &
                with_some_long, &
                argument_names)

this_super_duper_long_variable_name = &
        comes_from(short, things)
```

## Procedure Length

Keep procedure length to a minimum.
How long is too long?
Pretty short.
What's the ideal length?
Shorter than that.
I tend to try and stick to no more than 10 executable statements.
If it is longer than that it is probably doing too much, or getting bogged down in the details.
Extract sections of such code into their own procedures.
This allows the code to read at a higher level of abstraction and reduces the complexity.
