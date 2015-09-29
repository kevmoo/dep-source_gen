# Source generation in Dart - PRE-DRAFT

## Contact information

* Author: [Kevin Moore](https://github.com/kevmoo) ([kevmoo@google.com](kevmoo@google.com))
* Repository: https://github.com/kevmoo/dep-source_gen
* Stakeholder:
  * [Bob Nystrom](https://github.com/munificent) - author of external library proposal, discussed partial classes ideas
  * *Lasse* - discussions about partial classes
  * *Builders/users of transformers that relate to this feature*

## Summary

A proposal for a standardized, fast, tool-able, debug-able, source code generation model for Dart.

## Motivation

* Code generation is powerful enabler in any language ecosystem.
* Code generation is particularly important in Dart web applications as a way to remove runtime reflection – `dart:mirrors` – before compiling to Javascript.
* The current solution – Barback transformers – has a number of drawbacks.
  * It encourages code transformation – changing a file in place. This means transformed code must be generated separately from existing code.
  * This separation makes debugging and incremental compilation difficult if not impossible.
  * Debugging transformer code is also difficult because the output is not easily accessible.

## Goals

* Eliminate speed concerns for developers using source generation (currently Transformers), especially for large projects.
  * Result: Cut by half (or more? An absolute value?) the time spent in code generation for large applications compared to the current transformer-based solution.
* Support the existing use cases for Angular and Polymer.
  * Result: Angular and Polymer eliminate their usage of transformers while maintaining the same or better runtime characteristics.
* Support on-disk code generation so generated code can have the same visibility as hand-written code.
  * Result: Debugging generated code is as easy as debugging hand-written code.
  * Result: Debugging a code generator is straight-forward – the result is right there on the filesystem.

## Requirements

* Maintain a strict separation between user-generated and tool-generated source.
  * Provide a strong naming and/or location semantic to distinguish the two.
  * As a rule, the code generator will never overwrite user-generated code.
* Allow files to be generated "next to" the Dart files they are associated with.
  * Allow the generated component of `lib/foo.dart` to be generated at `lib/foo.g.dart` or `lib/generated/foo.dart` or similar.
  * Essential for packages with generated code. Packages should include generated code when published.
* Allow files to be generated in a way that allows easy exclusion from source management tools.
  * Google's internal source management tools discourage committing generated source.


## Examples

### Angular 2 Bootstrap

*Hand authored*
```dart
// app.dart

import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';

// @Generate(package:angular2/bootstrap.dart)
part 'app.g.dart';

void main() {
  bootstrap(MyApp);
}

@generateBootstrap
Future<ApplicationRef> bootstrap(Type appComponentType,
    [List componentInjectableBindings]);

```

*Generated*

```dart
// app.g.dart

Future<ApplicationRef> bootstrap(Type appComponentType,
    [List componentInjectableBindings]) {

  // register reflective access
  // call core bootstrap method
}

```

### JSON serialization

*Hand authored*
```dart
// customer.dart

import 'package:json_serial/json_serial.dart';

part 'customer.g.dart';

@JsonSerializable
partial class Customer {
  final int id;
  final String firstName, lastName;

  Customer(this.id, this.firstName, this.lastName);

  factory Customer.fromJson(json);

  Map<String, dynamic> toJson();
}

```

*Generated*

```dart
// customer.g.dart

partial class Customer {
  factory Customer.fromJson(json) =>
      new Customer(json['id'], json['firstName'], json['lastName']);

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'lastName': lastName
      };
}
```

### Polymer observables


*Hand authored*
```dart
// customer.dart

import 'package:observable/observable.dart';

part 'customer.g.dart';

partial class Customer extends Observable {
  @observable String firstName;
}

```

*Generated*

```dart
// customer.g.dart

partial class Customer {
  String _firstName;
  String get firstName => _firstName;
  set firstName(String newValue) {
    var oldValue = _firstName;
    _firstName = newValue;
    notifyChanges(#firstName, oldValue, newValue);
  }
}
```

## Proposal

```dart
Future pseudoCode(project) async {

  var generators = await getConfiguredGenerators(project);






}
```

### Dependencies

* Language
  * ??? *partial classes*.
  * ??? Something that looks like abstract top-level members.

## Alternatives

### Member Interceptors

https://github.com/sigmundch/DEP-member-interceptors/blob/master/proposal.md

*Details TBD*

## Implications and limitations

*tbd*

## Inspiration

### go generate

* [Introduction from blog](https://blog.golang.org/generate)
* [Proposal](https://docs.google.com/document/d/1V03LUfjSADDooDMhe-_K59EgpTEm3V8uvQRuNMAEnjg/edit)

### Rust

*TODO*
