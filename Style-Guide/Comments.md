# Comments

Comments are a contentious subject.
Historically, the conventional wisdom has been that all code is hard to read and understand,
therefore comments were seen as necessary for describing the what and how of a piece of code.
The mantra “make sure you comment your code” has been seen as an unmitigated force for good,
frequently known and repeated even by non programmers.

But, as we have seen throughout this guide, our goal is to write code that is easy to read and understand.
If we have achieved that goal, then at best the comments are superfluous and redundant.
Therefore we should view comments as an admission that we have failed to achieve our goal of properly expressing ourselves in the code.
We should not view comments as necessary and a force for pure good.
In fact there are reasons to avoid comments, as we shall soon see.

## Comments are Noisy

When trying to read and understand a piece of code,
every bit of text takes up some bandwidth of the information trying to get into your brain.
If we have achieved our goal of well written code,
then at best the comments are telling me things I already would have figured out from the code.
Even worse, they may be irrelevant to the bit of logic I'm trying to understand.
For example, reading a line like `j = j + 1 ! Increment i`, the comment is redundant,
taking up mental bandwidth when I'm probably trying to figure what the loop that line is almost certainly within is doing.

## Comments can Lie

The compiler doesn't check your comments.
In fact, with the pace of development, when code is modified quickly under tight deadlines,
trying to fix bugs and add features, the comments are almost certainly the last things to get updated, and are easily forgotten.
Comments can then become out of date, irrelevant, or even outright wrong.
For example, read the comment in the example in the previous section,
and you'll notice that the comment says it increments `i`, but the code actually increments `j`.
I've seen comments like that, and comments that lie on an even grander scale, in quite sophisticated code bases.
Having been bitten by this problem enough times, I am always quite skeptical when reading comments.

## Comments can Float Away

Another thing that often happens to comments,
is that they float away from the code that they actual try to describe.
As code gets copied and pasted, code gets added in the middle, and other modifications happen,
comments can end up quite far from the code they were written to describe.
A reader can then easily be distracted from the task at hand trying to track down the code the comment is supposed to go with.
These kind of stray comments can be at least as, if not more, noisy than redundant comments.

## Commented Out Code

Don't leave commented out code lying around.
Future readers will have no idea why it's there.
Will something break if I uncomment it?
Is something broken now because this is commented?
Was this intended for some future development?
You don't need to save it “for posterity”.
Your version control system will always have a copy if you ever really need it again.

## When to Use Comments

Given all the reasons to avoid using comments, are there cases where comments are appropriate?
Comments are most useful when they describe why a piece of code was written the way that it was, or how it is intended to be used.
For example, a useful comment might be “this algorithm was chosen over x, y, or z algorithms because the type of data we're working with is more amenable to ...”.
This is the kind of information that would be almost impossible to express in the “how” of the code, but could be invaluable to future maintainers.

Another example of a useful comment might be “make sure the array is sorted before calling this procedure, because x, y or z might go wrong. Typical usage would be `do_thing(sorted(the_array))`”.
There might be performance or organizational reasons that these types of assumptions or error conditions may not be expressed or checked for within the code,
but would of course be important to keep in mind for any future maintainer.

Another acceptable use of comments is for use with automated documentation generators.
It is frequently desirable to provide documentation for a library that describes the procedures and types that should be used by external code, and how they should be used.
By keeping such documentation in the source code and using a tool to automatically extract it,
it becomes at least somewhat more likely that it will be kept up to date as the code gets modified.

So while comments aren't all bad, they certainly aren't a force for pure good.
They should be used judiciously and with purpose.
What a piece of code does and how it does it should be evident from the code itself.
The why and use cases can, and often should be explained by some well written comments.
