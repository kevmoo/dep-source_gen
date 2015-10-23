/// Annotations for source code that is processed by a source generator.
///
/// This library has no other dependencies.
///
/// * Consider moving this into another package entirely – eliminate potential
///   runtime dependencies.
library sg.annotation;

/// An annotation for [PartGenerator].
///
/// It can only be applied to a `part` declaration.
///
/// ```dart
/// // Example
/// import 'package:sg/annotation.dart';
///
/// @GeneratedPart('package:generator_pkg/generator_lib.dart')
/// part 'app.generated.dart';
/// ```
class GeneratedPart {
  /// [generator] is a path to the library containing the [PartGenerator] to
  /// invoke to generate the target part.
  const GeneratedPart(String generator);
}
