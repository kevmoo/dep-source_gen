# Source generation in Dart - PRE-DRAFT

## Contact information

* Author: [Kevin Moore](https://github.com/kevmoo) ([kevmoo@google.com](kevmoo@google.com))
* Repository: https://github.com/kevmoo/dep-source_gen
* Stakeholder:
  * [Bob Nystrom](https://github.com/munificent) - author of external library proposal
  * *Builders/users of transformers that relate to this feature*

## Summary

A proposal for a standardized, fast, tool-able, debug-able, source code generation model for Dart.

## Motivation

* Code generation is powerful enabler in any language ecosystem.
* Code generation is particularly important in Dart web applications as a way to remove runtime reflection – `dart:mirrors` – before compiling to Javascript.
* The current solution – Barback transformers – has a number of drawbacks.
  * It encourages code transformation – changing a file in place. This means transformed code must be generated separately from existing code.
  * This separation makes debugging and incremental compilation difficult  difficult if not impossible.
  * Debugging transformer code is also difficult because the output is not easily accessible.

## Goals

* Enable incremental code generation.
  * Result: Cut by half (at least) the time spent in code generation for large applications compared to the current transformer-based solution.
* Support the existing use cases for Angular and Polymer.
  * Result: Angular and Polymer eliminate their usage of transformers while maintaining the same or better runtime characteristics.
* Support on-disk code generation – leveraging the external library work – so generated code can have the same visibility as hand-written code.
  * Result: Debugging generated code is as easy as debugging hand-written code.
  * Result: Debugging a code generator is straight-forward.

## Requirements

* Maintain a strict separation between user-generated and code-generated source.
  * Provide a strong naming and/or location semantic to distinguish the two.
  * Forbid overwriting user-created code files.
* Allow files to be generated "next to" the Dart files they are associated with.
  * Allow the generated component of `lib/foo.dart` to be generated at `lib/foo.g.dart` or `lib/generated/foo.dart` or similar.
  * Essential for packages with generated code. Packages should include generated code when published.
* Allow files to be generated in a way that allows easy exclusion from source management tools.
  * Google's internal source management tools discourage committing generated source.


## Examples

*tbd*

## Proposal

*tbd*

## Alternatives

*tbd*

## Implications and limitations

*tbd*

## Deliverables

*tbd*

### Language specification changes

*tbd*

### A working implementation

*tbd*

### Tests

*tbd*

## Patents rights

TC52, the Ecma technical committee working on evolving the open [Dart standard][], operates under a royalty-free patent policy, [RFPP][] (PDF). This means if the proposal graduates to being sent to TC52, you will have to sign the Ecma TC52 [external contributer form][] and submit it to Ecma.

[tex]: http://www.latex-project.org/
[language spec]: https://www.dartlang.org/docs/spec/
[dart standard]: http://www.ecma-international.org/publications/standards/Ecma-408.htm
[rfpp]: http://www.ecma-international.org/memento/TC52%20policy/Ecma%20Experimental%20TC52%20Royalty-Free%20Patent%20Policy.pdf
[external contributer form]: http://www.ecma-international.org/memento/TC52%20policy/Contribution%20form%20to%20TC52%20Royalty%20Free%20Task%20Group%20as%20a%20non-member.pdf
