library project.my_app;

import 'dart:async';

import 'package:sg/annotation.dart' as sga;

import 'package:sample/bootstrap.dart';

import 'src/component.dart';

@sga.GeneratedPart('package:sample/generator.dart')
part 'app.injection.dart';

main() async {
  // "initializeInjection" is a generated method
  await initializeInjection();

  // do other things
  await bootstrap(MyComponent);
}
