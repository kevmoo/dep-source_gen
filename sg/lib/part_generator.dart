library sg.part_generator;

import 'dart:async';

import 'package:analyzer/src/generated/element.dart';

import 'cacheable_generator.dart';

export 'cacheable_generator.dart';

abstract class PartGenerator extends CacheableGenerator<LibraryElement> {
  const PartGenerator();

  /// in the case of an analysis context, this is where the rubber hits the
  /// road.
  Future<LibraryElement> loadCache(String sourcePath) {
    throw 'not impld';
  }

  Future<CacheEntry> writeCache(LibraryElement value) {
    throw 'not impld';
  }

  /// This method is implemented by subclasses.
  ///
  /// All of the reading/writing of caches is handled here. The creator of the
  /// generator just gets the `LibraryElement` instance
  /// (without generated parts) and is expected to return the content of a part.
  ///
  /// Open design questions:
  /// 
  // TODO: not strictly needed. Here to document pass-through abstract method
  Future<FileOutput> generate(LibraryElement libraryElement);
}
