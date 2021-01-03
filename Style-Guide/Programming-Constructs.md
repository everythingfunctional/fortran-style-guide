# Programming Constructs

These guidelines are intended to avoid common pitfalls leading to poorly designed or structured code.
Such code is generally more difficult to understand and harder to debug.
These guidelines are based heavily on standards developed by NASA [@Gerald2006] and JPL [@JPL2009].

## Simple Control Flow

All code should be restricted to relatively simple control flow constructs.
Do NOT use `goto` statements, deeply nested branching/looping constructs, or indirect recursion.
The use of recursion should be restricted to simple, commonly used algorithms.

Simple control flow translates into stronger capabilities for analysis, often resulting in improved code clarity.
While this rule does not require all procedures to have a single point of return,
this technique often simplifies control flow,
except in situations where an early error return is the simpler solution.
Procedures should only have one point of entry.
Multiple points of entry are and indication that the procedure violates the single responsibility principle and should be separated.

## Data Hiding

Declare all data objects at the smallest possible level of scope.
No declaration in an inner scope shall hide a declaration in an outer scope.

This rule supports the well known principle of data hiding.
If an object is not in scope, its value cannot be referenced or corrupted.
Similarly, if an erroneous value of an object has to be diagnosed,
it will be easier if there are fewer statements where the value could have been assigned.
The rule discourages the reuse of variables for multiple, incompatible purposes, which complicates fault diagnosis.

The rule is consistent with the principle of preferring pure functions that do not touch global data,
that avoid storing local state, and that do not modify data declared in the calling procedure indirectly.
The use of distributed state information can significantly reduce code transparency,
reduce the effectiveness of standard software test strategies,
and complicate the debugging process if anomalies occur.
Good programming practice is to prefer the use of immutable data objects and references.
Procedure parameters should be declared with the qualifier `intent(in)` wherever possible.

## Shared Data

Shared data objects should have a single owner, and only that owner should be able to modify the object.

Ownership equals write permission, but non ownership generally will not exclude read access to a shared object.
Note that this rule does not prevent the use of system wide modules that are not associated with any one task or owner,
but it does place a restriction on how tasks use such modules.
Generally, if a shared object does not have a single owning task,
access to that object has to be regulated with the use of locks or semaphores to avoid access conflicts that can lead to data corruption,
and this process is highly error prone and likely to introduce bugs.

## Language Compliance

All code shall be compiled with all compiler warnings enabled at the most pedantic setting available.
All code must compile without warnings.
The rule of zero warnings applies even when the compiler gives an erroneous warning:
If the compiler gets confused, the code causing the confusion should be rewritten so that it becomes more clearly valid.

It is not uncommon for developers to get caught in the assumption that a warning is invalid,
only to realize later that the message is in fact valid for less obvious reasons.
