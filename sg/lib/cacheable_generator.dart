import 'dart:async';

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
