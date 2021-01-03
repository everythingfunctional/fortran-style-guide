# Motivation

One key aspect of software development is that code needs to be readable by human beings, not just machines.
The following quote emphasizes just how important human readability is.

> “Indeed, the ratio of time spent reading versus writing is well over 10 to 1.
> We are constantly reading old code as part of the effort to write new code.
> ...[Therefore,] making it easy to read makes it easier to write.”
>
>– Robert C. Martin, Clean Code: A Handbook of Agile Software Craftsmanship

In fact, code that cannot easily be read and understood quickly becomes hard to use and hard to change, making it useless code.
Even if the code “works” today, what it does now isn’t what it will always need to do, and if you can’t change it, the code becomes obsolete.

While a good style guide may not be sufficient for ensuring your code is readable and understandable, it is almost certainly necessary.
A good style guide, consistently followed, can help reduce the mental overhead required to read and understand code.
When reading a section of code, you can find things where you expect them to be found,
horizontal and vertical white space become visual cues that guide the eyes and reveal structure in the code,
and naming conventions and capitalization style can embed even more detail without requiring additional verbosity.

Even when these little bits of mental overhead may seem small and inconsequential, I can promise you that they add up.
When you're trying to reason about and fit all of the complexities of some complicated code into your head, every little bit helps.
So anything we can do to make this job even a little bit easier is time well spent.

Also included are some guidelines for software design and construction.
In general they conform to industry standard practices and conventions.
They are not intended to be dogmatic, but to focus on producing code that is readable, understandable and maintainable with a consistent style.
There may be some instances where adherence to these guidelines would not achieve these goals, and in those instances you should do what produces the best code.

NOTE: What is readable and understandable should always be judged by someone other than the author.
If you wrote the code, of course you’ll be able to understand it.
But it is far more important that others also be able to understand it.
That other person may even be you six months, or even 10 years from now.
