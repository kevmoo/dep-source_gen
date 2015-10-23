/// This is the library reference in annotations and configuration
///
///  * One public generator per file – similar to Transformers
library injection.generator;

import 'dart:async';

import 'package:analyzer/src/generated/element.dart';
import 'package:sg/sg.dart';

/// `extend` (maybe `implement`) a `Generator` base class.
///
/// In this case, we're using `PartGenerator`.
class InjectionGenerator extends PartGenerator {
  const InjectionGenerator();

  /// This method will yield the contents of a part file, specifically one with
  /// one public method `initializeInjection`.
  ///
  /// Thoughts:
  ///
  ///  * Option to make the method private? Hmm...
  ///
  /// Design questions:
  ///
  ///  * How is configuration provided to this class? For instance, flags to opt
  ///    in to a private method? Or to generate a method with a specific name?
  Future<FileOutput> generate(LibraryElement libraryElement) async {
    throw 'not impld';
  }
}
