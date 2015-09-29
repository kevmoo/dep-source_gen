// Thoughts

void main(List<String> args) {
  var project = getProject(args);

  pseudoCode(project);
}

pseudoCode(project) {
  // an iterable (list, set, whatever) of the configured generators for
  // `project`
  var generators = getConfiguredGenerators(project);

  // The SORTED list of libraries that are configured to be the target of
  // code generation for `generators`
  var genTargets =
      getSortedListOfLibrariesThatAreGenTargets(project, generators);

  for (var library in genTargets) {
    // Get the full analysis context for `library` and it's imports, BUT...
    // don't analyze any parts defined in `library` as being generated.
    // The 2nd+ times through, the context may contain generated API for
    // imported libraries.
    var preGenContext =
        getAnalysisContext(library, excludeGeneratedParts: true);

    for (var generator in generators.where((g) => g.matches(library))) {
      // every generator for `library` sees the same, `preGenContext`.
      // The contents of parts created by generator-1 are not seen in
      // generator-2,3...
      generator.generate(library, preGenContext);
    }
  }
}

List<Library> getSortedListOfLibrariesThatAreGenTargets(project, generators) {
  var allLibraries = getAllLibs(project)
      .where((lib) => generators.any((g) => g.matches(lib)))
      .toList();

  // sorts `libs` such that
  // For any pair of libs A,B;
  //   `A` appears before `B` if `B` depends on `A` (even transitively)
  //   If A and B have a circular dependency, throw!
  // TODO: Ponder if we can do better here – some weirdness
  sortLibs(allLibraries);

  return allLibraries;
}
