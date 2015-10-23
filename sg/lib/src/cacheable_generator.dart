library sg.cacheable_generator;

import 'dart:async';

/// A `Generator` that uses cacheable representations of file sources.
///
/// Use case:
///
///  * The inputs to generator require expensive (in time/memory)
///    processing each time the generator is run.
///  *
abstract class CacheableGenerator<T> {
  const CacheableGenerator();

  ///
  Future<T> loadCache(String sourcePath);

  Future<CacheEntry> writeCache(T value);

  Future<FileOutput> generate(T libraryElement);
}

abstract class FileOutput {
  // from String
  // from Stream<List<int>>
  // from Stream<List<String>>
  // etc
}

abstract class CacheEntry {}
